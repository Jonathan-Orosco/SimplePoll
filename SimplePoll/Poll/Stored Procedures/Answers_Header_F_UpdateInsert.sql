
-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  1 2019  6:31PM
-- Description:    Stored Procedure for generic insert update
-- =============================================
CREATE PROCEDURE [Poll].[Answers_Header_F_UpdateInsert] 
     @AnswerHeaderId uniqueidentifier
    , @UserId bigint
    , @IpAddress nvarchar(50)
    , @TimeZoneId smallint = null
    , @IsDstTime bit = null
AS
BEGIN
SET NOCOUNT ON
    
    declare @_AnswerHeaderId uniqueidentifier
        , @_UserId bigint
        , @_IpAddress nvarchar(50)
        , @_TimeZoneId smallint
        , @_IsDstTime bit
		,@_CreatedDateUtc datetime
    
    set @_AnswerHeaderId = @AnswerHeaderId
    set @_UserId = @UserId
    set @_IpAddress = @IpAddress
    set @_TimeZoneId = nullif(@TimeZoneId,0)
    set @_IsDstTime = @IsDstTime
    set @_CreatedDateUtc = GETUTCDATE()

if @_AnswerHeaderId <> '00000000-0000-0000-0000-000000000000' 
    begin

        Update [Poll].[Answers_Header_F]
        set
         [UserId] = @_UserId
            , [IpAddress] = @_IpAddress
            , [TimeZoneId] = @_TimeZoneId
            , [IsDstTime] = @_IsDstTime
        where
            AnswerHeaderId = @_AnswerHeaderId
    end
    else
        begin
DECLARE @OutputRow TABLE (PK uniqueidentifier)
            insert into [Poll].[Answers_Header_F]
            (
                 [UserId]
                , [IpAddress]
                , [TimeZoneId]
                , [IsDstTime]
                , [CreatedDateUtc]
            )output Inserted.[AnswerHeaderId] into @OutputRow(PK)
            
            select
                  @_UserId
                , @_IpAddress
                , @_TimeZoneId
                , @_IsDstTime
                , @_CreatedDateUtc


			select @_AnswerHeaderId = pk	
			 from @OutputRow
    end
    select @_AnswerHeaderId as [AnswerHeaderId] 


end