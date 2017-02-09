CREATE TABLE [dbo].[PackageTaskLog] (
    [PackageTaskLogID]    INT              IDENTITY (1, 1) NOT NULL,
    [PackageLogID]        INT              NOT NULL,
    [ControlName]         VARCHAR (255)    NULL,
    [ControlID]           UNIQUEIDENTIFIER NULL,
    [Task_Start_Time]     DATETIME         CONSTRAINT [DF_Package_Log_Package_Task_Start_Time] DEFAULT (getdate()) NULL,
    [Task_End_Time]       DATETIME         NULL,
    [TotalErrorCount]     INT              CONSTRAINT [DF_PackageTaskLog_TotalErrorCount] DEFAULT ((0)) NULL,
    [TotalWarningCount]   INT              CONSTRAINT [DF_PackageTaskLog_TotalWarningCount] DEFAULT ((0)) NULL,
    [Task_Execution_Time] TIME (7)         NULL,
    CONSTRAINT [PK_PackageTaskLog] PRIMARY KEY CLUSTERED ([PackageTaskLogID] ASC),
    CONSTRAINT [FK_PackageTaskLog_PackageLog] FOREIGN KEY ([PackageLogID]) REFERENCES [dbo].[PackageLog] ([PackageLogID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Task Package Log Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageTaskLog', @level2type = N'COLUMN', @level2name = N'PackageTaskLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Log Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageTaskLog', @level2type = N'COLUMN', @level2name = N'PackageLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Control Source Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageTaskLog', @level2type = N'COLUMN', @level2name = N'ControlName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Control Source Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageTaskLog', @level2type = N'COLUMN', @level2name = N'ControlID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Task Starting Date and Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageTaskLog', @level2type = N'COLUMN', @level2name = N'Task_Start_Time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Task Ending Date and Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageTaskLog', @level2type = N'COLUMN', @level2name = N'Task_End_Time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Task Execution Time in Seconds', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageTaskLog', @level2type = N'COLUMN', @level2name = N'Task_Execution_Time';

