CREATE TABLE [dbo].[LeagueYear]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [LeagueId] INT NOT NULL, 
    [Season] CHAR(4) NULL, 
    CONSTRAINT [FK_LeagueYear_ToLeague] FOREIGN KEY ([LeagueId]) REFERENCES [League]([Id])
)
