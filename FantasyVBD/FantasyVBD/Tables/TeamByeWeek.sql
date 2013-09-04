CREATE TABLE [dbo].[TeamByeWeek]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [TeamId] INT NOT NULL, 
    [ByeWeekId] INT NOT NULL, 
    [LeagueYearId] INT NOT NULL, 
    CONSTRAINT [FK_TeamByeWeek_ToTeam] FOREIGN KEY (TeamId) REFERENCES [Team]([Id]), 
    CONSTRAINT [FK_TeamByeWeek_ToTable] FOREIGN KEY (ByeWeekId) REFERENCES [ByeWeek]([Id]), 
    CONSTRAINT [FK_TeamByeWeek_ToLeagueYear] FOREIGN KEY (LeagueYearId) REFERENCES [LeagueYear]([Id])
)
