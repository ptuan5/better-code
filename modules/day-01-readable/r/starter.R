scores <- c(88, 91, 76, 95, 84)
attendance <- c(1, 1, 0, 1, 1)
bonus <- c(2, 2, 0, 3, 1)
n <- c("ana", "ben", "cam", "dev", "eli")

d <- data.frame(n, scores, attendance, bonus)
d$f <- (d$scores * 0.8) + (d$attendance * 10) + d$bonus

print("results")
for (i in 1:nrow(d)) {
  if (d$f[i] >= 90) {
    print(paste(d$n[i], "did great"))
  } else if (d$f[i] >= 80) {
    print(paste(d$n[i], "ok"))
  } else {
    print(paste(d$n[i], "needs help"))
  }
}

print(mean(d$f))
