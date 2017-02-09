/*****************************************************************************************************/  
/* Parameters:  @BatchLogID int, @PackageName VARCHAR(255), @ExecutionInstanceID uniqueidentifier    */
/*    ,@MachineName VARCHAR(64), @UserName VARCHAR(64), @StartDatetime datetime, @PackageVersionGUID */
/*     uniqueidentifier ,@VersionMajor int, @VersionMinor int, @VersionBuild int, @VersionComment    */
/*     VARCHAR(1000), @PackageGUID uniqueidentifier, @CreationDate datetime, @CreatedBy VARCHAR(255) */ 
/*                                                                                                   */  
/* Description: Logging the starting date and time for the SSIS package                              */
/*                                                                                                   */  
/* Programmer:                                                                                       */
/* Date Written:                                                                                     */
/* Change History:                                                                                   */
/* Usage: EXEC LogPackageStart BatchLogID, PackageName, @ExecutionInstanceID, @MachineName,@UserName */
/*            ,@StartDatetime , @PackageVersionGUID, @VersionMajor, @VersionMinor, @VersionBuild     */
/*            ,@VersionComment, @PackageGUID , @CreationDate , @CreatedBy                            */
/*****************************************************************************************************/     
CREATE PROCEDURE [dbo].[USP_LogPackageStart] (
     @BatchLogID          INT
   , @PackageName         VARCHAR(255) 
   , @ExecutionInstanceID UNIQUEIDENTIFIER 
   , @MachineName         VARCHAR(64) 
   , @UserName            VARCHAR(64) 
   , @StartDatetime       DATETIME 
   , @PackageVersionGUID  UNIQUEIDENTIFIER
   , @VersionMajor        INT 
   , @VersionMinor        INT 
   , @VersionBuild        INT 
   , @Version             VARCHAR(50) 
   , @VersionComment      VARCHAR(1000) 
   , @PackageGUID         UNIQUEIDENTIFIER 
   , @CreationDate        DATETIME 
   , @CreatedBy           VARCHAR(255)
   , @InteractiveMode     BIT           
   , @BatchName         VARCHAR(50)   
      )

AS
BEGIN
	BEGIN TRAN
		SET NOCOUNT ON
		DECLARE @PackageID  INT = 0
		, @PackageVersionID INT = 0
		, @PackageLogID     INT = 0
		, @StartDatetimeDB  DATETIME = GETDATE()

		/* Initialize Variables */

		/* Getting the SSIS Package Metadata ID */
		IF NOT EXISTS (SELECT 1 FROM dbo.Package WHERE PackageGUID = @PackageGUID AND PackageName = @PackageName)
		  BEGIN
			INSERT INTO dbo.Package (PackageGUID, PackageName, CreationDate, CreatedBy)
			VALUES (@PackageGUID, @PackageName, @CreationDate, @CreatedBy)
		  END

		SELECT @PackageID = PackageID FROM dbo.Package 
			WHERE PackageGUID = @PackageGUID AND PackageName = @PackageName

		/* Getting SSIS Package Version MetaData ID */
		IF NOT EXISTS (SELECT 1 FROM dbo.PackageVersion WHERE PackageVersionGUID = @PackageVersionGUID)
		  BEGIN
			INSERT INTO dbo.PackageVersion ( PackageVersionGUID, PackageID, VersionMajor, VersionMinor, VersionBuild, [Version], VersionComment)
			VALUES (@PackageVersionGUID, @PackageID, @VersionMajor, @VersionMinor, @VersionBuild,@Version, @VersionComment)
		  END

		SELECT @PackageVersionID = PackageVersionID FROM dbo.PackageVersion 
			WHERE PackageVersionGUID = @PackageVersionGUID

		/* Getting the BatchLogID */
		SELECT @BatchLogID = MAX(BatchLogID) 
		FROM dbo.BatchLog		
		WHERE BatchName = @BatchName 
		AND [Batch_Status] = 'R'
		GROUP BY BatchName

		IF ISNULL(@BatchLogID,0) = 0
		  BEGIN
			INSERT INTO dbo.BatchLog (BatchName, [Start_Date] , [Batch_Status])
		--	VALUES (@BatchName, @StartDatetime, 'R')              /* Storing the Batch Name, Starting Date Time, but marking the package as ""Running "  */
			VALUES (@BatchName, @StartDatetimeDB, 'R')     
			SELECT @BatchLogID = SCOPE_IDENTITY()
		  END

		/* Create PackageLog Record */
		INSERT INTO dbo.PackageLog (PackageGUID, BatchLogID, PackageName, PackageVersionID, MachineName, UserName, InteractiveMode, ExecutionInstanceID, PackageStartTime, Package_Status)
--		VALUES(@PackageVersionGUID, @BatchLogID,@PackageName ,@PackageVersionID, @MachineName, @UserName, @InteractiveMode,@ExecutionInstanceID, @StartDatetime, 'R')
		VALUES(@PackageVersionGUID, @BatchLogID,@PackageName ,@PackageVersionID, @MachineName, @UserName, @InteractiveMode,@ExecutionInstanceID, @StartDatetimeDB, 'R')
		SELECT @PackageLogID = SCOPE_IDENTITY()
		/* RETURNING the Databack to the SSIS Package  */

		SELECT @BatchLogID AS BatchLogID, @PackageLogID AS PackageLogID
	COMMIT
	
END