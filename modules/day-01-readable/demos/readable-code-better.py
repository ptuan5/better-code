#%%
import numpy as np
import pandas as pd
import statsmodels.api as sm

#%% Simulated data
df = pd.DataFrame(
    [[10,12,15,18],
     [4,5,7,8],
     [20,19,18,16]],
    index=["GeneA","GeneB","GeneC"],
    columns=["S1","S2","S3","S4"]
)

x_var = pd.Series([7.5,8,7.7,6.8], index=df.columns)

#%% THe function
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

#%% Test the function
mock_output = regress_out_covariate(df, x_var)
print(mock_output)