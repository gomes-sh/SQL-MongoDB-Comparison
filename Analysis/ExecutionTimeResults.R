library(ggplot2)
library(ggpubr)
library(tidyr)

# Creating dataframe with data.

executionTimes <- data.frame (
  M.avg = c(73, 119, 72, 74, 73, 73, 73, 73, 73, 73, 73, 73, 72, 73, 73, 73, 73, 73, 73, 73),
  M.min = c(61, 60, 60, 60, 60, 62, 61, 61, 61, 61, 60, 61, 61, 60, 61, 60, 61, 60, 61, 60),
  M.max = c(61, 61, 61, 65, 61, 61, 63, 60, 61, 60, 61, 61, 61, 61, 60, 61, 60, 61, 61, 61),
  M.sum = c(56, 55, 55, 55, 55, 55, 55, 52, 55, 55, 56, 55, 56, 55, 55, 56, 55, 56, 56, 56),
  M.countUnder = c(58, 58, 58, 58, 59, 58, 58, 61, 58, 58, 58, 58, 58, 58, 57, 57, 58, 59, 58, 58),
  M.countPer = c(90, 92, 91, 91, 90, 90, 91, 90, 91, 92, 90, 91, 90, 90, 91, 91, 90, 90, 90, 90),
  M.searchMost = c(149, 158, 159, 159, 154, 155, 159, 162, 157, 156, 162, 140, 151, 161, 159, 159, 156, 157, 156, 159),
  S.avg = c(63, 54, 43, 48, 49, 40, 47, 38, 51, 53, 64, 33, 47, 45, 52, 54, 55, 47, 18, 44),
  S.min = c(49, 28, 38, 54, 37, 42, 47, 32, 37, 37, 49, 45, 49, 42, 47, 47, 42, 46, 39, 44),
  S.max = c(48, 44, 58, 47, 31, 32, 31, 58, 32, 40, 31, 35, 33, 46, 45, 52, 44, 47, 56, 63),
  S.sum = c(63, 54, 43, 48, 49, 40, 47, 38, 51, 53, 64, 33, 47, 45, 52, 54, 55, 47, 18, 44),
  S.countUnder = c(48, 43, 30, 42, 57, 24, 44, 45, 47, 44, 35, 46, 34, 51, 49, 59, 36, 47, 38, 27),
  S.countPer = c(87, 92, 95, 73, 76, 68, 92, 84, 74, 87, 99, 75, 95, 91, 108, 82, 105, 66, 59, 64),
  S.searchMost = c(458, 393, 414, 396, 415, 453, 430, 393, 414, 430, 434, 393, 398, 424, 415, 416, 428, 431, 378, 429)
)

# Insert execution times for SQL here.

means <- data.frame(
  names = c("MongoAverage", "MongoMinimum", "MongoMaximum", "MongoSum", "MongoCountUnder", "MongoCountPer", "MongoSearchMost", "SQLAverage", "SQLMinimum", "SQLMaximum", "SQLSum", "SQLCountUnder", "SQLCountPer", "SQLSearchMost"),
  msTimes = c(mean(executionTimes$M.avg), mean(executionTimes$M.min), mean(executionTimes$M.max), mean(executionTimes$M.sum), mean(executionTimes$M.countUnder), mean(executionTimes$M.countPer), mean(executionTimes$M.searchMost), mean(executionTimes$S.avg), mean(executionTimes$S.min), mean(executionTimes$S.max), mean(executionTimes$S.sum), mean(executionTimes$S.countUnder), mean(executionTimes$S.countPer), mean(executionTimes$S.searchMost)))

countUnder <- data.frame(
  names = c("MongoDB", "SQL"),
  msTimes = c(mean(executionTimes$M.countUnder), mean(executionTimes$S.countUnder))
)
countUnder.t <- ggbarplot(countUnder, x = "names", y = "msTimes", fill = "#ad0c0c", label = TRUE, lab.col = "white", lab.pos = "in", ylab = "Milliseconds", xlab = "Songs under 200,000 Milliseconds")

countPer <- data.frame(
  names = c("MongoDB", "SQL"),
  msTimes = c(mean(executionTimes$M.countPer), mean(executionTimes$S.countPer))
)
countPer.t <- ggbarplot(countPer, x = "names", y = "msTimes", fill = "#ad0c0c", label = TRUE, lab.col = "white", lab.pos = "in", ylab = "Milliseconds", xlab = "Songs per Genre")

searchMost <- data.frame(
  names = c("MongoDB", "SQL"),
  msTimes = c(mean(executionTimes$M.searchMost), mean(executionTimes$S.searchMost))
)
searchMost.t <- ggbarplot(searchMost, x = "names", y = "msTimes", fill = "#ad0c0c", label = TRUE, lab.col = "white", lab.pos = "in", ylab = "Milliseconds", xlab = "Artist with Most Songs")


table2 <- ggarrange(countUnder.t, countPer.t, searchMost.t, ncol = 3, nrow = 1, label.y = "Milliseconds")

increases <- data.frame(
  Command = c("Songs Per Genre", "Sum", "Under 200,000 ms", "Max", "Min", "Average", "Artist with Most Songs"),
  PercentIncrease = c(7.6, 14.4, 27.2, 28.5, 29.8, 37.2, 62.5),
  Slower = c("MongoDB", "MongoDB", "MongoDB", "MongoDB", "MongoDB", "MongoDB", "SQL")
)

increases.t <- ggbarplot(increases, x = "Command", y = "PercentIncrease", fill = "Slower", label = TRUE, lab.col = "white", lab.pos = "in", ylab = "Percent Increase", xlab = "Aggregate Queries")

# t-tests below
avgT <- t.test(executionTimes$M.avg, executionTimes$S.avg)
minT <- t.test(executionTimes$M.min, executionTimes$S.min)
maxT <- t.test(executionTimes$M.max, executionTimes$S.max)
sumT <- t.test(executionTimes$M.sum, executionTimes$S.sum)
countUnderT <- t.test(executionTimes$M.countUnder, executionTimes$S.countUnder)
countPerT <- t.test(executionTimes$M.countPer, executionTimes$S.countPer)
searchMostT <- t.test(executionTimes$M.searchMost, executionTimes$S.searchMost)

tTests <- data.frame(
  Command = c("Songs Per Genre", "Sum", "Under 200,000 ms", "Max", "Min", "Average", "Artist with Most Songs"),
  pvalue = c(.0000000001742, .0000000001028, .0000003425, .002541, .0000002946, .03722, .00000000000000022)
)
table(tTests)
