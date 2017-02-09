CREATE TABLE [dbo].[BatchLog] (
    [BatchLogID]   INT          IDENTITY (1, 1) NOT NULL,
    [BatchName]    VARCHAR (50) NULL,
    [Start_Date]   DATETIME     CONSTRAINT [DF_Batch_Log_Start_Time] DEFAULT (getdate()) NULL,
    [End_Date]     DATETIME     NULL,
    [Batch_Status] VARCHAR (20) NULL,
    [Error_Flag]   VARCHAR (3)  CONSTRAINT [DF_Batch_Log_Error_Flag] DEFAULT ('No') NULL,
    CONSTRAINT [PK_BatchLog] PRIMARY KEY CLUSTERED ([BatchLogID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch Log unique Identification Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BatchLog', @level2type = N'COLUMN', @level2name = N'BatchLogID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch Starting Date and Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BatchLog', @level2type = N'COLUMN', @level2name = N'Start_Date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch Ending Date and time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BatchLog', @level2type = N'COLUMN', @level2name = N'End_Date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch Package Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BatchLog', @level2type = N'COLUMN', @level2name = N'Batch_Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Error Flag for the Package, (Secondary Flag )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BatchLog', @level2type = N'COLUMN', @level2name = N'Error_Flag';

