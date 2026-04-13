df <- read.csv("simulated_expression_matrix.csv", row.names = 1)

find_de_genes <- function(df, alpha = 0.05) {
  library(reshape2)
  x <- log2(df + 1)
  x$gene <- rownames(x)
  y <- melt(x, id.vars = "gene", variable.name = "sample", value.name = "value")

  y$group <- unlist(sapply(y$sample, function(x) strsplit(as.character(x), split = "_")[[1]][1]))

  lapply(split(y, y$gene), function(i) {
    a <- t.test(value ~ group, data = i)
    a$p.value
  }) -> p
  p <- unlist(p)
  p2 <- p.adjust(p, method = "BH")
  sig <- p2[p2 < 0.05]

  library(dplyr)
  z <- y %>%
    dplyr::group_by(gene, group) %>%
    dplyr::summarise(mean = mean(value), .groups = "drop")
  zz <- dcast(gene ~ group, value.var = "mean", data = z)
  zz$fc <- zz[, 3] - zz[, 2]
  out <- data.frame(gene = names(p),
                    pval = p,
                    padj = p2)
  out <- merge(out, zz, by = "gene")
  out <- out[order(out$pval), ]
  res <- out[out$padj < alpha, ]
  return(res)
}

res = find_de_genes(df, alpha=0.05)
print(nrow(res))
print(head(res))
