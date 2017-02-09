CREATE  procedure [dbo].[USP_LogPackageStatistics]
	 @PackageLogID				int
	,@PackageName		varchar(50)
	,@TaskName			varchar(50)
	,@ComponentName		varchar(50)
--	,@PackageVersion	varchar(20)
	,@Rows				int
	,@TimeMS			int
	,@MinRowsPerSec		int = null
	,@MaxRowsPerSec		int = null
with execute as caller
as
/**********************************************************************************************************
* SP Name:
*		dbo.USP_LogPackageStatistics
* Parameters:
*		 @logID				int
*		,@ComponentName		varchar(50)
*		,@Rows				int
*		,@TimeMS			int
*		,@MinRowsPerSec		int = null
*		,@MaxRowsPerSec		int = null
*  
* Purpose:	This stored procedure logs an entry to the custom RowCount-log table.
*              
* Example:
		exec audit.up_Event_Package_OnCount 0, 'Test', 100, 1000, 5, 50
		select * from audit.StatisticLog where LogID = 0
*              
**********************************************************************************************************/
begin
	set nocount on
	DECLARE @PackageTaskLogID     INT

	SET @PackageTaskLogID = (SELECT PackageTaskLogID FROM dbo.PackageTaskLog
								 WHERE [PackageLogID]  = @PackageLogID
								   AND [ControlName]   = @TaskName
								   AND ISNULL([Task_End_Time],'') = '')

	--Insert the record
	insert into dbo.PackageStatistics(
		PackageLogID, PackageTaskLogID, PackageName, TaskName, ComponentName, Rows, TimeMS, MinRowsPerSec, MaxRowsPerSec
	) 
	values 
	(
	@PackageLogID,isnull(@PackageTaskLogID, 0),  @PackageName, @TaskName, @ComponentName,  @Rows, @TimeMS, @MinRowsPerSec, @MaxRowsPerSec
	)

	set nocount off
end --proc