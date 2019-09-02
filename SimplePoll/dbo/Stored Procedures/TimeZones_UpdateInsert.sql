-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  1 2019  6:31PM
-- Description:    Stored Procedure for generic insert update
-- =============================================
CREATE PROCEDURE [dbo].[TimeZones_UpdateInsert] 
     @TimeZoneId smallint
    , @DisplayName nvarchar(100)
    , @OffsetMinutes smallint
AS
BEGIN
SET NOCOUNT ON
    
    declare @_TimeZoneId smallint
        , @_DisplayName nvarchar(100)
        , @_OffsetMinutes smallint
    
    set @_TimeZoneId = @TimeZoneId
    set @_DisplayName = @DisplayName
    set @_OffsetMinutes = @OffsetMinutes

if @_TimeZoneId > 0
    begin

        Update [dbo].[TimeZones]
        set
         [DisplayName] = @_DisplayName
            , [OffsetMinutes] = @_OffsetMinutes
        where
            TimeZoneId = @_TimeZoneId
    end
    else
        begin

            insert into [dbo].[TimeZones]
            (
                 [TimeZoneId]
                , [DisplayName]
                , [OffsetMinutes]
            )
            
            select
                 @_TimeZoneId
                , @_DisplayName
                , @_OffsetMinutes
                set @_TimeZoneId = @@Identity
    end
    select @_TimeZoneId as [TimeZoneId] 
end