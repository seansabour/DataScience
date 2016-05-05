library(jsonlite)
library(curl)
library(e1071)
source("/Users/Cody/Downloads/lin-regr-util.R")

hawks_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612737&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
celtics_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612738&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
nets_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612751&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
hornets_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612766&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
bulls_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612741&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
cavaliers_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612739&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
mavericks_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612742&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
nuggets_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612743&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
pistons_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612765&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
warriors_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612744&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
rockets_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612745&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
pacers_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612754&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
clippers_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612746&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
lakers_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612747&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
grizzlies_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612763&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
heat_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612748&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
bucks_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612749&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
timberwolves_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612750&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
pelicans_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612740&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
knicks_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612752&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
thunder_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612760&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
magic_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612753&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
sixers_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612755&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
suns_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612756&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
blazers_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612757&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
kings_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612758&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
spurs_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612759&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
raptors_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612761&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
jazz_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612762&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")
wizards_stats = fromJSON("http://stats.nba.com/stats/teamyearbyyearstats?TeamID=1610612764&LeagueId=00&SeasonType=Regular%20Season&perMode=Totals")


Hawks = data.frame(hawks_stats$resultSets$rowSet[1])
colnames(Hawks) <- hawks_stats$resultSets$headers[[1]]

Celtics = data.frame(celtics_stats$resultSets$rowSet[1])
colnames(Celtics) <- celtics_stats$resultSets$headers[[1]]

Nets = data.frame(nets_stats$resultSets$rowSet[1])
colnames(Nets) <- nets_stats$resultSets$headers[[1]]

Hornets = data.frame(hornets_stats$resultSets$rowSet[1])
colnames(Hornets) <- hornets_stats$resultSets$headers[[1]]

Bulls = data.frame(bulls_stats$resultSets$rowSet[1])
colnames(Bulls) <- bulls_stats$resultSets$headers[[1]]

Cavaliers = data.frame(cavaliers_stats$resultSets$rowSet[1])
colnames(Cavaliers) <- cavaliers_stats$resultSets$headers[[1]]

Mavericks = data.frame(mavericks_stats$resultSets$rowSet[1])
colnames(Mavericks) <- mavericks_stats$resultSets$headers[[1]]

Nuggets = data.frame(nuggets_stats$resultSets$rowSet[1])
colnames(Nuggets) <- nuggets_stats$resultSets$headers[[1]]

Pistons = data.frame(pistons_stats$resultSets$rowSet[1])
colnames(Pistons) <- pistons_stats$resultSets$headers[[1]]

Warriors = data.frame(warriors_stats$resultSets$rowSet[1])
colnames(Warriors) <- warriors_stats$resultSets$headers[[1]]

Rockets = data.frame(rockets_stats$resultSets$rowSet[1])
colnames(Rockets) <- rockets_stats$resultSets$headers[[1]]

Pacers = data.frame(pacers_stats$resultSets$rowSet[1])
colnames(Pacers) <- pacers_stats$resultSets$headers[[1]]

Clippers = data.frame(clippers_stats$resultSets$rowSet[1])
colnames(Clippers) <- clippers_stats$resultSets$headers[[1]]

Lakers = data.frame(lakers_stats$resultSets$rowSet[1])
colnames(Lakers) <- lakers_stats$resultSets$headers[[1]]

Grizzlies = data.frame(grizzlies_stats$resultSets$rowSet[1])
colnames(Grizzlies) <- grizzlies_stats$resultSets$headers[[1]]

Heat = data.frame(heat_stats$resultSets$rowSet[1])
colnames(Heat) <- heat_stats$resultSets$headers[[1]]

Bucks = data.frame(bucks_stats$resultSets$rowSet[1])
colnames(Bucks) <- bucks_stats$resultSets$headers[[1]]

Timberwolves = data.frame(timberwolves_stats$resultSets$rowSet[1])
colnames(Timberwolves) <- timberwolves_stats$resultSets$headers[[1]]

Pelicans = data.frame(pelicans_stats$resultSets$rowSet[1])
colnames(Pelicans) <- pelicans_stats$resultSets$headers[[1]]

Knicks = data.frame(knicks_stats$resultSets$rowSet[1])
colnames(Knicks) <- knicks_stats$resultSets$headers[[1]]

Thunder = data.frame(thunder_stats$resultSets$rowSet[1])
colnames(Thunder) <- thunder_stats$resultSets$headers[[1]]

Magic = data.frame(magic_stats$resultSets$rowSet[1])
colnames(Magic) <- magic_stats$resultSets$headers[[1]]

Sixers = data.frame(sixers_stats$resultSets$rowSet[1])
colnames(Sixers) <- sixers_stats$resultSets$headers[[1]]

Suns = data.frame(suns_stats$resultSets$rowSet[1])
colnames(Suns) <- suns_stats$resultSets$headers[[1]]

Blazers = data.frame(blazers_stats$resultSets$rowSet[1])
colnames(Blazers) <- blazers_stats$resultSets$headers[[1]]

Kings = data.frame(kings_stats$resultSets$rowSet[1])
colnames(Kings) <- kings_stats$resultSets$headers[[1]]

Spurs = data.frame(spurs_stats$resultSets$rowSet[1])
colnames(Spurs) <- spurs_stats$resultSets$headers[[1]]

Raptors = data.frame(raptors_stats$resultSets$rowSet[1])
colnames(Raptors) <- raptors_stats$resultSets$headers[[1]]

Jazz = data.frame(jazz_stats$resultSets$rowSet[1])
colnames(Jazz) <- jazz_stats$resultSets$headers[[1]]

Wizards = data.frame(wizards_stats$resultSets$rowSet[1])
colnames(Wizards) <- wizards_stats$resultSets$headers[[1]]

Hawks$NBA_FINALS_APPEARANCE = 4
Celtics$NBA_FINALS_APPEARANCE = 21
Nets$NBA_FINALS_APPEARANCE = 2
Hornets$NBA_FINALS_APPEARANCE = 0
Bulls$NBA_FINALS_APPEARANCE = 6
Cavaliers$NBA_FINALS_APPEARANCE = 2
Mavericks$NBA_FINALS_APPEARANCE = 2
Nuggets$NBA_FINALS_APPEARANCE = 0
Pistons$NBA_FINALS_APPEARANCE = 7
Warriors$NBA_FINALS_APPEARANCE = 7
Rockets$NBA_FINALS_APPEARANCE = 4
Pacers$NBA_FINALS_APPEARANCE = 1
Clippers$NBA_FINALS_APPEARANCE = 0
Lakers$NBA_FINALS_APPEARANCE = 31
Grizzlies$NBA_FINALS_APPEARANCE = 0
Heat$NBA_FINALS_APPEARANCE = 4
Bucks$NBA_FINALS_APPEARANCE = 2
Timberwolves$NBA_FINALS_APPEARANCE = 0
Pelicans$NBA_FINALS_APPEARANCE = 0
Knicks$NBA_FINALS_APPEARANCE = 8
Thunder$NBA_FINALS_APPEARANCE = 1
Magic$NBA_FINALS_APPEARANCE = 2
Sixers$NBA_FINALS_APPEARANCE = 9
Suns$NBA_FINALS_APPEARANCE = 2
Blazers$NBA_FINALS_APPEARANCE = 3
Kings$NBA_FINALS_APPEARANCE = 1
Spurs$NBA_FINALS_APPEARANCE = 6
Raptors$NBA_FINALS_APPEARANCE = 0
Jazz$NBA_FINALS_APPEARANCE = 2
Wizards$NBA_FINALS_APPEARANCE = 4

teams = list( Hawks[Hawks$YEAR == "2015-16", ], Celtics[Celtics$YEAR == "2015-16", ],
              Nets[Nets$YEAR == "2015-16", ], Hornets[Hornets$YEAR == "2015-16", ], 
              Bulls[Bulls$YEAR == "2015-16", ], Cavaliers[Cavaliers$YEAR == "2015-16", ],
              Mavericks[Mavericks$YEAR == "2015-16", ], Nuggets[Nuggets$YEAR == "2015-16", ],
              Pistons[Pistons$YEAR == "2015-16", ], Warriors[Warriors$YEAR == "2015-16", ],
              Rockets[Rockets$YEAR == "2015-16", ], Pacers[Pacers$YEAR == "2015-16", ],
              Clippers[Clippers$YEAR == "2015-16", ], Lakers[Lakers$YEAR == "2015-16", ],
              Grizzlies[Grizzlies$YEAR == "2015-16", ], Heat[Heat$YEAR == "2015-16", ],
              Bucks[Bucks$YEAR == "2015-16", ], Timberwolves[Timberwolves$YEAR == "2015-16", ],
              Pelicans[Pelicans$YEAR == "2015-16", ], Knicks[Knicks$YEAR == "2015-16", ],
              Thunder[Thunder$YEAR == "2015-16", ], Magic[Magic$YEAR == "2015-16", ],
              Sixers[Sixers$YEAR == "2015-16", ], Suns[Suns$YEAR == "2015-16", ],
              Blazers[Blazers$YEAR == "2015-16", ], Kings[Kings$YEAR == "2015-16", ],
              Spurs[Spurs$YEAR == "2015-16", ], Raptors[Raptors$YEAR == "2015-16", ], 
              Jazz[Jazz$YEAR == "2015-16", ], Wizards[Wizards$YEAR == "2015-16", ])

NBA = Reduce(function(...) merge(..., all=TRUE), teams)
