CREATE TABLE [dbo].[TimeZones] (
    [TimeZoneId]    SMALLINT       IDENTITY (1, 1) NOT NULL,
    [DisplayName]   NVARCHAR (100) NOT NULL,
    [OffsetMinutes] SMALLINT       NULL,
    CONSTRAINT [PK_TimeZones] PRIMARY KEY CLUSTERED ([TimeZoneId] ASC)
);

