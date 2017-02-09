CREATE TABLE [dbo].[PackageErrorDetail] (
    [PackageErrorDetailID] INT            IDENTITY (1, 1) NOT NULL,
    [PackageLogID]         INT            NULL,
    [BatchLogID]           INT            NULL,
    [ControlName]          VARCHAR (64)   NULL,
    [ErrorCode]            INT            NULL,
    [ErrorDescription]     VARCHAR (1000) NULL,
    [ErrorColumn]          VARCHAR (40)   NULL,
    [ErrorColumnName]      VARCHAR (50)   NULL,
    [Operation]            VARCHAR (20)   NULL,
    [DestTableName]        VARCHAR (20)   NULL,
    [DestDBPlatform]       VARCHAR (40)   NULL,
    [KeyColumn1Name]       VARCHAR (50)   NULL,
    [KeyColumn1Value]      NVARCHAR (50)  NULL,
    CONSTRAINT [PK_PackageErrorDetail] PRIMARY KEY CLUSTERED ([PackageErrorDetailID] ASC)
);

