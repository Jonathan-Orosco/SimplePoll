-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Aug 31 2019  2:43PM
-- Description:    Stored Procedure for selecting project status
-- =============================================
Create PROCEDURE [Poll].[Answers_Header_F_Get]
     @PageSize tinyint = 50
    ,@PageIndex smallint = 1
    ,@AnswerHeaderId uniqueidentifier= '00000000-0000-0000-0000-000000000000' 
AS
BEGIN
SET NOCOUNT ON
    
    declare
    @_AnswerHeaderId 		uniqueidentifier
        , @_PageSize tinyint
        , @_PageIndex smallint
        , @_RangeStart int
        , @_RangeEnd int
    
    set @_AnswerHeaderId 		= @AnswerHeaderId
    set @_PageSize = isnull(@PageSize,50)
    set @_PageIndex = isnull(@PageIndex,1) - 0
    set @_RangeStart = ((@_PageIndex-1) * @_PageSize)  + 1
    set @_RangeEnd = @_RangeStart + @_PageSize - 2 

if @_AnswerHeaderId <> '00000000-0000-0000-0000-000000000000' 
    begin
        
        select
            [AnswerHeaderId]		= srcTable.[AnswerHeaderId]
            ,[UserId]				= srcTable.[UserId]
            ,[IpAddress]			= srcTable.[IpAddress]
            ,[TimeZoneId]			= srcTable.[TimeZoneId]
            ,[IsDstTime]			= srcTable.[IsDstTime]
            ,[CreatedDateUtc]		= srcTable.[CreatedDateUtc]
        from
            [Poll].[Answers_Header_F] as srcTable with(nolock)
        where
            srcTable.AnswerHeaderId = @_AnswerHeaderId
    end

else
    begin
        
        select
             [AnswerHeaderId]		= datPaged.[AnswerHeaderId]
            , [UserId]				= datPaged.[UserId]
            , [IpAddress]			= datPaged.[IpAddress]
            , [TimeZoneId]			= datPaged.[TimeZoneId]
            , [IsDstTime]			= datPaged.[IsDstTime]
            , [CreatedDateUtc]		= datPaged.[CreatedDateUtc]
        from
            ( /* datPaged */
                
                select
                      [AnswerHeaderId]		= srcTable.[AnswerHeaderId]
                    , [UserId]				= srcTable.[UserId]
                    , [IpAddress]			= srcTable.[IpAddress]
                    , [TimeZoneId]			= srcTable.[TimeZoneId]
                    , [IsDstTime]			= srcTable.[IsDstTime]
                    , [CreatedDateUtc]		= srcTable.[CreatedDateUtc]
                    , [SortNumber]  = row_number() over (order by srcTable.AnswerHeaderId)
                from
                    [Poll].[Answers_Header_F] as srcTable with(nolock)
            ) as datPaged
        where SortNumber between @_RangeStart and @_RangeEnd
    
    end
end