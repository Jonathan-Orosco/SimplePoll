CREATE TABLE [Poll].[Info] (
    [PollId]          UNIQUEIDENTIFIER CONSTRAINT [DF_Info_PollId] DEFAULT (newid()) NOT NULL,
    [PollName]        NVARCHAR (50)    NOT NULL,
    [PollDescription] NVARCHAR (255)   NULL,
    [CreatedDateUtc]  DATETIME         NOT NULL,
    CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED ([PollId] ASC)
);

