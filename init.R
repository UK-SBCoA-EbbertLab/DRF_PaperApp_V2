install.packages(c(
  "remotes",
  "reshape2",
  "RIdeogram",
  "gridExtra",
  "plotly",
  "kableExtra",
  "data.table",
  "ggVennDiagram"
))

# Install dash from GitHub (includes html/core components)
remotes::install_github("plotly/dashR", upgrade = "always")

# Optional: Dash Bio from GitHub
remotes::install_github("plotly/dash-bio")

# Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
BiocManager::install("GenomicFeatures", ask = FALSE)
