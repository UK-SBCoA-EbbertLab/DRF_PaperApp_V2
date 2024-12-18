install.packages("dash")
install.packages("ggVennDiagram")
#install.packages("dashBio")
install.packages("reshape2")
install.packages("plotly")
install.packages("kableExtra")
install.packages("remotes")

# Bioconductor package
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("GenomicFeatures")

# GitHub package
remotes::install_github("plotly/dashR", upgrade = "always")
remotes::install_github("plotly/dash-bio")
