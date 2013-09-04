CREATE TABLE [dbo].[LeagueYearPosition]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [LeagueYearId] INT NOT NULL, 
    [PositionId] INT NOT NULL, 
    [NumberOfStarters] SMALLINT NOT NULL, 
    CONSTRAINT [FK_LeagueYearPosition_ToLeagueYear] FOREIGN KEY (LeagueYearId) REFERENCES [LeagueYear]([Id]), 
    CONSTRAINT [FK_LeagueYearPosition_ToPosition] FOREIGN KEY (PositionId) REFERENCES [Position]([Id])
)
