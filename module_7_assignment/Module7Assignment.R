data(mtcars)
head(mtcars)
str(mtcars)

print(mtcars$disp)
summary(mtcars)
plot(mtcars$disp[1])
# All three of these work! Print displays all values in the vector,
# summary provides the mean, median, min, max, and 1st and 3rd quartiles of each vector,
# and plot displays the single number as a point on a plot.

# S3 Class
Block <- function(name, strength, color) {
  if (!is.character(name)) stop("Block Name must be a string!")
  if (!is.numeric(strength)) stop("Block Name must be numeric!")
  if (!is.character(name)) stop("Block Color must be a string!")
  
  blockProperties <- list(name = name, strength = strength, color = color)
  class(blockProperties) <- "Block"
  return(blockProperties)
}
print.Block <- function(block) {
  cat("Name: ", block$name, "\n")
  cat("Strength: ", block$strength, "\n")
  cat("Color: ", block$color, "\n")
}

stone <- Block("Stone", 3, "gray")
print(stone)

typeof(stone)

# S4 Class
setClass(
  "Block_S4",
  slots = c(
    name = "character",
    strength = "numeric",
    color = "character"
  )
)
setMethod(
  f = "show",
  signature = "Block_S4",
  definition = function(block) {
    cat("Name (but it's S4): ", block@name, "\n")
    cat("Strength (S4...): ", block@strength, "\n")
    cat("Color (Did someone say S4?): ", block@color, "\n")
  }
)

stoneS4 <- new("Block_S4", name = "Stone", strength = 3, color = "gray")

print(stoneS4)
