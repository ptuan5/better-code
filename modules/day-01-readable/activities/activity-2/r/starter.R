g <- c("LIF", "SOCS3", "STAT3", "MALAT1", "IL6", "NEAT1")
m <- c(10.4, 9.7, 8.9, 7.5, 6.8, 8.1)
v <- c(2.1, 1.8, 1.6, 0.7, 2.4, 1.1)
z <- c(0, 0, 1, 2, 3, 1)
b <- c(2, 2, 1, 0, 3, 1)

x <- data.frame(g, m, v, z, b)
x$p <- (x$m * 1.2) + (x$v * 3) + x$b - (x$z * 1.5)
x$p[x$p > 20] <- 20

print("things")
for (i in 1:nrow(x)) {
  if (x$p[i] >= 15) {
    print(paste(x$g[i], "plot"))
  } else if (x$p[i] >= 11) {
    print(paste(x$g[i], "check"))
  } else {
    print(paste(x$g[i], "ignore"))
  }
}

print(mean(x$p))

h <- 0
m2 <- 0
lo <- 0

for (i in 1:nrow(x)) {
  if (x$p[i] >= 15) {
    h <- h + 1
  } else if (x$p[i] >= 11) {
    m2 <- m2 + 1
  } else {
    lo <- lo + 1
  }
}

print(c(h, m2, lo))
