
-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Aug 31 2019  2:43PM
-- Description:    Stored Procedure for selecting project status
-- =============================================
CREATE PROCEDURE [Poll].[Questions_d_Get]
     @PageSize		tinyint = 50
    ,@PageIndex		smallint = 1
    ,@QuestionId	uniqueidentifier= '00000000-0000-0000-0000-000000000000' 
	,@PollId		uniqueidentifier= '00000000-0000-0000-0000-000000000000' 
AS
BEGIN
SET NOCOUNT ON
    
    declare
		  @_QuestionId 			uniqueidentifier
		, @_PollId				uniqueidentifier
        , @_PageSize			tinyint
        , @_PageIndex			smallint
        , @_RangeStart			int
        , @_RangeEnd			int
    
    set @_QuestionId 			= isnull(@QuestionId,'00000000-0000-0000-0000-000000000000' )
	set @_PollId				= isnull(@PollId,'00000000-0000-0000-0000-000000000000' )
    set @_PageSize				= isnull(@PageSize,50)
    set @_PageIndex				= isnull(@PageIndex,1) - 0
    set @_RangeStart			= ((@_PageIndex-1) * @_PageSize)  + 1
    set @_RangeEnd				= @_RangeStart + @_PageSize - 2 

if @_QuestionId <> '00000000-0000-0000-0000-000000000000' 
    begin
        
        select
            [QuestionId]			= srcTable.[QuestionId]
            ,[PollId]				= srcTable.[PollId]
            ,[QuestionText]			= srcTable.[QuestionText]
            ,[QuestionValue]		= srcTable.[QuestionValue]
            ,[CreatedDateUtc]		= srcTable.[CreatedDateUtc]
        from
            [Poll].[Questions_d] as srcTable with(nolock)
        where
            srcTable.QuestionId = @_QuestionId
    end
else if @_PollId <> '00000000-0000-0000-0000-000000000000' 
    begin
        
        select
            [QuestionId]			= srcTable.[QuestionId]
            ,[PollId]				= srcTable.[PollId]
            ,[QuestionText]			= srcTable.[QuestionText]
            ,[QuestionValue]		= srcTable.[QuestionValue]
            ,[CreatedDateUtc]		= srcTable.[CreatedDateUtc]
        from
            [Poll].[Questions_d] as srcTable with(nolock)
        where
            srcTable.[PollId] = @_PollId
    end
else
    begin
        
        select
             [QuestionId]			= datPaged.[QuestionId]
            , [PollId]				= datPaged.[PollId]
            , [QuestionText]			= datPaged.[QuestionText]
            , [QuestionValue]		= datPaged.[QuestionValue]
            , [CreatedDateUtc]		= datPaged.[CreatedDateUtc]
        from
            ( /* datPaged */
                
                select
                      [QuestionId]			= srcTable.[QuestionId]
                    , [PollId]				= srcTable.[PollId]
                    , [QuestionText]			= srcTable.[QuestionText]
                    , [QuestionValue]		= srcTable.[QuestionValue]
                    , [CreatedDateUtc]		= srcTable.[CreatedDateUtc]
                    , [SortNumber]  = row_number() over (order by srcTable.QuestionId)
                from
                    [Poll].[Questions_d] as srcTable with(nolock)
            ) as datPaged
        where SortNumber between @_RangeStart and @_RangeEnd
    
    end
end