-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  2 2019 11:47AM
-- Description:    Stored Procedure for selecting project status
-- =============================================
Create PROCEDURE [dbo].[TimeZones_Select]
     @DisplayName nvarchar(100) = ''
AS
BEGIN
SET NOCOUNT ON
    
    declare
    @_DisplayName 			nvarchar(100)

    
    set @_DisplayName 			= isnull(@DisplayName,'')

if @_DisplayName != ''
    begin
        
        select
            [TimeZoneId]			= srcTable.[TimeZoneId]
            ,[DisplayName]			= srcTable.[DisplayName]
            ,[OffsetMinutes]		= srcTable.[OffsetMinutes]
        from
            [dbo].[TimeZones] as srcTable with(nolock)
        where
            srcTable.[DisplayName] = @_DisplayName
    end

else
    begin
        
                
                select
                      [TimeZoneId]			= srcTable.[TimeZoneId]
                    , [DisplayName]			= srcTable.[DisplayName]
                    , [OffsetMinutes]		= srcTable.[OffsetMinutes]

                from
                    [dbo].[TimeZones] as srcTable with(nolock)


    
    end
end