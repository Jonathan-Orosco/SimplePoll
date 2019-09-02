-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Aug 31 2019  2:43PM
-- Description:    Stored Procedure for selecting project status
-- =============================================
Create PROCEDURE [Poll].[Info_Get]
     @PageSize tinyint = 50
    ,@PageIndex smallint = 1
    ,@PollId uniqueidentifier= '00000000-0000-0000-0000-000000000000' 
AS
BEGIN
SET NOCOUNT ON
    
    declare
    @_PollId 				uniqueidentifier
        , @_PageSize tinyint
        , @_PageIndex smallint
        , @_RangeStart int
        , @_RangeEnd int
    
    set @_PollId 				= @PollId
    set @_PageSize = isnull(@PageSize,50)
    set @_PageIndex = isnull(@PageIndex,1) - 0
    set @_RangeStart = ((@_PageIndex-1) * @_PageSize)  + 1
    set @_RangeEnd = @_RangeStart + @_PageSize - 2 

if @_PollId <> '00000000-0000-0000-0000-000000000000' 
    begin
        
        select
            [PollId]				= srcTable.[PollId]
            ,[PollName]				= srcTable.[PollName]
            ,[PollDescription]		= srcTable.[PollDescription]
            ,[CreatedDateUtc]		= srcTable.[CreatedDateUtc]
        from
            [Poll].[Info] as srcTable with(nolock)
        where
            srcTable.PollId = @_PollId
    end

else
    begin
        
        select
             [PollId]				= datPaged.[PollId]
            , [PollName]				= datPaged.[PollName]
            , [PollDescription]		= datPaged.[PollDescription]
            , [CreatedDateUtc]		= datPaged.[CreatedDateUtc]
        from
            ( /* datPaged */
                
                select
                      [PollId]				= srcTable.[PollId]
                    , [PollName]				= srcTable.[PollName]
                    , [PollDescription]		= srcTable.[PollDescription]
                    , [CreatedDateUtc]		= srcTable.[CreatedDateUtc]
                    , [SortNumber]  = row_number() over (order by srcTable.PollId)
                from
                    [Poll].[Info] as srcTable with(nolock)
            ) as datPaged
        where SortNumber between @_RangeStart and @_RangeEnd
    
    end
end