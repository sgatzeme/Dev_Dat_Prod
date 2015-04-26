library(ggplot2)
library(reshape)

options(scipen=999)
options(stringsAsFactors = FALSE)
options(digits=1)

# Set up source file name (full file path)
dataDir <- file.path(getwd(), "data")
files <- list.files(dataDir, pattern = "^.*\\.csv", full.names = T, recursive = F)
data.1 <- lapply(files, function(x) read.csv(x, header = TRUE, sep = ",", encoding="UTF-8"))
data.1 <- reshape::merge_all(data.1)
colnames(data.1)[1] <- "Country"
colnames(data.1)[5] <- "Population_Count"
data.1 <- unique(data.1[,-6])
data.1 <- data.1[order(data.1$Country, data.1$Sex),]
data.1$Population_Count <- data.1$Population_Count/1000000
country <- unique(data.1$Country)
sex <- unique(data.1$Sex)
area <- unique(data.1$Area)
year <- as.integer(unique(data.1$Year)) 