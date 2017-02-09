/**********************************************************************************************/  
/* Parameters: @PackageLogID (int) ,@VariableName (varchar(255)), @VariableValue varchar(Max) */
/*                                                                                            */
/* Description: Logging the variable changes which occured during package execution           */
/*                                                                                            */
/* Programmer:                                                                                */
/* Date Written:                                                                              */
/* Change History:                                                                            */
/*                                                                                            */
/* Usage: EXEC LogVariableValueChanged @PackageLogID, @VariableName, @VariableValue           */
/* ********************************************************************************************/     

CREATE PROCEDURE [dbo].[USP_LogVariableValueChanged] 
(    @PackageLogID   INT
   , @VariableName	 VARCHAR(255)
   , @VariableValue	 VARCHAR(Max) )

AS
BEGIN
	BEGIN TRAN
		SET NOCOUNT ON
		INSERT INTO dbo.PackageVariableLog(PackageLogID, VariableName, VariableValue, VariableChange_DateTime)
		VALUES (@PackageLogID, @VariableName, @VariableValue, GetDate() )
	COMMIT
END