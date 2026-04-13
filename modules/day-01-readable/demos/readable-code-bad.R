## Simulated data
df <- matrix(
  c(10, 12, 15, 18, 
    4, 5, 7, 8, 
    20, 19, 18, 16),
  nrow = 3, byrow = TRUE,
  dimnames = list(c("GeneA", "GeneB", "GeneC"),
                  c("S1", "S2", "S3", "S4"))
)

x_var <- c(7.5, 8, 7.7, 6.8)
names(x_var) <- colnames(df)

## The function
take_res <- function(df, x_var) {
  res <- matrix(nrow = 0, ncol = ncol(df))
  colnames(res) <- colnames(df)
  for (i in 1:nrow(df)) {
    model <- lm(df[i,] ~ x_var)
    res <- rbind(res, model$residuals)
  }
  rownames(res) <- rownames(df)
  return(res)
}

## Mock output
mock_output <- take_res(df, x_var)
print(mock_output)