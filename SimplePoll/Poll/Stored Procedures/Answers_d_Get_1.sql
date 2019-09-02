

-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Aug 31 2019  2:43PM
-- Description:    Stored Procedure for selecting project status
-- =============================================
CREATE PROCEDURE [Poll].[Answers_d_Get]
     @PageSize				tinyint = 50
    ,@PageIndex				smallint = 1
    ,@AnswerId				uniqueidentifier= '00000000-0000-0000-0000-000000000000' 
	,@PollId				uniqueidentifier= '00000000-0000-0000-0000-000000000000' 
AS
BEGIN
SET NOCOUNT ON
    
    declare
		  @_AnswerId 				uniqueidentifier
		, @_PollId					uniqueidentifier
        , @_PageSize				tinyint
        , @_PageIndex				smallint
        , @_RangeStart				int
        , @_RangeEnd				int
    
    set @_AnswerId 					= isnull(@AnswerId,'00000000-0000-0000-0000-000000000000')
	set @_PollId					= isnull(@PollId,'00000000-0000-0000-0000-000000000000')
    set @_PageSize					= isnull(@PageSize,50)
    set @_PageIndex					= isnull(@PageIndex,1) - 0
    set @_RangeStart				= ((@_PageIndex-1) * @_PageSize)  + 1
    set @_RangeEnd					= @_RangeStart + @_PageSize - 2 

if @_AnswerId <> '00000000-0000-0000-0000-000000000000' 
    begin
        
        select
            [AnswerId]				= srcTable.[AnswerId]
            ,[QuestionId]			= srcTable.[QuestionId]
            ,[AnswerText]			= srcTable.[AnswerText]
            ,[CreatedDateUtc]		= srcTable.[CreatedDateUtc]
        from
            [Poll].[Answers_d] as srcTable with(nolock)
        where
            srcTable.AnswerId = @_AnswerId
    end
if @_PollId <> '00000000-0000-0000-0000-000000000000' 
    begin
        
        select
            [AnswerId]				= srcTable.[AnswerId]
            ,[QuestionId]			= srcTable.[QuestionId]
            ,[AnswerText]			= srcTable.[AnswerText]
            ,[CreatedDateUtc]		= srcTable.[CreatedDateUtc]
        from
            [Poll].[Answers_d] as srcTable with(nolock)
			inner join
			[Poll].[Questions_d]  as defQ with(nolock)
				on srcTable.QuestionId = defQ.QuestionId
				and  defQ.PollId = @_PollId
    end
else
    begin
        
        select
             [AnswerId]				= datPaged.[AnswerId]
            , [QuestionId]			= datPaged.[QuestionId]
            , [AnswerText]			= datPaged.[AnswerText]
            , [CreatedDateUtc]		= datPaged.[CreatedDateUtc]
        from
            ( /* datPaged */
                
                select
                      [AnswerId]				= srcTable.[AnswerId]
                    , [QuestionId]			= srcTable.[QuestionId]
                    , [AnswerText]			= srcTable.[AnswerText]
                    , [CreatedDateUtc]		= srcTable.[CreatedDateUtc]
                    , [SortNumber]  = row_number() over (order by srcTable.AnswerId)
                from
                    [Poll].[Answers_d] as srcTable with(nolock)
            ) as datPaged
        where SortNumber between @_RangeStart and @_RangeEnd
    
    end
end