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

#' Regress out a sample-level covariate from each gene (row)
#'
#' @param expression_matrix Gene expression matrix (genes x samples)
#' @param sample_covariate Covariate vector (length = number of samples)
#'
#' @return Numeric matrix of residuals with same dimensions and dimnames as input
regress_out_covariate <- function(expression_matrix, sample_covariate) {
  # initialize empty matrix with same number of columns (samples)
  residual_matrix <- matrix(nrow = 0, ncol = ncol(expression_matrix))
  colnames(residual_matrix) <- colnames(expression_matrix)

  for (gene_index in 1:nrow(expression_matrix)) {
    # fit linear model: gene expression ~ sample-level covariate, then keep residuals
    gene_model <- lm(expression_matrix[gene_index, ] ~ sample_covariate)
    residual_matrix <- rbind(residual_matrix, gene_model$residuals)
  }

  # restore original gene names
  rownames(residual_matrix) <- rownames(expression_matrix)
  return(residual_matrix)
}

## Mock output
mock_output <- regress_out_covariate(df, x_var)
print(mock_output)