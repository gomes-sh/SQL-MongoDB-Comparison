library(ggplot2)

# Creating dataframe with data.

executionTimes <- data.frame (
  M.avg = c(73, 119, 72, 74, 73, 73, 73, 73, 73, 73, 73, 73, 72, 73, 73, 73, 73, 73, 73, 73),
  M.min = c(61, 60, 60, 60, 60, 62, 61, 61, 61, 61, 60, 61, 61, 60, 61, 60, 61, 60, 61, 60),
  M.max = c(61, 61, 61, 65, 61, 61, 63, 60, 61, 60, 61, 61, 61, 61, 60, 61, 60, 61, 61, 61),
  M.sum = c(56, 55, 55, 55, 55, 55, 55, 52, 55, 55, 56, 55, 56, 55, 55, 56, 55, 56, 56, 56),
  M.countUnder = c(58, 58, 58, 58, 59, 58, 58, 61, 58, 58, 58, 58, 58, 58, 57, 57, 58, 59, 58, 58),
  M.countPer = c(90, 92, 91, 91, 90, 90, 91, 90, 91, 92, 90, 91, 90, 90, 91, 91, 90, 90, 90, 90),
  M.searchMost = c(149, 158, 159, 159, 154, 155, 159, 162, 157, 156, 162, 140, 151, 161, 159, 159, 156, 157, 156, 159)
)

# Insert execution times for SQL here.

means <- data.frame(
  names = c("Average", "Minimum", "Maximum", "Sum", "Count Under", "Count Per", "Search Most"),
  msTimes = c(mean(executionTimes$M.avg), mean(executionTimes$M.min), mean(executionTimes$M.max), mean(executionTimes$M.sum), mean(executionTimes$M.countUnder), mean(executionTimes$M.countPer), mean(executionTimes$M.searchMost)))

graph1 <- ggplot(means, aes(x = names, y = msTimes)) + geom_bar(stat= "identity")

