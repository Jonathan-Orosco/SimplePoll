CREATE TABLE [Poll].[Questions_d] (
    [QuestionId]     UNIQUEIDENTIFIER CONSTRAINT [DF_Questions_d_QuestionId] DEFAULT (newid()) NOT NULL,
    [PollId]         UNIQUEIDENTIFIER NOT NULL,
    [QuestionText]   NVARCHAR (50)    NOT NULL,
    [QuestionValue]  DECIMAL (18, 4)  NULL,
    [CreatedDateUtc] DATETIME         CONSTRAINT [DF_Questions_d_CreatedDateUtc] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Questions_d] PRIMARY KEY CLUSTERED ([QuestionId] ASC),
    CONSTRAINT [FK_Questions_d_Info] FOREIGN KEY ([PollId]) REFERENCES [Poll].[Info] ([PollId])
);

