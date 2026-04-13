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

#%% The function
def take_res(df, x_var):
    res = pd.DataFrame(np.empty((0, df.shape[1])))
    res.columns = df.columns
    for i in range(df.shape[0]):
        model = sm.OLS(df.iloc[i,:], sm.add_constant(x_var)).fit()
        res = pd.concat([res, pd.DataFrame([model.resid], columns=df.columns)])
    res.index = df.index
    return res

#%% Test the function
mock_output = take_res(df, x_var)
print(mock_output)
