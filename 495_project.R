library(jsonlite)
library(curl)
library(e1071)
library(rpart)
library(rpart.plot)
library(maptree)
source("C:/Users/joshua/Downloads/lin-regr-util.R")

source("/Users/seansabour/Desktop/School/CST495 Data Science/Homework/class-util.R")
source("/Users/seansabour/Desktop/School/CST495 Data Science/Homework/lin-regr-util.R")

nba_stats =  fromJSON("http://stats.nba.com/stats/leaguedashteamptshot?LeagueID=00&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats2 = fromJSON("http://stats.nba.com/stats/leaguedashplayerptshot?LeagueID=00&PerMode=Totals&Season=2014-15&SeasonType=Regular%20Season")
nba_stats4 = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612746&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")

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
head(playerstat_Wizards)

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
                    playerstat_Wizards
)


total_teams$ha 
head(total_teams)
names(total_teams) = tolower(names(total_teams))

total_teams$wl = factor(total_teams$wl)

total_teams$game_date = factor(total_teams$game_date)
total_teams$matchup = factor(total_teams$matchup)

plot(total_teams$game_date)



# Data Cleaning
x = grep(pattern= "[@]",total_teams$matchup) 
total_teams$ha[x] = '1'
total_teams$ha[-x] = '0'
total_teams$team_id = NULL
total_teams$game_id = NULL

#numerical




total_teams$pts = as.numeric(as.character(total_teams$pts))
total_teams$fgm = as.numeric(as.character(total_teams$fgm))
total_teams$fg3m = as.numeric(as.character(total_teams$fg3m))
total_teams$fga = as.numeric(as.character(total_teams$fga))
total_teams$fg3a = as.numeric(as.character(total_teams$fg3a))
total_teams$ftm = as.numeric(as.character(total_teams$ftm))
total_teams$fta = as.numeric(as.character(total_teams$fta))
total_teams$oreb = as.numeric(as.character(total_teams$oreb))
total_teams$dreb = as.numeric(as.character(total_teams$dreb))
total_teams$ast = as.numeric(as.character(total_teams$ast))
total_teams$stl = as.numeric(as.character(total_teams$stl))
total_teams$blk = as.numeric(as.character(total_teams$blk))
total_teams$tov = as.numeric(as.character(total_teams$tov))
total_teams$fg_pct = as.numeric(as.character(total_teams$fg_pct))
total_teams$ft_pct = as.numeric(as.character(total_teams$ft_pct))
total_teams$fg3_pct = as.numeric(as.character(total_teams$fg3_pct))

set.seed(132)
split = split_data(total_teams)
tr_data = split[[1]]
te_data = split[[2]]


head(total_teams)
head(total_teams$matchup)
head(tr_data)

# fit = naiveBayes(wl ~ ft_pct + oreb + dreb + reb + ast + stl + blk + tov + pf + pts, data= tr_data, laplace = 1)
# summary(fit)

head(total_teams, 1)

fv = c("ha","fgm","fga","fg3m","fg3a","ftm","fta","oreb","dreb","ast","stl","blk","tov")

fit3 = lm(pts ~ fgm + oreb + dreb + reb + ast + stl + tov + pf, data = tr_data)
summary(fit3)

predicted = predict(fit3, newdata = te_data)
actual = te_data$pts
plot_predict_actual(predicted, actual, 2000, "Predictions from test data")

