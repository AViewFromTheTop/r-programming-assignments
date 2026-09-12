#install.packages("tidyverse")
library("ggplot2")

Names <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

df_polls <- data.frame(Names, ABC_poll, CBS_poll)
str(df_polls)
head(df_polls)

# ABC
mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls$ABC_poll)

# CBS
mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)

# Both
range(df_polls[, c("ABC_poll", "CBS_poll")])
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll
df_polls

ggplot(df_polls, aes(Names, Diff)) +
  geom_bar(stat = "identity")
