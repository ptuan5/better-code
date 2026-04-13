# Demo script for Day 3: exploratory code with hidden setup and no clear entry point.

library(dplyr)

setwd("/Users/name/Desktop/gene-set-project")

gene_set_uploads <- data.frame(
  created = c("01/10/2021", "03/15/2021", "07/02/2022", "04/21/2022", "08/08/2023", "09/14/2023"),
  model = c("mouse", "cell line", "mouse", "human", "human", "mouse"),
  search_text = c("opioid", "opioid", "opioid", "opioid", "opioid", "opioid")
)

x <- gene_set_uploads
x$created <- as.Date(x$created, format = "%m/%d/%Y")
x <- x %>% mutate(created = format(created, "%Y"))
y <- x[x$created >= "2021" & x$created <= "2023", ]
z <- y %>% count(created, model)

write.csv(z, "model_counts.csv", row.names = FALSE)
print("done")
