x <- c(4.2, 4.8, 5.1, 5.0)
y <- data.frame(v = x, d = x - mean(x))

write.csv(y, "out-R.csv", row.names = FALSE)
print(mean(x))
