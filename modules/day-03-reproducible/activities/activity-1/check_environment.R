cat("R version:", R.version.string, "\n")

required_packages <- c("dplyr", "lubridate", "tidyr", "ggplot2", "data.table", "viridis")

for (package in required_packages) {
  suppressWarnings(
    suppressMessages(
      library(package, character.only = TRUE)
    )
  )
  cat(package, as.character(packageVersion(package)), "\n")
}
