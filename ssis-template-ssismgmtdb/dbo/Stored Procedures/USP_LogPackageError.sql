/*******************************************************************************************************/  
/* Parameters: @PackageLogID int, @PackageName VARCHAR(150) , @EventType VARCHAR(15)                   */
/*             , @ExecutionID VARCHAR(50),@PackageID VARCHAR(50), @SourceName VARCHAR(64)              */
/*             , @SourceID VARCHAR(50), @ErrorCode int, @ErrorDescription VARCHAR(2000)                */
/*             , @InteractiveMode bit , @MachineName VARCHAR(50), @UserName VARCHAR(50)                */
/*             , @BatchLogID int, @EndBatchAudit bit )                                                 */
/*                                                                                                     */
/* Description: Logging any Error(s) which occur during SSIS Package execution.                        */
/*                                                                                                     */
/* Programmer:                                                                                         */
/* Date Written:                                                                                       */
/* Change History:                                                                                     */
/*                                                                                                     */
/* Usage: EXEC LogPackageError ( @PackageLogID int, @PackageName VARCHAR(150) , @PackageID VARCHAR(50) */
/*        , @EventType VARCHAR(15), @ExecutionID VARCHAR(50), @SourceName VARCHAR(64), @SourceID       */
/*         VARCHAR(50), @ErrorCode int, @ErrorDescription VARCHAR(2000) , @InteractiveMode bit ,       */
/*          @MachineName VARCHAR(50), @UserName VARCHAR(50),@BatchLogID int, @EndBatchAudit bit )      */
/*                                                                                                     */
/* *****************************************************************************************************/     
CREATE PROCEDURE [dbo].[USP_LogPackageError]
( @PackageLogID int, @PackageName VARCHAR(150) , @PackageID VARCHAR(50) , @EventType VARCHAR(15), @ExecutionID VARCHAR(50), @SourceName	VARCHAR(64)
, @SourceID VARCHAR(50) , @ErrorCode INT , @ErrorDescription VARCHAR(2000) , @InteractiveMode BIT , @MachineName VARCHAR(50), @UserName VARCHAR(50)
, @BatchLogID INT, @EndBatchAudit BIT )

AS
BEGIN TRAN
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER ON 

	INSERT INTO dbo.PackageErrorLog(PackageLogID, PackageName, EventType, ExecutionID, PackageID, ControlName, ControlID, ErrorCode, ErrorDescription, InteractiveMode, MachineName, UserName, BatchLogID, EndBatchAudit )
	VALUES(@PackageLogID, @PackageName,  @EventType, @ExecutionID, @PackageID, @SourceName, @SourceID, @ErrorCode , @ErrorDescription, @InteractiveMode, @MachineName, @UserName, @BatchLogID, @EndBatchAudit )

		IF @EventType='E'
	BEGIN
		
		-- error count maintenance

		UPDATE [dbo].[PackageLog] 
		SET [TotalErrorCount]= COALESCE([TotalErrorCount],0) + 1  
		WHERE PackageLogId=@PackageLogId 

		UPDATE [dbo].[PackageTaskLog]
		SET [TotalErrorCount]= COALESCE([TotalErrorCount],0) + 1  
		WHERE PackageLogId=@PackageLogId AND ControlID=@SourceID 

	END
	ELSE
	BEGIN
		UPDATE [dbo].[PackageLog] 
		SET [TotalWarningCount]= COALESCE([TotalWarningCount],0) + 1  
		WHERE PackageLogId=@PackageLogId 

		UPDATE [dbo].[PackageTaskLog]
		SET [TotalWarningCount]= COALESCE([TotalWarningCount],0) + 1  
		WHERE PackageLogId=@PackageLogId AND ControlID=@SourceID 
	END;


	UPDATE dbo.PackageLog
	SET [Package_Status]= 'F'                  /* Making the package as Failed       */
	   ,[PackageEndTime] = GetDate()           /* Updating the package End Date Time */
	WHERE PackageLogID = @PackageLogID

	IF @EndBatchAudit = 1
		Begin
			UPDATE dbo.BatchLog
			SET [Batch_Status] = 'F'            /* Making the package as Failed       */
			 ,  [End_Date] = GetDate()          /* Updating the Batch End Date Time   */
			WHERE BatchLogID = @BatchLogID
		End

COMMIT