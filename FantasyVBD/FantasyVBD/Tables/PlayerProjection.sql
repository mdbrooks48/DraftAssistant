﻿CREATE TABLE [dbo].[PlayerProjection]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [LeagueYearId] INT NOT NULL, 
    [PlayerId] INT NOT NULL,
	[Attempts] DECIMAL(18, 1) NULL, 
    [Completions] DECIMAL(18, 1) NULL, 
    [PassingYards] DECIMAL(18, 1) NULL, 
    [PassingTDs] DECIMAL(18, 1) NULL, 
	[PassingAvg] DECIMAL(18, 1) NULL,
    [Interceptions] DECIMAL(18, 1) NULL, 
    [PasserRating] DECIMAL(18, 1) NULL, 
    [RushAttempts] DECIMAL(18, 1) NULL, 
    [RushYards] DECIMAL(18, 1) NULL, 
    [RushAvg] DECIMAL(18, 1) NULL, 
    [RushingTDs] DECIMAL(18, 1) NULL, 
    [Targets] DECIMAL(18, 1) NULL, 
    [Receptions] DECIMAL(18, 1) NULL, 
    [ReceivingYards] DECIMAL(18, 1) NULL, 
    [ReceivingAvg] DECIMAL(18, 1) NULL, 
    [ReceivingTDs] DECIMAL(18, 1) NULL, 
    [FumblesLost] DECIMAL(18, 1) NULL, 
    [FantasyPoints] DECIMAL(18, 1) NULL, 
    [Rank] INT NULL, 
    [ValuePoints] DECIMAL(18, 1) NULL, 
    [ValueDeltaPoints] DECIMAL(18, 1) NULL, 
    [YardageBonusPoints] DECIMAL(18, 1) NULL, 
    CONSTRAINT [FK_PlayerProjection_ToLeagueYear] FOREIGN KEY (LeagueYearId) REFERENCES [LeagueYear]([Id]), 
    CONSTRAINT [FK_PlayerProjection_ToPlayer] FOREIGN KEY (PlayerId) REFERENCES [Player]([Id])
)
