tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

#1
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)

#2
# install.packages("lares")
library("lares")

corrected_tukey <- function(x) {
  if (!is.numeric(x) || !is.matrix(x)) {
    stop("x is not a numeric matrix!")
  }
  
  outliers <- array(TRUE, dim = dim(x))
  
  for (j in seq_len(ncol(x))) {
    columnOutliers <- !outlier_tukey(x[, j])
    outliers[, j] <- columnOutliers
  }
  
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  return(outlier.vec)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
finalTukey <- corrected_tukey(test_mat)
finalTukey