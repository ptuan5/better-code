s <- c(88, 91, 76, 95, 84, 79)
a <- c(1, 1, 0, 1, 1, 0)
b <- c(2, 2, 0, 3, 1, 2)
l <- c(0, 1, 0, 0, 2, 1)
nm <- c("ana", "ben", "cam", "dev", "eli", "fay")

d <- data.frame(nm, s, a, b, l)
d$k <- (d$s * 0.85) + (d$a * 10) + d$b - (d$l * 1.5)
d$k[d$k > 100] <- 100

print("stuff")
for (i in 1:nrow(d)) {
  if (d$k[i] >= 90) {
    print(paste(d$nm[i], "ready"))
  } else if (d$k[i] >= 80) {
    print(paste(d$nm[i], "close"))
  } else {
    print(paste(d$nm[i], "review"))
  }
}

print(mean(d$k))

h <- 0
m <- 0
lo <- 0

for (i in 1:nrow(d)) {
  if (d$k[i] >= 90) {
    h <- h + 1
  } else if (d$k[i] >= 80) {
    m <- m + 1
  } else {
    lo <- lo + 1
  }
}

print(c(h, m, lo))
