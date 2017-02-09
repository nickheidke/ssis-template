CREATE TABLE [dbo].[PackageVersion] (
    [PackageVersionID]   INT              IDENTITY (1, 1) NOT NULL,
    [PackageVersionGUID] UNIQUEIDENTIFIER NULL,
    [PackageID]          INT              NULL,
    [VersionMajor]       INT              NULL,
    [VersionMinor]       INT              NULL,
    [VersionBuild]       INT              NULL,
    [Version]            VARCHAR (50)     NULL,
    [VersionComment]     VARCHAR (1000)   NULL,
    [Logging_DateTime]   DATETIME         CONSTRAINT [DF_Package_Version_Logging_DateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Package_Version] PRIMARY KEY CLUSTERED ([PackageVersionID] ASC),
    CONSTRAINT [FK_PackageVersion_Package] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Package] ([PackageID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Version Identification Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVersion', @level2type = N'COLUMN', @level2name = N'PackageVersionID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Version GUID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVersion', @level2type = N'COLUMN', @level2name = N'PackageVersionGUID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Identification number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVersion', @level2type = N'COLUMN', @level2name = N'PackageID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Version Major number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVersion', @level2type = N'COLUMN', @level2name = N'VersionMajor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Version Minor number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVersion', @level2type = N'COLUMN', @level2name = N'VersionMinor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Build Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVersion', @level2type = N'COLUMN', @level2name = N'VersionBuild';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Version Comments', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVersion', @level2type = N'COLUMN', @level2name = N'VersionComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SSIS Package Logging Date Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageVersion', @level2type = N'COLUMN', @level2name = N'Logging_DateTime';

