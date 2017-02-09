CREATE TABLE [dbo].[Package] (
    [PackageID]        INT              IDENTITY (1, 1) NOT NULL,
    [PackageGUID]      UNIQUEIDENTIFIER NOT NULL,
    [PackageName]      VARCHAR (255)    NOT NULL,
    [CreationDate]     DATETIME         NOT NULL,
    [CreatedBy]        VARCHAR (255)    NOT NULL,
    [Logging_DateTime] DATETIME         CONSTRAINT [DF_Package_Logging_DateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED ([PackageID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package GUID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageGUID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Creation Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Created by', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'CreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package logging Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'Logging_DateTime';

