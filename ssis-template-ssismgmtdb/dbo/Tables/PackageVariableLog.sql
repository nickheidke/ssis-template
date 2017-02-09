CREATE TABLE [dbo].[PackageVariableLog] (
    [PackageVariableLogID]    INT           IDENTITY (1, 1) NOT NULL,
    [PackageLogID]            INT           NOT NULL,
    [VariableName]            VARCHAR (255) NULL,
    [VariableValue]           VARCHAR (MAX) NULL,
    [VariableChange_DateTime] DATETIME      CONSTRAINT [DF_Package_Variable_Log_Variable_Change_DateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Package_Variable_Log] PRIMARY KEY CLUSTERED ([PackageVariableLogID] ASC),
    CONSTRAINT [FK_PackageVariableLog_PackageLog] FOREIGN KEY ([PackageLogID]) REFERENCES [dbo].[PackageLog] ([PackageLogID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Variable Log Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVariableLog', @level2type = N'COLUMN', @level2name = N'PackageVariableLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Log Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVariableLog', @level2type = N'COLUMN', @level2name = N'PackageLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Variable Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVariableLog', @level2type = N'COLUMN', @level2name = N'VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Variable Value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVariableLog', @level2type = N'COLUMN', @level2name = N'VariableValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Variable Change Date and Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVariableLog', @level2type = N'COLUMN', @level2name = N'VariableChange_DateTime';

