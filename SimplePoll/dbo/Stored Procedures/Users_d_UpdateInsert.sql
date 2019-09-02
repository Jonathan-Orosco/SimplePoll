
-- =============================================
-- Author:        DESKTOP-NE1ORR5\ApplicationServer
-- Create date:    Sep  1 2019  6:31PM
-- Description:    Stored Procedure for generic insert update
-- =============================================
CREATE PROCEDURE [dbo].[Users_d_UpdateInsert] 
     @UserId bigint
    , @UserName nvarchar(255)
    
    , @IsDeleteAction bit
AS
BEGIN
SET NOCOUNT ON
    
    declare @_UserId bigint
        , @_UserName nvarchar(255)
        , @_CreatedDateUtc datetime
		, @_IsDeleteAction bit

    
    set @_UserId = @UserId
	set @_IsDeleteAction = isnull(@IsDeleteAction,0)
    set @_UserName = @UserName
    set @_CreatedDateUtc = GETUTCDATE()

if @_UserId > 0
	and @_IsDeleteAction = 1
    begin

        Update [dbo].[Users_d]
        set [DeletedDateUtc] = GETUTCDATE()
        where
            UserId = @_UserId
    end
if @_UserId > 0
    begin

        Update [dbo].[Users_d]
        set
         [UserName] = @_UserName
        where
            UserId = @_UserId
    end
    else
        begin

			select 
				@_UserId = UserId
			from  dbo.Users_d

			if isnull(@_UserId,0)  = 0
				begin

					insert into [dbo].[Users_d]
					(
						  [UserName]
						, [CreatedDateUtc]
						, [DeletedDateUtc]
					)
            
					select
						 @_UserName
						, @_CreatedDateUtc
						, null
						set @_UserId = @@Identity
				end
                
    end
    select @_UserId as [UserId] 
end