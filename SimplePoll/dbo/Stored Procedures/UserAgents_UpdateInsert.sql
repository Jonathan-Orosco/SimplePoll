
-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  2 2019 11:33AM
-- Description:    Stored Procedure for generic insert update
-- =============================================
CREATE PROCEDURE [dbo].[UserAgents_UpdateInsert] 
      @UserAgent nvarchar(max)
AS
BEGIN
SET NOCOUNT ON
    
    declare @_UserAgentId int
        , @_UserAgent nvarchar(max)
    
    set @_UserAgent = @UserAgent



			select 
				@_UserAgentId = UserAgentId
			from 
				[dbo].[UserAgents]
			where 
			@UserAgent = [UserAgent]

			if isnull(@_UserAgentId,0)  = 0
				begin
					insert into [dbo].[UserAgents]
					(
						 [UserAgent]
					)
            
					select
						  @_UserAgent

					set @_UserAgentId = @@Identity
				end
                

    select @_UserAgentId as [UserAgentId] 
end