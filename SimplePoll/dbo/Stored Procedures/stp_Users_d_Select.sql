-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Aug 31 2019  2:43PM
-- Description:    Stored Procedure for selecting project status
-- =============================================
Create PROCEDURE [dbo].[stp_Users_d_Select]
     @PageSize tinyint = 50
    ,@PageIndex smallint = 1
    ,@UserId bigint
AS
BEGIN
SET NOCOUNT ON
    
    declare
    @_UserId 				bigint
        , @_PageSize tinyint
        , @_PageIndex smallint
        , @_RangeStart int
        , @_RangeEnd int
    
    set @_UserId 				= @UserId
    set @_PageSize = isnull(@PageSize,50)
    set @_PageIndex = isnull(@PageIndex,1) - 0
    set @_RangeStart = ((@_PageIndex-1) * @_PageSize)  + 1
    set @_RangeEnd = @_RangeStart + @_PageSize - 2 

if @_UserId > 0
    begin
        
        select
            [UserId]				= srcTable.[UserId]
            ,[UserName]				= srcTable.[UserName]
            ,[CreatedDateUtc]		= srcTable.[CreatedDateUtc]
            ,[DeletedDateUtc]		= srcTable.[DeletedDateUtc]
        from
            [dbo].[Users_d] as srcTable with(nolock)
        where
            srcTable.UserId = @_UserId
    end

else
    begin
        
        select
             [UserId]				= datPaged.[UserId]
            , [UserName]				= datPaged.[UserName]
            , [CreatedDateUtc]		= datPaged.[CreatedDateUtc]
            , [DeletedDateUtc]		= datPaged.[DeletedDateUtc]
        from
            ( /* datPaged */
                
                select
                      [UserId]				= srcTable.[UserId]
                    , [UserName]				= srcTable.[UserName]
                    , [CreatedDateUtc]		= srcTable.[CreatedDateUtc]
                    , [DeletedDateUtc]		= srcTable.[DeletedDateUtc]
                    , [SortNumber]  = row_number() over (order by srcTable.UserId)
                from
                    [dbo].[Users_d] as srcTable with(nolock)
            ) as datPaged
        where SortNumber between @_RangeStart and @_RangeEnd
    
    end
end