# 1
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

A
B

A + B
A - B

# 2
D <- diag(c(4, 1, 2, 3))
D

# 3
E <- matrix(c(0, 2, 2, 2, 2), nrow = 5, ncol = 1)
E

E <- cbind(E, matrix(c(1, 0, 0, 0, 0), nrow = 5, ncol = 4))
E

E <- E + diag(3, nrow = 5, ncol = 5)
E
