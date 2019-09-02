-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  1 2019  6:31PM
-- Description:    Stored Procedure for generic insert update
-- =============================================
CREATE PROCEDURE [Poll].[Questions_d_UpdateInsert] 
     @QuestionId uniqueidentifier
    , @PollId uniqueidentifier
    , @QuestionText nvarchar(50)
    , @QuestionValue decimal(18,4)
AS
BEGIN
SET NOCOUNT ON
    
    declare @_QuestionId uniqueidentifier
        , @_PollId uniqueidentifier
        , @_QuestionText nvarchar(50)
        , @_QuestionValue decimal(18,4)
        , @_CreatedDateUtc datetime
    
    set @_QuestionId = @QuestionId
    set @_PollId = @PollId
    set @_QuestionText = @QuestionText
    set @_QuestionValue = @QuestionValue
    set @_CreatedDateUtc = GETUTCDATE()

if @_QuestionId <> '00000000-0000-0000-0000-000000000000' 
    begin

        Update [Poll].[Questions_d]
        set
         [PollId] = @_PollId
            , [QuestionText] = @_QuestionText
            , [QuestionValue] = @_QuestionValue
        where
            QuestionId = @_QuestionId
    end
    else
        begin
DECLARE @OutputRow TABLE (PK uniqueidentifier)
            insert into [Poll].[Questions_d]
            (
                 [PollId]
                , [QuestionText]
                , [QuestionValue]
                , [CreatedDateUtc]
            )output Inserted.[QuestionId] into @OutputRow(PK)
            
            select
                  @_PollId
                , @_QuestionText
                , @_QuestionValue
                , @_CreatedDateUtc
			 select @_QuestionId = pk	
			 from @OutputRow

    end
    select @_QuestionId as [QuestionId] 
end