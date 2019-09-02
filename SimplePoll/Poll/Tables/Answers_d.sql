CREATE TABLE [Poll].[Answers_d] (
    [AnswerId]       UNIQUEIDENTIFIER CONSTRAINT [DF_Answers_d_AnswerId] DEFAULT (newid()) NOT NULL,
    [QuestionId]     UNIQUEIDENTIFIER NOT NULL,
    [AnswerText]     NVARCHAR (50)    NOT NULL,
    [CreatedDateUtc] NCHAR (10)       NULL,
    CONSTRAINT [PK_Answers_d] PRIMARY KEY CLUSTERED ([AnswerId] ASC),
    CONSTRAINT [FK_Answers_d_Questions_d] FOREIGN KEY ([QuestionId]) REFERENCES [Poll].[Questions_d] ([QuestionId])
);

