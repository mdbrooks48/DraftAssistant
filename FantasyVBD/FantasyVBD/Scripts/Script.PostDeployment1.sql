/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

:r .\League.sql
:r .\LeagueYear.sql
:r .\Team.sql
:r .\ByeWeek.sql
:r .\TeamByeWeek.sql
:r .\FantasyTeam.sql
:r .\Position.sql
:r .\LeagueYearPosition.sql
:r .\Trades.sql
:r .\LeagueYearDraftOrder.sql