CREATE TABLE [Poll].[Answers_f] (
    [AnswerHeaderId] UNIQUEIDENTIFIER NOT NULL,
    [QuestionId]     UNIQUEIDENTIFIER NOT NULL,
    [AnswerId]       UNIQUEIDENTIFIER NULL,
    [CreatedDateUtc] DATETIME         CONSTRAINT [DF_Answers_f_CreatedDateUtc] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [FK_Answers_f_Answers_d] FOREIGN KEY ([AnswerId]) REFERENCES [Poll].[Answers_d] ([AnswerId]),
    CONSTRAINT [FK_Answers_f_Answers_Header_F] FOREIGN KEY ([AnswerHeaderId]) REFERENCES [Poll].[Answers_Header_F] ([AnswerHeaderId]),
    CONSTRAINT [FK_Answers_f_Questions_d] FOREIGN KEY ([QuestionId]) REFERENCES [Poll].[Questions_d] ([QuestionId])
);

