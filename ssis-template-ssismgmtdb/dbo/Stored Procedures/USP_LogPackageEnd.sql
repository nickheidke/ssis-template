/*******************************************************************************************/  
/* Parameters: @PackageLogID (int), @BatchLogID (int), @EndBatchAudit (bit)                */
/* Description: Logging the End date and time of the package.                              */
/*                                                                                         */
/* Programmer:                                                                             */
/* Date Written:                                                                           */
/* Change History:                                                                         */
/*                                                                                         */
/* Usage: EXEC LogPackageEnd  @PackageLogID (int), @BatchLogID (int), @EndBatchAudit (bit) */
/* *****************************************************************************************/     
CREATE PROCEDURE [dbo].[USP_LogPackageEnd]
(    @PackageLogID  int
   , @BatchLogID    int
   , @EndBatchAudit bit = 0)

AS
BEGIN
	BEGIN TRAN
			DECLARE @Execution_Time         TIME      ,
					@Package_StartDateTime  Datetime

			SET @Package_StartDateTime = (SELECT PackageStartTime FROM dbo.PackageLog
										  WHERE PackageLogID  = @PackageLogID
											AND BatchLogID    = @BatchLogID   
									--		AND PackageEndTime IS NULL 
											)
			
			/* Calculating the execution time in seconds */
			SET @Execution_Time = (SELECT CONVERT(Time,GETDATE() - @Package_StartDateTime) )
			
			SET NOCOUNT ON
			/* Updating the existing records */
			UPDATE dbo.PackageLog
			SET [Package_Status]         = 'C'             ,  /* Marking the Record as Completed        */
				[PackageEndTime]         = GetDate()       ,  /* Updating the execution time in seconds */
				[Package_Execution_Time] = @Execution_Time
			WHERE PackageLogID = @PackageLogID

			IF @EndBatchAudit = 1
				Begin
					UPDATE dbo.BatchLog
					SET [Batch_Status] = 'C' ,
						[End_Date]     = GetDate()
					WHERE BatchLogID   = @BatchLogID
				End
				
	COMMIT
END