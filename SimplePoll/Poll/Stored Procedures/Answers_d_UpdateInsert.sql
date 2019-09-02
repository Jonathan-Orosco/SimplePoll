-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  1 2019  6:31PM
-- Description:    Stored Procedure for generic insert update
-- =============================================
CREATE PROCEDURE [Poll].[Answers_d_UpdateInsert] 
     @AnswerId uniqueidentifier
    , @QuestionId uniqueidentifier
    , @AnswerText nvarchar(50)
AS
BEGIN
SET NOCOUNT ON
    
    declare @_AnswerId uniqueidentifier
        , @_QuestionId uniqueidentifier
        , @_AnswerText nvarchar(50)
        , @_CreatedDateUtc datetime
    
    set @_AnswerId = @AnswerId
    set @_QuestionId = @QuestionId
    set @_AnswerText = @AnswerText
    set @_CreatedDateUtc = GETUTCDATE()

if @_AnswerId <> '00000000-0000-0000-0000-000000000000' 
    begin

        Update [Poll].[Answers_d]
        set
         [QuestionId] = @_QuestionId
            , [AnswerText] = @_AnswerText
        where
            AnswerId = @_AnswerId
    end
    else
        begin
DECLARE @OutputRow TABLE (PK uniqueidentifier)
            insert into [Poll].[Answers_d]
            (
                [QuestionId]
                , [AnswerText]
                , [CreatedDateUtc]
            )output Inserted.[AnswerId] into @OutputRow(PK)
            
            select
                  @_QuestionId
                , @_AnswerText
                , @_CreatedDateUtc
			select @_AnswerId = pk	
			 from @OutputRow
    end
    select @_AnswerId as [AnswerId] 
end