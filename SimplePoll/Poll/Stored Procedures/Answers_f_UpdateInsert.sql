
-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  1 2019  6:31PM
-- Description:    Stored Procedure for generic insert update
-- =============================================
CREATE PROCEDURE [Poll].[Answers_f_UpdateInsert] 
     @AnswerHeaderId uniqueidentifier
    , @QuestionId uniqueidentifier
    , @AnswerId uniqueidentifier
AS
BEGIN
SET NOCOUNT ON
    
    declare @_AnswerHeaderId uniqueidentifier
        , @_QuestionId uniqueidentifier
        , @_AnswerId uniqueidentifier
        , @_CreatedDateUtc datetime
    
    set @_AnswerHeaderId = @AnswerHeaderId
    set @_QuestionId = @QuestionId
    set @_AnswerId = @AnswerId
    set @_CreatedDateUtc = GETUTCDATE()

DECLARE @OutputRow TABLE (PK uniqueidentifier)
            insert into [Poll].[Answers_f]
            (
				[AnswerHeaderId]
                  ,[QuestionId]
                , [AnswerId]
                , [CreatedDateUtc]
            )output Inserted.[AnswerHeaderId] into @OutputRow(PK)
            
            select
				@_AnswerHeaderId
                 ,@_QuestionId
                , @_AnswerId
                , @_CreatedDateUtc

 select @@ROWCOUNT as AffectedRows
end