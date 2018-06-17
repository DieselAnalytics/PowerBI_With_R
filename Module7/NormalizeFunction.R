library(BBmisc)
library(readxl)
library(dplyr)

CombineData <-
	read_excel(path = "./Data/2017CombineData.xlsx", sheet = "Data") %>%
	mutate(`Normalize 40YD` = normalize(`40YD` * -1, method = "range", range = c(0, 10))) %>%
	select(Rk, Year, Player, Pos, AV, School, College, Height, Wt, `40YD`, Vertical, BenchReps,
	       `Broad Jump`, `3Cone`, Shuttle, `Drafted (tm/rnd/yr)`, `Normalize 40YD`) %>%
    arrange(`Normalize 40YD`)



