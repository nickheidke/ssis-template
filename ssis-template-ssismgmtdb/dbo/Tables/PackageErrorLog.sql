CREATE TABLE [dbo].[PackageErrorLog] (
    [PackageErrorLogID] INT            IDENTITY (1, 1) NOT NULL,
    [PackageLogID]      INT            NULL,
    [PackageName]       VARCHAR (150)  NULL,
    [PackageID]         VARCHAR (50)   NULL,
    [EventType]         VARCHAR (15)   NULL,
    [ExecutionID]       VARCHAR (50)   NULL,
    [ControlName]       VARCHAR (64)   NULL,
    [ControlID]         VARCHAR (50)   NULL,
    [ErrorCode]         INT            NULL,
    [ErrorDescription]  VARCHAR (2000) NULL,
    [InteractiveMode]   BIT            NULL,
    [MachineName]       VARCHAR (50)   NULL,
    [UserName]          VARCHAR (50)   NULL,
    [BatchLogID]        INT            NULL,
    [EndBatchAudit]     BIT            NULL,
    [Log_Date]          DATETIME       CONSTRAINT [DF_Package_Error_Log_Log_Date] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PackageErrorLog] PRIMARY KEY CLUSTERED ([PackageErrorLogID] ASC),
    CONSTRAINT [FK_PackageErrorLog_PackageLog] FOREIGN KEY ([PackageLogID]) REFERENCES [dbo].[PackageLog] ([PackageLogID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Error Log Identification Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'PackageErrorLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Log identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'PackageLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Identification Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'PackageID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Event Type which caused the Error', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'EventType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Execution Identification Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'ExecutionID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Individual SSIS Control Name which caused the Error', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'ControlName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Identification Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'ControlID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Error Code Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'ErrorCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Error Code Description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'ErrorDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Interactive Mode Indicator  1 = Bids or Visual Studio, 0 = SQL Server Agent Job', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'InteractiveMode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Machine Name where the SSIS package was ran from', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'MachineName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The User Name the SSIS package was run with', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch Log Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'BatchLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch End indicator', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'EndBatchAudit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date and time the Error was logged', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageErrorLog', @level2type = N'COLUMN', @level2name = N'Log_Date';

