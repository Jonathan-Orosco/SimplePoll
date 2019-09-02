CREATE TABLE [dbo].[UserAgents] (
    [UserAgentId] INT            IDENTITY (1, 1) NOT NULL,
    [UserAgent]   NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_UserAgents] PRIMARY KEY CLUSTERED ([UserAgentId] ASC)
);

