/********************************************************************************************/  
/* Parameters: @PackageLogID (int), @SourceName (varchar(64)), @SourceID (uniqueidentifier) */
/*            ,@PackageID uniqueidentifier                                                  */
/*                                                                                          */
/* Description: Logging the individual Task starting date and time                          */
/*                                                                                          */
/* Programmer:				                                                                */
/* Date Written:                                                                            */
/* Change History:                                                                          */
/*                                                                                          */
/* Usage: EXEC [dbo].[LogTaskPreExecute]                                                    */ 
/* ******************************************************************************************/     
CREATE PROCEDURE [dbo].[USP_LogTaskPreExecute] (@PackageLogID INT
    , @SourceName VARCHAR(64)
    , @SourceID   UNIQUEIDENTIFIER 
    , @PackageID  UNIQUEIDENTIFIER )

AS
BEGIN
    BEGIN TRAN
	    SET NOCOUNT ON

		DECLARE @PackageTaskLogID  INT = 0
		IF @PackageID <> @SourceID
			AND @SourceName <> 'SQL_LogPackageStart'
			AND @SourceName <> 'SQL_LogPackageEnd'
			INSERT INTO dbo.PackageTaskLog (PackageLogID, ControlName , ControlID, Task_Start_Time)
			VALUES (@PackageLogID, @SourceName, @SourceID, GetDate())
		 /*******************************************************************************************************/
		 /*Note: If you are getting an Error that leads to this stored proecedure you changed the the template  */
		 /*      first task name from "SQL LogPackageStart" to something else. So change the Task Name back to  */
		 /*      "SQL LogPackageStart" or add the Name to the list above.                                       */
		 /*******************************************************************************************************/

		 --SELECT @PackageTaskLogID = SCOPE_IDENTITY()
		/* RETURNING the Databack to the SSIS Package  */

		--SELECT @PackageTaskLogID AS PackageTaskLogID
	COMMIT
	
END