-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  1 2019  6:31PM
-- Description:    Stored Procedure for generic insert update
-- =============================================
CREATE PROCEDURE [Poll].[Info_UpdateInsert] 
     @PollId uniqueidentifier
    , @PollName nvarchar(50)
    , @PollDescription nvarchar(255)
AS
BEGIN
SET NOCOUNT ON
    
    declare @_PollId uniqueidentifier
        , @_PollName nvarchar(50)
        , @_PollDescription nvarchar(255)
        , @_CreatedDateUtc datetime
    
    set @_PollId = @PollId
    set @_PollName = @PollName
    set @_PollDescription = @PollDescription
    set @_CreatedDateUtc = GETUTCDATE()

if @_PollId <> '00000000-0000-0000-0000-000000000000' 
    begin

        Update [Poll].[Info]
        set
         [PollName] = @_PollName
            , [PollDescription] = @_PollDescription
        where
            PollId = @_PollId
    end
    else
        begin
DECLARE @OutputRow TABLE (PK uniqueidentifier)
            insert into [Poll].[Info]
            (
                  [PollName]
                , [PollDescription]
                , [CreatedDateUtc]
            )output Inserted.[PollId] into @OutputRow(PK)
            
            select
                  @_PollName
                , @_PollDescription
                , @_CreatedDateUtc
             select @_PollId = pk	
			 from @OutputRow
    end
    select @_PollId as [PollId] 
end