# Readable Code Demo

## Demo Goal

Show how a short function can still be hard to read when names, comments, and structure do not make the purpose obvious.

## Scenario

A labmate sends you a helper function from an RNA-seq analysis and says, "This is the magic function I found on Github from a published paper to process their RNA-seq data. Do you know what it does"

The function (R version):

```r
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
```

The function (Python version):

```python
import pandas as pd
import numpy as np
import statsmodels.api as sm

def take_res(df, x_var):
    res = pd.DataFrame(np.empty((0, df.shape[1])))
    res.columns = df.columns
    for i in range(df.shape[0]):
        model = sm.OLS(df.iloc[i,:], sm.add_constant(x_var)).fit()
        res = pd.concat([res, pd.DataFrame([model.resid], columns=df.columns)])
    res.index = df.index
    return res
```

This function works on your data, but do you know what it does? Mock data you can use in either version:

```text
expression_matrix
           S1   S2   S3   S4
GeneA      10   12   15   18
GeneB       4    5    7    8
GeneC      20   19   18   16

sample_covariate
S1  7.5
S2  8
S3  7.7
S4  6.8
```


- What does `df` contain?
- What exactly is `x_var`?
- What does the returned object represent?
- Which parts of the function are clear, and which parts make a reader stop?

## Demo Moves

1. Rename vague arguments to reveal meaning
2. Add comments where appropriate
3. Add explanation to show the intent
4. (optional) Appropriate spacing, indentation for formatting.

## After

Suggested readable version in R:

```r
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
```

Suggested readable version in Python:

```python
import pandas as pd
import numpy as np
import statsmodels.api as sm

def regress_out_covariate(expression_matrix, sample_covariate):
    """
    Regress out a sample-level covariate from each gene (row)

    Args:
        expression_matrix (pd.DataFrame): Numeric matrix (genes x samples)
        sample_covariate (pd.Series): Covariate vector (length = number of samples)
    
    Returns:
        Numeric matrix of residuals with same dimensions and dimnames as input
    """
    # initialize empty DataFrame with same columns (samples)
    residual_df = pd.DataFrame(columns=expression_matrix.columns)
    design_matrix = sm.add_constant(sample_covariate)

    for gene_name, gene_values in expression_matrix.iterrows():
        # fit linear model: gene expression ~ sample-level covariate, , then keep residuals
        gene_model = sm.OLS(gene_values, design_matrix).fit()
        residual_df.loc[gene_name] = gene_model.resid

    return residual_df
```

What the readable version improves:

- `expression_matrix` and `sample_covariate` explain what the inputs represent
- `residual_matrix` says what the output contains
- the loop variable names tell the reader what each iteration means
- the short comment explains both the input orientation and the return value

## Suggested Talking Points

- Short functions still need clear input and output meaning.
- Names should help the reader infer what each object represents.
- Comments are most useful when they explain intent or assumptions, not just restate the loop.
- Readability improvements should preserve behavior, not change the analysis.
