library(jsonlite)
library(curl)
library(e1071)
library(rpart)
library(rpart.plot)
library(maptree)
#source("C:/Users/joshua/Downloads/lin-regr-util.R")

 source("/Users/seansabour/Desktop/School/CST495 Data Science/Homework/class-util.R")
 source("/Users/seansabour/Desktop/School/CST495 Data Science/Homework/lin-regr-util.R")

nba_stats =  fromJSON("http://stats.nba.com/stats/leaguedashteamptshot?LeagueID=00&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats2 = fromJSON("http://stats.nba.com/stats/leaguedashplayerptshot?LeagueID=00&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats4 = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612746&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
nba_stats_playoffs = fromJSON("http://stats.nba.com/stats/leaguedashteamptshot?LeagueID=00&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")

teamstat_playoffs = data.frame(nba_stats_playoffs$resultSets$rowSet[1])
colnames(teamstat_playoffs) <- nba_stats_playoffs$resultSets$headers[[1]]

teamstat = data.frame(nba_stats$resultSets$rowSet[1])
colnames(teamstat) <- nba_stats$resultSets$headers[[1]]

teamstat4 = data.frame(nba_stats4$resultSets$rowSet[1])
colnames(teamstat4) <- nba_stats4$resultSets$headers[[1]]

nba_stats$resultSets$headers
nba_stats$resultSets$rowSet

teamstat = data.frame(nba_stats$resultSets$rowSet[1])
colnames(teamstat) <- nba_stats$resultSets$headers[[1]]
nba_stats2$resultSets$headers
nba_stats2$resultSets$rowSet

player = data.frame(nba_stats2$resultSets$rowSet[1])
colnames(player) <- nba_stats2$resultSets$headers[[1]]



nba_stats_Hawks = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612737&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Celtics = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612738&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Nets = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612751&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Hornets = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612766&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Bulls = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612741&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Cavaliers = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612739&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Mavericks = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612742&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Nuggets = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612743&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Pistons = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612765&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Warriors = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612744&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Rockets = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612745&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Pacers = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612754&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Clippers = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612746&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Lakers = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612747&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Grizzlies = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612763&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Heat = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612748&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Bucks = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612749&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Timberwolves = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612750&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Pelicans = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612740&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Knicks = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612752&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Thunder = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612760&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Magic = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612753&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_76ers = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612755&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Suns = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612756&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Blazers = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612757&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Kings = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612758&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Spurs = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612759&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Raptors = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612761&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Jazz = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612762&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats_Wizards = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612750&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
# nba_stats3 = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612764&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")


# putting the data in data frame and adding headers
playerstat_Hawks = data.frame(nba_stats_Hawks$resultSets$rowSet[1])
colnames(playerstat_Hawks) <- nba_stats_Hawks$resultSets$headers[[1]]

playerstat_Celtics = data.frame(nba_stats_Celtics$resultSets$rowSet[1])
colnames(playerstat_Celtics) <- nba_stats_Celtics$resultSets$headers[[1]]

playerstat_Nets = data.frame(nba_stats_Nets$resultSets$rowSet[1])
colnames(playerstat_Nets) <- nba_stats_Nets$resultSets$headers[[1]]

playerstat_Hornets = data.frame(nba_stats_Hornets$resultSets$rowSet[1])
colnames(playerstat_Hornets) <- nba_stats_Hornets$resultSets$headers[[1]]

playerstat_Bulls = data.frame(nba_stats_Bulls$resultSets$rowSet[1])
colnames(playerstat_Bulls) <- nba_stats_Bulls$resultSets$headers[[1]]

playerstat_Cavaliers = data.frame(nba_stats_Cavaliers$resultSets$rowSet[1])
colnames(playerstat_Cavaliers) <- nba_stats_Cavaliers$resultSets$headers[[1]]

playerstat_Mavericks = data.frame(nba_stats_Mavericks$resultSets$rowSet[1])
colnames(playerstat_Mavericks) <- nba_stats_Mavericks$resultSets$headers[[1]]

playerstat_Nuggets = data.frame(nba_stats_Nuggets$resultSets$rowSet[1])
colnames(playerstat_Nuggets) <- nba_stats_Nuggets$resultSets$headers[[1]]

playerstat_Pistons = data.frame(nba_stats_Pistons$resultSets$rowSet[1])
colnames(playerstat_Pistons) <- nba_stats_Pistons$resultSets$headers[[1]]

playerstat_Warriors = data.frame(nba_stats_Warriors$resultSets$rowSet[1])
colnames(playerstat_Warriors) <- nba_stats_Warriors$resultSets$headers[[1]]

playerstat_Rockets = data.frame(nba_stats_Rockets$resultSets$rowSet[1])
colnames(playerstat_Rockets) <- nba_stats_Rockets$resultSets$headers[[1]]

playerstat_Pacers = data.frame(nba_stats_Pacers$resultSets$rowSet[1])
colnames(playerstat_Pacers) <- nba_stats_Pacers$resultSets$headers[[1]]

playerstat_Clippers = data.frame(nba_stats_Clippers$resultSets$rowSet[1])
colnames(playerstat_Clippers) <- nba_stats_Clippers$resultSets$headers[[1]]

playerstat_Lakers = data.frame(nba_stats_Lakers$resultSets$rowSet[1])
colnames(playerstat_Lakers) <- nba_stats_Lakers$resultSets$headers[[1]]

playerstat_Grizzlies = data.frame(nba_stats_Grizzlies$resultSets$rowSet[1])
colnames(playerstat_Grizzlies) <- nba_stats_Grizzlies$resultSets$headers[[1]]

playerstat_Grizzlies = data.frame(nba_stats_Grizzlies$resultSets$rowSet[1])
colnames(playerstat_Grizzlies) <- nba_stats_Grizzlies$resultSets$headers[[1]]

playerstat_Heat = data.frame(nba_stats_Heat$resultSets$rowSet[1])
colnames(playerstat_Heat) <- nba_stats_Heat$resultSets$headers[[1]]

playerstat_Bucks = data.frame(nba_stats_Bucks$resultSets$rowSet[1])
colnames(playerstat_Bucks) <- nba_stats_Bucks$resultSets$headers[[1]]

playerstat_Timberwolves = data.frame(nba_stats_Timberwolves$resultSets$rowSet[1])
colnames(playerstat_Timberwolves) <- nba_stats_Timberwolves$resultSets$headers[[1]]

playerstat_Pelicans = data.frame(nba_stats_Pelicans$resultSets$rowSet[1])
colnames(playerstat_Pelicans) <- nba_stats_Pelicans$resultSets$headers[[1]]

playerstat_Knicks = data.frame(nba_stats_Knicks$resultSets$rowSet[1])
colnames(playerstat_Knicks) <- nba_stats_Knicks$resultSets$headers[[1]]

playerstat_Thunder = data.frame(nba_stats_Thunder$resultSets$rowSet[1])
colnames(playerstat_Thunder) <- nba_stats_Thunder$resultSets$headers[[1]]

playerstat_Magic = data.frame(nba_stats_Magic$resultSets$rowSet[1])
colnames(playerstat_Magic) <- nba_stats_Magic$resultSets$headers[[1]]

playerstat_76ers = data.frame(nba_stats_76ers$resultSets$rowSet[1])
colnames(playerstat_76ers) <- nba_stats_76ers$resultSets$headers[[1]]

playerstat_Suns = data.frame(nba_stats_Suns$resultSets$rowSet[1])
colnames(playerstat_Suns) <- nba_stats_Suns$resultSets$headers[[1]]

playerstat_Blazers = data.frame(nba_stats_Blazers$resultSets$rowSet[1])
colnames(playerstat_Blazers) <- nba_stats_Blazers$resultSets$headers[[1]]

playerstat_Kings = data.frame(nba_stats_Kings$resultSets$rowSet[1])
colnames(playerstat_Kings) <- nba_stats_Kings$resultSets$headers[[1]]

playerstat_Spurs = data.frame(nba_stats_Spurs$resultSets$rowSet[1])
colnames(playerstat_Spurs) <- nba_stats_Spurs$resultSets$headers[[1]]

playerstat_Raptors = data.frame(nba_stats_Raptors$resultSets$rowSet[1])
colnames(playerstat_Raptors) <- nba_stats_Raptors$resultSets$headers[[1]]

playerstat_Jazz = data.frame(nba_stats_Jazz$resultSets$rowSet[1])
colnames(playerstat_Jazz) <- nba_stats_Jazz$resultSets$headers[[1]]

playerstat_Wizards = data.frame(nba_stats_Wizards$resultSets$rowSet[1])
colnames(playerstat_Wizards) <- nba_stats_Wizards$resultSets$headers[[1]]


# Adding team name column

hawks = replicate(nrow(playerstat_Hawks), c("hawks"))
playerstat_Hawks$team_name = hawks

celtics = replicate(nrow(playerstat_Celtics), c("celtics"))
playerstat_Celtics$team_name = celtics

nets = replicate(nrow(playerstat_Nets), c("nets"))
playerstat_Nets$team_name = nets

hornets = replicate(nrow(playerstat_Hornets), c("hornets"))
playerstat_Hornets$team_name = hornets

bulls = replicate(nrow(playerstat_Bulls), c("bulls"))
playerstat_Bulls$team_name = bulls

cavaliers = replicate(nrow(playerstat_Cavaliers), c("cavaliers"))
playerstat_Cavaliers$team_name = cavaliers

mavericks = replicate(nrow(playerstat_Mavericks), c("mavericks"))
playerstat_Mavericks$team_name = mavericks

nuggets = replicate(nrow(playerstat_Nuggets), c("nuggets"))
playerstat_Nuggets$team_name = nuggets

pistons = replicate(nrow(playerstat_Pistons), c("pistons"))
playerstat_Pistons$team_name = pistons

warriors = replicate(nrow(playerstat_Warriors), c("warriors"))
playerstat_Warriors$team_name = warriors

rockets = replicate(nrow(playerstat_Rockets), c("rockets"))
playerstat_Rockets$team_name = rockets

pacers = replicate(nrow(playerstat_Pacers), c("pacers"))
playerstat_Pacers$team_name = pacers

clippers = replicate(nrow(playerstat_Clippers), c("clippers"))
playerstat_Clippers$team_name = clippers

lakers = replicate(nrow(playerstat_Lakers), c("lakers"))
playerstat_Lakers$team_name = lakers

grizzlies = replicate(nrow(playerstat_Grizzlies), c("grizzlies"))
playerstat_Grizzlies$team_name = grizzlies

heat = replicate(nrow(playerstat_Heat), c("heat"))
playerstat_Heat$team_name = heat

bucks = replicate(nrow(playerstat_Bucks), c("bucks"))
playerstat_Bucks$team_name = bucks

timberwolves = replicate(nrow(playerstat_Timberwolves), c("timberwolves"))
playerstat_Timberwolves$team_name = timberwolves

pelicans = replicate(nrow(playerstat_Pelicans), c("pelicans"))
playerstat_Pelicans$team_name = pelicans

knicks = replicate(nrow(playerstat_Knicks), c("knicks"))
playerstat_Knicks$team_name = knicks

thunder = replicate(nrow(playerstat_Thunder), c("thunder"))
playerstat_Thunder$team_name = thunder

magic = replicate(nrow(playerstat_Magic), c("magic"))
playerstat_Magic$team_name = magic

p.76ers = replicate(nrow(playerstat_76ers), c("76ers"))
playerstat_76ers$team_name = p.76ers

suns = replicate(nrow(playerstat_Suns), c("suns"))
playerstat_Suns$team_name = suns

blazers = replicate(nrow(playerstat_Blazers), c("blazers"))
playerstat_Blazers$team_name = blazers

kings = replicate(nrow(playerstat_Kings), c("kings"))
playerstat_Kings$team_name = kings

spurs = replicate(nrow(playerstat_Spurs), c("spurs"))
playerstat_Spurs$team_name = spurs

raptors = replicate(nrow(playerstat_Raptors), c("raptors"))
playerstat_Raptors$team_name = raptors

jazz = replicate(nrow(playerstat_Jazz), c("jazz"))
playerstat_Jazz$team_name = jazz

wizards = replicate(nrow(playerstat_Wizards), c("wizards"))
playerstat_Wizards$team_name = wizards

# playoff data

nba_stats_Hawks_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612737&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Celtics_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612738&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Nets_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612751&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Hornets_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612766&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Bulls_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612741&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Cavaliers_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612739&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Mavericks_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612742&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Nuggets_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612743&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Pistons_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612765&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Warriors_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612744&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Rockets_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612745&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Pacers_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612754&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Clippers_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612746&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Lakers_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612747&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Grizzlies_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612763&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Heat_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612748&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Bucks_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612749&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Timberwolves_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612750&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Pelicans_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612740&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Knicks_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612752&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Thunder_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612760&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Magic_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612753&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_76ers_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612755&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Suns_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612756&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Blazers_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612757&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Kings_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612758&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Spurs_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612759&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Raptors_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612761&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Jazz_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612762&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
nba_stats_Wizards_p = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612750&PerMode=Totals&Season=2014-15&SeasonType=Playoffs")
# nba_stats3 = fromJSON("http://stats.nba.com/stats/teamgamelog?TeamID=1610612764&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")


# putting the data in data frame and adding headers
playerstat_Hawks_p = data.frame(nba_stats_Hawks_p$resultSets$rowSet[1])
colnames(playerstat_Hawks_p) <- nba_stats_Hawks_p$resultSets$headers[[1]]

playerstat_Celtics_p = data.frame(nba_stats_Celtics_p$resultSets$rowSet[1])
colnames(playerstat_Celtics_p) <- nba_stats_Celtics_p$resultSets$headers[[1]]

playerstat_Nets_p = data.frame(nba_stats_Nets_p$resultSets$rowSet[1])
colnames(playerstat_Nets_p) <- nba_stats_Nets_p$resultSets$headers[[1]]

playerstat_Hornets_p = data.frame(nba_stats_Hornets_p$resultSets$rowSet[1])
colnames(playerstat_Hornets_p) <- nba_stats_Hornets_p$resultSets$headers[[1]]

playerstat_Bulls_p = data.frame(nba_stats_Bulls_p$resultSets$rowSet[1])
colnames(playerstat_Bulls_p) <- nba_stats_Bulls_p$resultSets$headers[[1]]

playerstat_Cavaliers_p = data.frame(nba_stats_Cavaliers_p$resultSets$rowSet[1])
colnames(playerstat_Cavaliers_p) <- nba_stats_Cavaliers_p$resultSets$headers[[1]]

playerstat_Mavericks_p = data.frame(nba_stats_Mavericks_p$resultSets$rowSet[1])
colnames(playerstat_Mavericks_p) <- nba_stats_Mavericks_p$resultSets$headers[[1]]

playerstat_Nuggets_p = data.frame(nba_stats_Nuggets_p$resultSets$rowSet[1])
colnames(playerstat_Nuggets_p) <- nba_stats_Nuggets_p$resultSets$headers[[1]]

playerstat_Pistons_p = data.frame(nba_stats_Pistons_p$resultSets$rowSet[1])
colnames(playerstat_Pistons_p) <- nba_stats_Pistons_p$resultSets$headers[[1]]

playerstat_Warriors_p = data.frame(nba_stats_Warriors_p$resultSets$rowSet[1])
colnames(playerstat_Warriors_p) <- nba_stats_Warriors_p$resultSets$headers[[1]]

playerstat_Rockets_p = data.frame(nba_stats_Rockets_p$resultSets$rowSet[1])
colnames(playerstat_Rockets_p) <- nba_stats_Rockets_p$resultSets$headers[[1]]

playerstat_Pacers_p = data.frame(nba_stats_Pacers_p$resultSets$rowSet[1])
colnames(playerstat_Pacers_p) <- nba_stats_Pacers_p$resultSets$headers[[1]]

playerstat_Clippers_p = data.frame(nba_stats_Clippers_p$resultSets$rowSet[1])
colnames(playerstat_Clippers_p) <- nba_stats_Clippers_p$resultSets$headers[[1]]

playerstat_Lakers_p = data.frame(nba_stats_Lakers_p$resultSets$rowSet[1])
colnames(playerstat_Lakers_p) <- nba_stats_Lakers_p$resultSets$headers[[1]]

playerstat_Grizzlies_p = data.frame(nba_stats_Grizzlies_p$resultSets$rowSet[1])
colnames(playerstat_Grizzlies_p) <- nba_stats_Grizzlies_p$resultSets$headers[[1]]


playerstat_Heat_p = data.frame(nba_stats_Heat_p$resultSets$rowSet[1])
colnames(playerstat_Heat_p) <- nba_stats_Heat_p$resultSets$headers[[1]]

playerstat_Bucks_p = data.frame(nba_stats_Bucks_p$resultSets$rowSet[1])
colnames(playerstat_Bucks_p) <- nba_stats_Bucks_p$resultSets$headers[[1]]

playerstat_Timberwolves_p = data.frame(nba_stats_Timberwolves_p$resultSets$rowSet[1])
colnames(playerstat_Timberwolves_p) <- nba_stats_Timberwolves_p$resultSets$headers[[1]]

playerstat_Pelicans_p = data.frame(nba_stats_Pelicans_p$resultSets$rowSet[1])
colnames(playerstat_Pelicans_p) <- nba_stats_Pelicans_p$resultSets$headers[[1]]


playerstat_Blazers_p = data.frame(nba_stats_Blazers_p$resultSets$rowSet[1])
colnames(playerstat_Blazers_p) <- nba_stats_Blazers_p$resultSets$headers[[1]]


playerstat_Spurs_p = data.frame(nba_stats_Spurs_p$resultSets$rowSet[1])
colnames(playerstat_Spurs_p) <- nba_stats_Spurs_p$resultSets$headers[[1]]

playerstat_Raptors_p = data.frame(nba_stats_Raptors_p$resultSets$rowSet[1])
colnames(playerstat_Raptors_p) <- nba_stats_Raptors_p$resultSets$headers[[1]]



# Adding team name column


hawks_p = replicate(nrow(playerstat_Hawks_p), c("hawks"))
playerstat_Hawks_p$team_name = hawks_p

celtics_p = replicate(nrow(playerstat_Celtics_p), c("celtics"))
playerstat_Celtics_p$team_name = celtics_p

nets_p = replicate(nrow(playerstat_Nets_p), c("nets"))
playerstat_Nets_p$team_name = nets_p

bulls_p = replicate(nrow(playerstat_Bulls_p), c("bulls"))
playerstat_Bulls_p$team_name = bulls_p

cavaliers_p = replicate(nrow(playerstat_Cavaliers_p), c("cavaliers"))
playerstat_Cavaliers_p$team_name = cavaliers_p

mavericks_p = replicate(nrow(playerstat_Mavericks_p), c("mavericks"))
playerstat_Mavericks_p$team_name = mavericks_p



warriors_p = replicate(nrow(playerstat_Warriors_p), c("warriors"))
playerstat_Warriors_p$team_name = warriors_p

rockets_p = replicate(nrow(playerstat_Rockets_p), c("rockets"))
playerstat_Rockets_p$team_name = rockets_p



clippers_p = replicate(nrow(playerstat_Clippers_p), c("clippers"))
playerstat_Clippers_p$team_name = clippers_p

grizzlies_p = replicate(nrow(playerstat_Grizzlies_p), c("grizzlies"))
playerstat_Grizzlies_p$team_name = grizzlies_p


bucks_p = replicate(nrow(playerstat_Bucks_p), c("bucks"))
playerstat_Bucks_p$team_name = bucks_p

pelicans_p = replicate(nrow(playerstat_Pelicans_p), c("pelicans"))
playerstat_Pelicans_p$team_name = pelicans_p



blazers_p = replicate(nrow(playerstat_Blazers_p), c("blazers"))
playerstat_Blazers_p$team_name = blazers_p



spurs_p = replicate(nrow(playerstat_Spurs_p), c("spurs"))
playerstat_Spurs_p$team_name = spurs_p

raptors_p = replicate(nrow(playerstat_Raptors_p), c("raptors"))
playerstat_Raptors_p$team_name = raptors_p




# combining the data frames for teams

total_teams = rbind(playerstat_Hawks,
                    playerstat_Celtics,
                    playerstat_Nets,
                    playerstat_Hornets,
                    playerstat_Bulls,
                    playerstat_Cavaliers,
                    playerstat_Mavericks,
                    playerstat_Nuggets,
                    playerstat_Pistons,
                    playerstat_Warriors,
                    playerstat_Rockets,
                    playerstat_Pacers,
                    playerstat_Clippers,
                    playerstat_Lakers,
                    playerstat_Grizzlies,
                    playerstat_Heat,
                    playerstat_Bucks,
                    playerstat_Timberwolves,
                    playerstat_Pelicans,
                    playerstat_Knicks,
                    playerstat_Thunder,
                    playerstat_Magic,
                    playerstat_76ers,
                    playerstat_Suns,
                    playerstat_Blazers,
                    playerstat_Kings,
                    playerstat_Spurs,
                    playerstat_Raptors,
                    playerstat_Jazz,
                    playerstat_Wizards,
                    playerstat_Hawks_p,
                    playerstat_Celtics_p,
                    playerstat_Bulls_p,
                    playerstat_Cavaliers_p,
                    playerstat_Mavericks_p,
                    playerstat_Warriors_p,
                    playerstat_Rockets_p,
                    playerstat_Clippers_p,
                    playerstat_Grizzlies_p,
                    playerstat_Bucks_p,
                    playerstat_Pelicans_p,
                    playerstat_Blazers_p,
                    playerstat_Spurs_p,
                    playerstat_Raptors_p
)

names(total_teams) = tolower(names(total_teams))

total_teams$wl = factor(total_teams$wl)

# total_teams$game_date = factor(total_teams$game_date)
# total_teams$matchup = factor(total_teams$matchup)

plot(total_teams$game_date)


total_teams$ha = sample(1, nrow(total_teams), replace = T)
# Data Cleaning
x = grep(pattern= "[@]",total_teams$matchup) 
total_teams$ha[x] = '1'
total_teams$ha[-x] = '0'


total_teams$game_id = as.numeric(levels(total_teams$game_id))[total_teams$game_id]
total_teams$pts = as.numeric(levels(total_teams$pts))[total_teams$pts]
total_teams$fgm = as.numeric(levels(total_teams$fgm))[total_teams$fgm]
total_teams$fg3m = as.numeric(levels(total_teams$fg3m))[total_teams$fg3m]
total_teams$fga = as.numeric(levels(total_teams$fga))[total_teams$fga]
total_teams$fg3a = as.numeric(levels(total_teams$fg3a))[total_teams$fg3a]
total_teams$ftm = as.numeric(levels(total_teams$ftm))[total_teams$ftm]
total_teams$fta = as.numeric(levels(total_teams$fta))[total_teams$fta]
total_teams$oreb = as.numeric(levels(total_teams$oreb))[total_teams$oreb]
total_teams$dreb = as.numeric(levels(total_teams$dreb))[total_teams$dreb]
total_teams$ast = as.numeric(levels(total_teams$ast))[total_teams$ast]
total_teams$stl = as.numeric(levels(total_teams$stl))[total_teams$stl]
total_teams$blk = as.numeric(levels(total_teams$blk))[total_teams$blk]
total_teams$tov = as.numeric(levels(total_teams$tov))[total_teams$tov]
total_teams$fg_pct = as.numeric(levels(total_teams$fg_pct))[total_teams$fg_pct]
total_teams$ft_pct = as.numeric(levels(total_teams$ft_pct))[total_teams$ft_pct]
total_teams$fg3_pct = as.numeric(levels(total_teams$fg3_pct))[total_teams$fg3_pct]
total_teams$pf = as.numeric(levels(total_teams$pf))[total_teams$pf]
total_teams$reb = as.numeric(levels(total_teams$reb))[total_teams$reb]

# set.seed(132)
split = split_data(total_teams)
tr_data = split[[1]]
te_data = split[[2]]

head(total_teams)
head(total_teams$matchup)
head(tr_data)

# fit = naiveBayes(wl ~ ft_pct + oreb + dreb + reb + ast + stl + blk + tov + pf + pts, data= tr_data, laplace = 1)
# summary(fit)

head(total_teams, 1)

# fv = c("ha","fgm","fga","fg3m","fg3a","ftm","fta","oreb","dreb","ast","stl","blk","tov")
# 
# fit3 = lm(pts ~ fgm + oreb + dreb + reb + ast + stl + tov + pf, data = tr_data)
# summary(fit3)
# 
# predicted = predict(fit3, newdata = te_data)
# actual = te_data$pts
# plot_predict_actual(predicted, actual, 2000, "Predictions from test data")


# fv = c("ha","fgm","fga","fg3m","fg3a","ftm","fta","oreb","dreb","ast","stl","blk","tov")

plot(~ ha  + fgm + stl + blk + ast + fg3_pct + fg3a + fg3m, data = tr_data)
plot(total_teams$fg_pct ~ total_teams$team_id, col=c("firebrick"))
plot(total_teams$fg3_pct ~ total_teams$team_id, col=c("firebrick"), las=2)
plot(total_teams$pf ~ total_teams$team_id, col=c("firebrick"), las=2)
plot(total_teams$pts ~ total_teams$team_id, col=c("firebrick"), las=2)
plot(total_teams$fg3m ~ total_teams$fg3_pct, col=c("firebrick", "blue"), pch=16)
plot(total_teams$fgm ~ total_teams$ast, col=c("firebrick", "blue"), pch=16)
plot(total_teams$fgm, total_teams$ast, col=c("firebrick", "blue"), pch=16)
plot(total_teams$fg3a ~ total_teams$fg3m, col=c("firebrick", "blue"), pch=16)


 fit = lm(pts ~ ha  + fgm + stl + blk + ast + fg3_pct + fg3a + fg3m, data = tr_data)
# fit = lm(pts ~ pf + fg3m + fgm + fg3a + ast, data = tr_data)

summary(fit)
summary(fit2)

# x = te_data[te_data$game_id == 0021400916,]
# predicted = predict(fit, newdata = x)


predicted = predict(fit, newdata = te_data)
predicted2 = predict(fit2, newdata = te_data)

rmse = sqrt(mean((te_data$pts - predicted)^2))
rmse2 = sqrt(mean((te_data$pts - predicted2)^2))

rmse
rmse2

par(mfrow=c(2,1))
plot_predict_actual(predicted ,te_data$pts, 5, title = "Predictions from Testing Data")
plot_predict_actual(predicted2 ,te_data$pts, 5, title = "Predictions from Testing Data2")


# ligistic regression

te_data$wl = ifelse(te_data$wl == "W", 1, 0 )
tr_data$wl = ifelse(tr_data$wl == "W", 1, 0 )



# this fit works better than the latter
fit3 = glm(wl ~ fta + ft_pct + reb + ast + stl + blk + tov + pf + pts, data = tr_data, family = binomial)


# fit3 = glm(wl ~ pts + ha  + fgm + stl + blk + ast + fg3_pct + fg3a + fg3m, data = tr_data, family = binomial)

head(tr_data)
summary(fit3)

# compute confusion matrix
y = predict(fit3, newdata=te_data, type="response")
predicts3 = as.numeric(y > 0.5)
actuals3 = te_data$wl
conf_mtx3 = table(predicts3, actuals3)

par(mfrow=c(1,1))
print(conf_mtx3)
plot(conf_mtx3, col="firebrick")

succ_rate3 = mean(actuals3 == predicts3)

par(mfrow=c(1,2))
hist(y[actuals3 == 0], main="Output when loss game", 
     breaks=10, xlim=c(0,1), ylim=c(0,15), col="red4", xlab="model predictions")
hist(y[actuals3 == 1], main="Output when won game", 
     breaks=10, xlim=c(0,1), ylim=c(0,15), col="red4", xlab="model predictions")

prec_recall_summary = function(predicts, actuals) {
  thresh = seq(0, 1, length.out=50)
  prec_rec = data.frame()
  actuals = factor(as.numeric(actuals))
  for (th in thresh) {
    predicts = factor(as.numeric(y >= th), levels=c("0","1"))
    prec_rec = rbind(prec_rec, as.vector(table(predicts, actuals)))
  }
  names(prec_rec) = c("TN", "FP", "FN", "TP")
  prec_rec$threshold = thresh
  prec_rec$precision = prec_rec$TP/(prec_rec$TP + prec_rec$FP)
  prec_rec$recall    = prec_rec$TP/(prec_rec$TP + prec_rec$FN)
  prec_rec$false_pos = prec_rec$FP/(prec_rec$FP + prec_rec$TN)
  return(prec_rec)
}

prec_rec1 = prec_recall_summary(predicts3, actuals3)

par(mfrow=c(2,1))
par(mar=c(4, 4, 2, 0.5))

plot(prec_rec1$precision ~ prec_rec1$threshold, type = "l", col="blue", xlab="Threshold", ylab="Presiction")
grid(nx = NULL, ny = NULL, col = "lightgray", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)
plot(prec_rec1$recall ~ prec_rec1$threshold, type = "l", col = "red", xlab="Threshold", ylab="Recall")
grid(nx = NULL, ny = NULL, col = "lightgray", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)


par(mfrow=c(1,1))
plot(prec_rec1$recall ~ prec_rec1$false_pos, type = "l", col = "red", xlab="Threshold", ylab="Recall")
grid(nx = NULL, ny = NULL, col = "lightgray", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)

title("receiver operating characteristic")

par(mfrow=c(1,1))
plot(prec_rec1$precision ~ prec_rec1$recall, type = "l", col = "red", xlab="precision", ylab="recall")
grid(nx = NULL, ny = NULL, col = "lightgray", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)
title("Precision recall curve")


# function get feactures team1 is the primary team, team 2 is against
get_feactures_v = function(team1, team2, total_teams){

  # getting the total games a team has played agaist each other
  x = total_teams[total_teams$matchup == paste(team1, "@", team2) | total_teams$matchup == paste(team1, "vs.", team2),]
team_dat = x[sample(1:nrow(x), 50, replace = T),]

x1 = grep(pattern= paste0(team2) ,total_teams$matchup) 
x1 = total_teams[x1,]

against_team = x1[sample(1:nrow(x1), 10, replace = T),]

x = rbind(team_dat, against_team)

# tail(x, 50)

x = lapply(team_dat[, c("pf", "reb", "fgm", "fga", "fg_pct", "fg3m", "fg3a", "fg3_pct", "ftm",  "fta", "ft_pct", "oreb", "dreb", "ast", "stl", "blk", "tov", "pts")], mean, na.rm = TRUE)

y = head(team_dat, 1)


y$fgm = round(x$fgm)
y$fga = round(x$fga)
y$fg_pct = x$fg_pct
y$fg3m = round(x$fg3m)
y$fg3a = round(x$fg3a)
y$fg3_pct = x$fg3_pct
y$ftm = round(x$ftm)
y$fta = round(x$fta)
y$ft_pct = x$ft_pct
y$oreb = round(x$oreb)
y$dreb = round(x$dreb)
y$reb = round(x$reb)
y$ast = round(x$ast)
y$stl = round(x$stl)
y$blk = round(x$blk)
y$tov = round(x$tov)
y$pts = round(x$pts)
y$pf = round(x$pf)
y$reb = round(x$reb)

y$wl = ifelse(y$wl == "W", 1, 0 )
y$team_id = 0
y$game_id = 0
y$game_date = 0

y$matchup = as.character(y$matchup)

y$matchup = paste(team1, "vs.", team2)

return(y)
}


# this method plays the games for each team. The features need to be fixed. read error message when running.
play_games = function(team1, team2, total_teams, fit_r, fit_l){
team1_w = NULL
team2_w = NULL
team1_s = NULL
team2_s = NULL



  for(i in 1:7)
  {
     x = get_feactures_v(team1, team2, total_teams)
     y = get_feactures_v(team2, team1, total_teams)
  
     # when these teams play team one score is predicted 
     predicted4 = predict(fit_r, newdata = x)
     predicted5 = predict(fit_r, newdata = y)
     
      predicted6 = predict(fit_l, newdata=x, type="response")
      predicts6 = as.numeric(predicted6 > 0.5)
      
      predicted7 = predict(fit_l, newdata=y, type="response")
      predicts7 = as.numeric(predicted7 > 0.5)   
    
      if(predicts6 == 0){
        predicts7 = 1
      }
      else{
        predicts7 = 0
      }
      
    team1_w = c(team1_w, predicts6)
    team2_w = c(team2_w, predicts7)
  
    team1_s = c(team1_s, predicted4)
     team2_s = c(team2_s, predicted5)
     
#      print(team1_w)
#      print(team2_w)
      if(sum(team1_w) == 4 | sum(team2_w) == 4){
        break
      }
  }

   team1_w = sum(team1_w)
   team2_w = sum(team2_w)
  
  print(team1_w)
  print(team2_w)
  print(team1_s)
  print(team2_s)

}
total_teams$wl = ifelse(total_teams$wl == "W", 1, 0)
# perameter one is team, 2 agaist, 3 regresstion, 4 list ligistic model
play_games("G", "DAL", total_teams, fit, fit3)


# total_teams[total_teams$matchup == paste(team1, "@", team2) | total_teams$matchup == paste(team1, "vs.", team2),]
# # i think the linear predicts is giving a warning because the feactures need to be turned back into factors
# predicted4 = predict(fit, newdata = x)
# predicted5 = predict(fit, newdata = y)
# 
# predicted6 = predict(fit3, newdata=x, type="response")
# predicts6 = as.numeric(predicted6 > 0.5)
# 
# predicted7 = predict(fit3, newdata=y, type="response")
# predicts7 = as.numeric(predicted7 > 0.5)
# 
# predicts6
# predicts7

