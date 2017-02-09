/********************************************************************************************************/  
/* Parameters: @PackageLogID (int), @SourceID (uniqueidentifier), @PackageID (uniqueidentifier)         */
/*                                                                                                      */
/* Description: Logging the individual Task Ending date and time                                        */
/*                                                                                                      */
/* Programmer:					                                                                        */
/* Date Written:                                                                                        */
/* Change History:                                                                                      */
/*                                                                                                      */
/* Usage: EXEC LogTaskPostExecute @PackageLogID, @SourceID uniqueidentifier,@PackageID uniqueidentifier */
/* ******************************************************************************************************/     

CREATE PROCEDURE [dbo].[USP_LogTaskPostExecute] 
   ( @PackageLogID  INT
    , @SourceName   VARCHAR(255)
    , @SourceID     UNIQUEIDENTIFIER 
    , @PackageID    UNIQUEIDENTIFIER )

AS
BEGIN
	BEGIN TRAN
		DECLARE @PackageTaskLogID     INT         ,
				@Execution_Time       TIME        ,
				@Task_Start_DateTime  Datetime

		/* Getting the Task Start Date and Time and PackageTaskLogID to update */
		SET @PackageTaskLogID = (SELECT PackageTaskLogID FROM dbo.PackageTaskLog
								 WHERE [PackageLogID]  = @PackageLogID
								   AND [ControlName]   = @SourceName
								   AND [CONTROLID]     = @SourceID
								   AND ISNULL([Task_End_Time],'') = '')

		SET @Task_Start_DateTime = (SELECT Task_Start_Time FROM dbo.PackageTaskLog
								    WHERE [PackageLogID]  = @PackageLogID
								      AND [ControlName]   = @SourceName
								      AND [ControlID]     = @SourceID
								      AND ISNULL([Task_End_Time],'') = '')
		  
		/* Calculating the execution time in seconds */
		SET @Execution_Time = (SELECT CONVERT(Time,GETDATE() -  @Task_Start_DateTime) )
		
		SET NOCOUNT ON
	    
       	UPDATE dbo.PackageTaskLog 
		SET [Task_End_Time]       = GetDate()        ,  /*  Marking the Task End Date Time        */
			[Task_Execution_Time] = @Execution_Time     /* Updating the execution time in seconds */
		WHERE [PackageTaskLogID]  = @PackageTaskLogID
		  AND [PackageLogID]      = @PackageLogID
		  AND [ControlName]       = @SourceName
		  AND [ControlID]         = @SourceID
		  AND ISNULL([Task_End_Time],'') = ''
	COMMIT           
         
END