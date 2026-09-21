library(readxl)

assignmentData <- read_xlsx("m4_data.xlsx")

Frequency <- assignmentData$Frequency
BloodPressure <- assignmentData$BloodPressure
FirstAssess <- assignmentData$FirstAssess      # bad=1, good=0
SecondAssess <- assignmentData$SecondAssess    # low=0, high=1
FinalDecision <- assignmentData$FinalDecision  # low=0, high=1

df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision, stringsAsFactors = FALSE
)

# Inspect and handle NA:
summary(df_hosp)
df_hosp <- na.omit(df_hosp)

# A
boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp,
  names = c("Good","Bad"),
  ylab = "Blood Pressure",
  main = "BP by First MD Assessment"
)

boxplot(
  BloodPressure ~ SecondAssess,
  data = df_hosp,
  names = c("Low","High"),
  ylab = "Blood Pressure",
  main = "BP by Second MD Assessment"
)

boxplot(
  BloodPressure ~ FinalDecision,
  data = df_hosp,
  names = c("Low","High"),
  ylab = "Blood Pressure",
  main = "BP by Final Decision"
)

# B
hist(
  df_hosp$Frequency,
  breaks = seq(0, 1, by = 0.1),
  xlab = "Visit Frequency",
  main = "Histogram of Visit Frequency"
)

hist(
  df_hosp$BloodPressure,
  breaks = 8,
  xlab = "Blood Pressure",
  main = "Histogram of Blood Pressure"
)

