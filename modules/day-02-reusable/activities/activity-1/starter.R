library(tidyr)
library(ggplot2)

adipose_expression <- read.csv("mock_data_3_tissues/Adipose.csv")
liver_expression <- read.csv("mock_data_3_tissues/Liver.csv")
muscle_expression <- read.csv("mock_data_3_tissues/Muscle.csv")

lif_corr <- list()

# Find genes correlated with gene of interest in adipose
rownames(adipose_expression) <- adipose_expression$Gene
cor_matrix <- cor(t(adipose_expression[,2:10])) %>%
  as.data.frame()
cor_gene <- cor_matrix$LIF

lif_corr$Adipose <- data.frame(
  Gene = rownames(cor_matrix),
  Adipose = cor_gene
)

# Find genes correlated with gene of interest in liver
rownames(liver_expression) <- liver_expression$Gene
cor_matrix <- cor(t(liver_expression[,2:10])) %>%
  as.data.frame()
cor_gene <- cor_matrix$LIF

lif_corr$Liver <- data.frame(
  Gene = rownames(cor_matrix),
  Liver = cor_gene
)

# Find genes correlated with gene of interest in muscle
rownames(muscle_expression) <- muscle_expression$Gene
cor_matrix <- cor(t(muscle_expression[,2:10])) %>%
  as.data.frame()
cor_gene <- cor_matrix$LIF

lif_corr$Muscle <- data.frame(
  Gene = rownames(cor_matrix),
  Muscle = cor_gene
)

# Merge them into one data frame
merged_df <- merge(lif_corr$Adipose, lif_corr$Liver, by = "Gene") %>%
  merge(lif_corr$Muscle, by = "Gene") %>%
  filter(Gene != "LIF")

# Find genes that are highly correlated with LIF in all 3 tissues
highly_correlated_genes <- merged_df %>%
  filter(Adipose > 0.5 & Liver > 0.5 & Muscle > 0.5)
print(highly_correlated_genes)

# Plot the expression of these genes
all_expression_data = list(
  Adipose = adipose_expression,
  Liver = liver_expression,
  Muscle = muscle_expression
)
plots <- list()

for (tissue in c("Adipose", "Liver", "Muscle")) {
  expression_data <- all_expression_data[[tissue]]
  expression_data_long <- expression_data %>%
    filter(Gene %in% c(highly_correlated_genes$Gene, "LIF")) %>%
    pivot_longer(cols = -Gene, names_to = "Sample", values_to = "Expression")
  
  plots[[tissue]] <- ggplot(expression_data_long, aes(x = Sample, y = Expression, col = Gene, group = Gene)) +
    geom_point() + 
    geom_line() +
    theme_bw() + 
    labs(title = paste("Expression of Highly Correlated Genes in", tissue, "Tissue"))
}
