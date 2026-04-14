library(dplyr)

gene_set_uploads <- data.frame(
  created = c("01/10/2021", "03/15/2021", "07/02/2022", "04/21/2022", "08/08/2023", "09/14/2023"),
  model = c("mouse", "cell line", "mouse", "human", "human", "mouse"),
  search_text = c("opioid", "opioid", "opioid", "opioid", "opioid", "opioid")
)

build_model_counts <- function(path = ".", start_year = 2021, end_year = 2023) {
  setwd(path)

  x <- gene_set_uploads
  x$created <- as.Date(x$created, format = "%m/%d/%Y")
  x <- x %>% mutate(created = format(created, "%Y"))
  y <- x[x$created >= start_year & x$created <= end_year, ]
  z <- y %>% count(created, model)

  write.csv(z, "model_counts.csv", row.names = FALSE)
  print(z)
}

build_model_counts(".")
