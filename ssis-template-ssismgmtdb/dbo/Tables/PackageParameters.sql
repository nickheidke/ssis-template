CREATE TABLE [dbo].[PackageParameters] (
    [Parameter_ID]    INT            IDENTITY (1, 1) NOT NULL,
    [Parameter_Name]  NVARCHAR (50)  NOT NULL,
    [Parameter_Value] NVARCHAR (150) NOT NULL,
    [Package_Name]    NVARCHAR (25)  NULL,
    CONSTRAINT [PK_SSIS_Parameters] PRIMARY KEY CLUSTERED ([Parameter_ID] ASC)
);

