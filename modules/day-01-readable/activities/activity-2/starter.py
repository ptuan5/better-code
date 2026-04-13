import numpy as np
import pandas as pd
from scipy import stats

df = pd.read_csv("simulated_expression_matrix.csv", index_col=0)

def find_de_genes(df, alpha=0.05):
    x = np.log2(df + 1)
    x["gene"] = x.index
    y = x.melt(id_vars="gene", var_name="sample", value_name="value")
    y["group"] = [i.split("_")[0] for i in y["sample"]]

    p = np.array([])
    genes = np.array([])
    for gene, i in y.groupby("gene"):
        groups = list(i["group"].unique())
        g1 = i.loc[i["group"] == groups[0], "value"]
        g2 = i.loc[i["group"] == groups[1], "value"]

        a = stats.ttest_ind(g1, g2, equal_var=False)
        p = np.append(p, a.pvalue)
        genes = np.append(genes, gene)

    p2 = stats.false_discovery_control(p, method="bh")
    sig = p2[p2 < 0.05]
    z = y.groupby(["gene", "group"], as_index=False)["value"].mean()
    zz = z.pivot(index="gene", columns="group", values="value").reset_index()
    zz["fc"] = zz.iloc[:,2] - zz.iloc[:,1]

    out = pd.DataFrame({"gene": genes, "pval": p, "padj": p2})
    out = out.merge(zz, on="gene")
    out = out.sort_values("pval")
    res = out[out["padj"] < alpha]
    return res

res = find_de_genes(df, alpha=0.05)
print(len(res))
print(res.head())
