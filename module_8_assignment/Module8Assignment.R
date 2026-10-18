#1
student6 <- read.table(file.choose(), header = TRUE, stringsAsFactors = FALSE, sep = ",")
student6

#install.packages("plyr")
library(plyr)

gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)
gender_mean

write.table(
  gender_mean,
  file = "module_8_gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)
print(read.table("module_8_gender_mean.txt", header = TRUE))

#2
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)
i_students

write.csv(
  i_students$Name,
  file = "module_8_i_students.csv",
  row.names = FALSE,
  quote = TRUE
)
print(read.csv("module_8_i_students.csv"))

#3
write.csv(
  i_students,
  file = "module_8_i_students_full.csv",
  row.names = FALSE
)
print(read.csv("module_8_i_students_full.csv"))

