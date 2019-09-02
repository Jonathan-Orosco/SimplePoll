CREATE TABLE [Poll].[Answers_Header_F] (
    [AnswerHeaderId] UNIQUEIDENTIFIER CONSTRAINT [DF_Answers_Header_F_AnswerHeaderId] DEFAULT (newid()) NOT NULL,
    [UserId]         BIGINT           NOT NULL,
    [IpAddress]      NVARCHAR (50)    NULL,
    [TimeZoneId]     TINYINT          NOT NULL,
    [IsDstTime]      BIT              NOT NULL,
    [CreatedDateUtc] DATETIME         CONSTRAINT [DF_Answers_Header_F_CreatedDateUtc] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Answers_Header_F] PRIMARY KEY CLUSTERED ([AnswerHeaderId] ASC),
    CONSTRAINT [FK_Answers_Header_F_Users_d] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users_d] ([UserId])
);

