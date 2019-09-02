CREATE TABLE [dbo].[Users_d] (
    [UserId]         BIGINT         IDENTITY (-9223372036854775808, 1) NOT NULL,
    [UserName]       NVARCHAR (255) NOT NULL,
    [CreatedDateUtc] DATETIME       CONSTRAINT [DF_Users_d_CreatedDateUtc] DEFAULT (getutcdate()) NOT NULL,
    [DeletedDateUtc] DATETIME       NULL,
    CONSTRAINT [PK_Users_d] PRIMARY KEY CLUSTERED ([UserId] ASC)
);

