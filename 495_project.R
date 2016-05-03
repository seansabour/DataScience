library(jsonlite)
library(curl)
library(e1071)

source("C:/Users/joshua/Downloads/lin-regr-util.R")

nba_stats = fromJSON("http://stats.nba.com/stats/leaguedashteamptshot?LeagueID=00&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats2 = fromJSON("http://stats.nba.com/stats/leaguedashplayerptshot?LeagueID=00&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats3 = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612738&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")


nba_stats$resultSets$headers
nba_stats$resultSets$rowSet

teamstat = data.frame(nba_stats$resultSets$rowSet[1])
colnames(teamstat) <- nba_stats$resultSets$headers[[1]] 

playerstat = data.frame(nba_stats2$resultSets$rowSet[1])
colnames(playerstat) <- nba_stats2$resultSets$headers[[1]]

head(playerstat)

nba_stats2$resultSets$headers
nba_stats2$resultSets$rowSet

team = data.frame(nba_stats3$resultSets$rowSet[1])
colnames(team) <- nba_stats3$resultSets$headers[[1]]

head(team)