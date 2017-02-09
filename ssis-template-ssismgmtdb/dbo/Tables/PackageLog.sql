CREATE TABLE [dbo].[PackageLog] (
    [PackageLogID]           INT              IDENTITY (1, 1) NOT NULL,
    [PackageGUID]            UNIQUEIDENTIFIER NULL,
    [BatchLogID]             INT              NULL,
    [PackageName]            VARCHAR (200)    NULL,
    [PackageVersionID]       INT              NULL,
    [MachineName]            VARCHAR (64)     NULL,
    [UserName]               VARCHAR (64)     NULL,
    [InteractiveMode]        BIT              NULL,
    [ExecutionInstanceID]    UNIQUEIDENTIFIER NULL,
    [PackageStartTime]       DATETIME         CONSTRAINT [DF_Package_Log_Package_Start_Time] DEFAULT (getdate()) NULL,
    [PackageEndTime]         DATETIME         NULL,
    [Package_Status]         VARCHAR (20)     NULL,
    [TotalErrorCount]        INT              CONSTRAINT [DF_PackageLog_TotalErrorCount] DEFAULT ((0)) NULL,
    [TotalWarningCount]      INT              CONSTRAINT [DF_PackageLog_TotalWarningCount] DEFAULT ((0)) NULL,
    [Package_Execution_Time] TIME (7)         NULL,
    CONSTRAINT [PK_PackageLog] PRIMARY KEY CLUSTERED ([PackageLogID] ASC),
    CONSTRAINT [FK_PackageLog_BatchLog] FOREIGN KEY ([BatchLogID]) REFERENCES [dbo].[BatchLog] ([BatchLogID]),
    CONSTRAINT [FK_PackageLog_PackageVersion] FOREIGN KEY ([PackageVersionID]) REFERENCES [dbo].[PackageVersion] ([PackageVersionID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The SSIS Package Log Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'PackageLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Unique Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'PackageGUID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch Log unique Identification Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'BatchLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Version Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'PackageVersionID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Machine Name the SSIS Package was run on', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'MachineName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Name when the SSIS Package ran', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Interactive Mode Indicator  1 = Bids or Visual Studio, 0 = SQL Server Agent Job', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'InteractiveMode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Execution Identification Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'ExecutionInstanceID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Pacakage Starting Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'PackageStartTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package End Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'PackageEndTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package completion status, R = Running, F = Failed at some point, C = Completed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'Package_Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package execution Time in Seconds', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageLog', @level2type = N'COLUMN', @level2name = N'Package_Execution_Time';

