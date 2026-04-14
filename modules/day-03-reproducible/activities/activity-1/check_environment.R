required_packages <- c("dplyr", "tidyr", "tibble", "ggplot2", "optparse")

missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_packages) > 0) {
  stop(
    sprintf(
      "Missing R packages: %s",
      paste(missing_packages, collapse = ", ")
    )
  )
}

output_dir <- "results"
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

output_path <- file.path(output_dir, "environment_check_R.txt")
output_lines <- c(
  paste("R=", getRversion(), sep = ""),
  vapply(
    required_packages,
    function(pkg) paste(pkg, "=", as.character(packageVersion(pkg)), sep = ""),
    character(1)
  )
)

writeLines(output_lines, output_path)

cat("R environment check passed.\n")
cat("Wrote:", output_path, "\n")
cat(paste(output_lines, collapse = "\n"), "\n")
