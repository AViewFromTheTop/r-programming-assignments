#install.packages("AER")
library("AER")

data("HousePrices", package = "AER")
head(HousePrices)

#1
# Scatter plot
plot(HousePrices$lotsize, HousePrices$price, main = "Lot Size vs. House Price", xlab = "Lot Size", ylab = "House Price")

#Histogram
hist(HousePrices$lotsize, main = "Distribution of Lot Sizes", xlab = "Lot Size")

#2
library("lattice")

# Conditional scatter plot (small multiples)
xyplot(price ~ lotsize | factor(bedrooms), data = HousePrices, main = "House Price vs. Lot Size by Number of Bedrooms")

# Box-and-whisker plot
bwplot(lotsize ~ factor(stories), data = HousePrices, main = "Lot Size by Number of Stories")


# ggplot2
library("ggplot2")

# Scatter plot with smoothing
ggplot(HousePrices, aes(x = lotsize, y = price, color = factor(bedrooms))) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "House Price vs. Lot Size with trend by NUmber of Bedrooms")

# Faceted histogram
ggplot(HousePrices, aes(lotsize)) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~ stories) +
  labs(title = "Lot size distribution by Number of Stories")
