library(dash)
library(ggVennDiagram)
#library(dashCoreComponents)
library(dashBio)
library(dashHtmlComponents)
library(reshape2)
library(plotly)
library(kableExtra)
library(gridExtra)
library(data.table)


#SET THIS WD
setwd("~/Documents/EbbertLab/CHM13PaperFigures/DRF_PaperApp_V2/")

# Create a Dash app
app <- dash_app()

# Biotype

## Illumina250RL
### CHM13
Illumina250.CHM13.darkMerged = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina250.CHM13.darkMerged$size = Illumina250.CHM13.darkMerged$V3 - Illumina250.CHM13.darkMerged$V2
Illumina250.CHM13.depthMerged = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.CHM13.depthMerged$size = Illumina250.CHM13.depthMerged$end - Illumina250.CHM13.depthMerged$start
Illumina250.CHM13.mapqMerged = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.CHM13.mapqMerged$size = Illumina250.CHM13.mapqMerged$end - Illumina250.CHM13.mapqMerged$start

dark.Illumina250.CHM13.biotype = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina250.CHM13.biotype = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina250.CHM13.biotype = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina250.CHM13.biotype = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

### New Run
Illumina250.new.CHM13.darkMerged = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina250.new.CHM13.darkMerged$size = Illumina250.new.CHM13.darkMerged$V3 - Illumina250.new.CHM13.darkMerged$V2
Illumina250.new.CHM13.depthMerged = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.new.CHM13.depthMerged$size = Illumina250.new.CHM13.depthMerged$end - Illumina250.new.CHM13.depthMerged$start
Illumina250.new.CHM13.mapqMerged = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.new.CHM13.mapqMerged$size = Illumina250.new.CHM13.mapqMerged$end - Illumina250.new.CHM13.mapqMerged$start

dark.new.Illumina250.CHM13.biotype = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina250.CHM13.biotype = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina250.CHM13.biotype = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina250.CHM13.biotype = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)



### HG38_noAlt
Illumina250.HG38_noAlt.darkMerged = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina250.HG38_noAlt.darkMerged$size = Illumina250.HG38_noAlt.darkMerged$V3 - Illumina250.HG38_noAlt.darkMerged$V2
Illumina250.HG38_noAlt.depthMerged = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.HG38_noAlt.depthMerged$size = Illumina250.HG38_noAlt.depthMerged$end - Illumina250.HG38_noAlt.depthMerged$start
Illumina250.HG38_noAlt.mapqMerged = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.HG38_noAlt.mapqMerged$size = Illumina250.HG38_noAlt.mapqMerged$end - Illumina250.HG38_noAlt.mapqMerged$start

dark.Illumina250.HG38_noAlt.biotype = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina250.HG38_noAlt.biotype = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina250.HG38_noAlt.biotype = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina250.HG38_noAlt.biotype = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

### New Run
Illumina250.new.HG38_noAlt.darkMerged = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina250.new.HG38_noAlt.darkMerged$size = Illumina250.new.HG38_noAlt.darkMerged$V3 - Illumina250.new.HG38_noAlt.darkMerged$V2
Illumina250.new.HG38_noAlt.depthMerged = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.new.HG38_noAlt.depthMerged$size = Illumina250.new.HG38_noAlt.depthMerged$end - Illumina250.new.HG38_noAlt.depthMerged$start
Illumina250.new.HG38_noAlt.mapqMerged = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.new.HG38_noAlt.mapqMerged$size = Illumina250.new.HG38_noAlt.mapqMerged$end - Illumina250.new.HG38_noAlt.mapqMerged$start

dark.new.Illumina250.HG38_noAlt.biotype = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina250.HG38_noAlt.biotype = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina250.HG38_noAlt.biotype = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina250.HG38_noAlt.biotype = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


### HG38_Alt
Illumina250.HG38_Alt.darkMerged = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina250.HG38_Alt.darkMerged$size = Illumina250.HG38_Alt.darkMerged$V3 - Illumina250.HG38_Alt.darkMerged$V2
Illumina250.HG38_Alt.depthMerged = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.HG38_Alt.depthMerged$size = Illumina250.HG38_Alt.depthMerged$end - Illumina250.HG38_Alt.depthMerged$start
Illumina250.HG38_Alt.mapqMerged = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.HG38_Alt.mapqMerged$size = Illumina250.HG38_Alt.mapqMerged$end - Illumina250.HG38_Alt.mapqMerged$start

dark.Illumina250.HG38_Alt.biotype = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina250.HG38_Alt.biotype = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina250.HG38_Alt.biotype = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina250.HG38_Alt.biotype = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

### New Run
Illumina250.new.HG38_Alt.darkMerged = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina250.new.HG38_Alt.darkMerged$size = Illumina250.new.HG38_Alt.darkMerged$V3 - Illumina250.new.HG38_Alt.darkMerged$V2
Illumina250.new.HG38_Alt.depthMerged = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.new.HG38_Alt.depthMerged$size = Illumina250.new.HG38_Alt.depthMerged$end - Illumina250.new.HG38_Alt.depthMerged$start
Illumina250.new.HG38_Alt.mapqMerged = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.new.HG38_Alt.mapqMerged$size = Illumina250.new.HG38_Alt.mapqMerged$end - Illumina250.new.HG38_Alt.mapqMerged$start

dark.new.Illumina250.HG38_Alt.biotype = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina250.HG38_Alt.biotype = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina250.HG38_Alt.biotype = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina250.HG38_Alt.biotype = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)



### HG19_noAlt
Illumina250.HG19_noAlt.darkMerged = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina250.HG19_noAlt.darkMerged$size = Illumina250.HG19_noAlt.darkMerged$V3 - Illumina250.HG19_noAlt.darkMerged$V2
Illumina250.HG19_noAlt.depthMerged = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.HG19_noAlt.depthMerged$size = Illumina250.HG19_noAlt.depthMerged$end - Illumina250.HG19_noAlt.depthMerged$start
Illumina250.HG19_noAlt.mapqMerged = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.HG19_noAlt.mapqMerged$size = Illumina250.HG19_noAlt.mapqMerged$end - Illumina250.HG19_noAlt.mapqMerged$start

dark.Illumina250.HG19_noAlt.biotype = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina250.HG19_noAlt.biotype = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina250.HG19_noAlt.biotype = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina250.HG19_noAlt.biotype = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

### New Run
Illumina250.new.HG19_noAlt.darkMerged = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina250.new.HG19_noAlt.darkMerged$size = Illumina250.new.HG19_noAlt.darkMerged$V3 - Illumina250.new.HG19_noAlt.darkMerged$V2
Illumina250.new.HG19_noAlt.depthMerged = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.new.HG19_noAlt.depthMerged$size = Illumina250.new.HG19_noAlt.depthMerged$end - Illumina250.new.HG19_noAlt.depthMerged$start
Illumina250.new.HG19_noAlt.mapqMerged = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina250.new.HG19_noAlt.mapqMerged$size = Illumina250.new.HG19_noAlt.mapqMerged$end - Illumina250.new.HG19_noAlt.mapqMerged$start

dark.new.Illumina250.HG19_noAlt.biotype = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina250.HG19_noAlt.biotype = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina250.HG19_noAlt.biotype = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina250.HG19_noAlt.biotype = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


####################################################################################################################################################################################################################3
## Illumina100RL
### CHM13
Illumina100.CHM13.darkMerged = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina100.CHM13.darkMerged$size = Illumina100.CHM13.darkMerged$V3 - Illumina100.CHM13.darkMerged$V2
Illumina100.CHM13.depthMerged = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.CHM13.depthMerged$size = Illumina100.CHM13.depthMerged$end - Illumina100.CHM13.depthMerged$start
Illumina100.CHM13.mapqMerged = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.CHM13.mapqMerged$size = Illumina100.CHM13.mapqMerged$end - Illumina100.CHM13.mapqMerged$start

dark.Illumina100.CHM13.biotype = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.CHM13.biotype = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.CHM13.biotype = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.CHM13.biotype = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

### NewRun
Illumina100.new.CHM13.darkMerged = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina100.new.CHM13.darkMerged$size = Illumina100.new.CHM13.darkMerged$V3 - Illumina100.new.CHM13.darkMerged$V2
Illumina100.new.CHM13.depthMerged = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.new.CHM13.depthMerged$size = Illumina100.new.CHM13.depthMerged$end - Illumina100.new.CHM13.depthMerged$start
Illumina100.new.CHM13.mapqMerged = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.new.CHM13.mapqMerged$size = Illumina100.new.CHM13.mapqMerged$end - Illumina100.new.CHM13.mapqMerged$start

dark.new.Illumina100.CHM13.biotype = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina100.CHM13.biotype = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina100.CHM13.biotype = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina100.CHM13.biotype = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)



####################################################################################################################################################################################################################3
### HG38_noAlt
Illumina100.HG38_noAlt.darkMerged = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina100.HG38_noAlt.darkMerged$size = Illumina100.HG38_noAlt.darkMerged$V3 - Illumina100.HG38_noAlt.darkMerged$V2
Illumina100.HG38_noAlt.depthMerged = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.HG38_noAlt.depthMerged$size = Illumina100.HG38_noAlt.depthMerged$end - Illumina100.HG38_noAlt.depthMerged$start
Illumina100.HG38_noAlt.mapqMerged = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.HG38_noAlt.mapqMerged$size = Illumina100.HG38_noAlt.mapqMerged$end - Illumina100.HG38_noAlt.mapqMerged$start

dark.Illumina100.HG38_noAlt.biotype = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.HG38_noAlt.biotype = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.HG38_noAlt.biotype = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.HG38_noAlt.biotype = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


### NewRun
Illumina100.new.HG38_noAlt.darkMerged = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina100.new.HG38_noAlt.darkMerged$size = Illumina100.new.HG38_noAlt.darkMerged$V3 - Illumina100.new.HG38_noAlt.darkMerged$V2
Illumina100.new.HG38_noAlt.depthMerged = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.new.HG38_noAlt.depthMerged$size = Illumina100.new.HG38_noAlt.depthMerged$end - Illumina100.new.HG38_noAlt.depthMerged$start
Illumina100.new.HG38_noAlt.mapqMerged = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.new.HG38_noAlt.mapqMerged$size = Illumina100.new.HG38_noAlt.mapqMerged$end - Illumina100.new.HG38_noAlt.mapqMerged$start

dark.new.Illumina100.HG38_noAlt.biotype = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina100.HG38_noAlt.biotype = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina100.HG38_noAlt.biotype = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina100.HG38_noAlt.biotype = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


####################################################################################################################################################################################################################3
### HG38_Alt
Illumina100.HG38_Alt.darkMerged = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina100.HG38_Alt.darkMerged$size = Illumina100.HG38_Alt.darkMerged$V3 - Illumina100.HG38_Alt.darkMerged$V2
Illumina100.HG38_Alt.depthMerged = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.HG38_Alt.depthMerged$size = Illumina100.HG38_Alt.depthMerged$end - Illumina100.HG38_Alt.depthMerged$start
Illumina100.HG38_Alt.mapqMerged = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.HG38_Alt.mapqMerged$size = Illumina100.HG38_Alt.mapqMerged$end - Illumina100.HG38_Alt.mapqMerged$start

dark.Illumina100.HG38_Alt.biotype = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.HG38_Alt.biotype = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.HG38_Alt.biotype = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.HG38_Alt.biotype = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


### NewRun
Illumina100.new.HG38_Alt.darkMerged = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina100.new.HG38_Alt.darkMerged$size = Illumina100.new.HG38_Alt.darkMerged$V3 - Illumina100.new.HG38_Alt.darkMerged$V2
Illumina100.new.HG38_Alt.depthMerged = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.new.HG38_Alt.depthMerged$size = Illumina100.new.HG38_Alt.depthMerged$end - Illumina100.new.HG38_Alt.depthMerged$start
Illumina100.new.HG38_Alt.mapqMerged = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.new.HG38_Alt.mapqMerged$size = Illumina100.new.HG38_Alt.mapqMerged$end - Illumina100.new.HG38_Alt.mapqMerged$start

dark.new.Illumina100.HG38_Alt.biotype = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina100.HG38_Alt.biotype = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina100.HG38_Alt.biotype = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina100.HG38_Alt.biotype = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


####################################################################################################################################################################################################################3
### HG19_noAlt
Illumina100.HG19_noAlt.darkMerged = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina100.HG19_noAlt.darkMerged$size = Illumina100.HG19_noAlt.darkMerged$V3 - Illumina100.HG19_noAlt.darkMerged$V2
Illumina100.HG19_noAlt.depthMerged = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.HG19_noAlt.depthMerged$size = Illumina100.HG19_noAlt.depthMerged$end - Illumina100.HG19_noAlt.depthMerged$start
Illumina100.HG19_noAlt.mapqMerged = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.HG19_noAlt.mapqMerged$size = Illumina100.HG19_noAlt.mapqMerged$end - Illumina100.HG19_noAlt.mapqMerged$start

dark.Illumina100.HG19_noAlt.biotype = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.HG19_noAlt.biotype = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.HG19_noAlt.biotype = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.HG19_noAlt.biotype = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


### NewRun
Illumina100.new.HG19_noAlt.darkMerged = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
Illumina100.new.HG19_noAlt.darkMerged$size = Illumina100.new.HG19_noAlt.darkMerged$V3 - Illumina100.new.HG19_noAlt.darkMerged$V2
Illumina100.new.HG19_noAlt.depthMerged = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.new.HG19_noAlt.depthMerged$size = Illumina100.new.HG19_noAlt.depthMerged$end - Illumina100.new.HG19_noAlt.depthMerged$start
Illumina100.new.HG19_noAlt.mapqMerged = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
Illumina100.new.HG19_noAlt.mapqMerged$size = Illumina100.new.HG19_noAlt.mapqMerged$end - Illumina100.new.HG19_noAlt.mapqMerged$start

dark.new.Illumina100.HG19_noAlt.biotype = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina100.HG19_noAlt.biotype = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina100.HG19_noAlt.biotype = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina100.HG19_noAlt.biotype = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


###############################################################################################################################################################################################
## ONT
### CHM13
ONT.CHM13.darkMerged = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
ONT.CHM13.darkMerged$size = ONT.CHM13.darkMerged$V3 - ONT.CHM13.darkMerged$V2
ONT.CHM13.depthMerged = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.CHM13.depthMerged$size = ONT.CHM13.depthMerged$end - ONT.CHM13.depthMerged$start
ONT.CHM13.mapqMerged = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.CHM13.mapqMerged$size = ONT.CHM13.mapqMerged$end - ONT.CHM13.mapqMerged$start

dark.ONT.CHM13.biotype = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.CHM13.biotype = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.CHM13.biotype = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.CHM13.biotype = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_camo_biotypes.txt", sep="\t",stringsAsFactors = F, header=T)

#### New Run

ONT.new.CHM13.darkMerged = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
ONT.new.CHM13.darkMerged$size = ONT.new.CHM13.darkMerged$V3 - ONT.new.CHM13.darkMerged$V2
ONT.new.CHM13.depthMerged = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.new.CHM13.depthMerged$size = ONT.new.CHM13.depthMerged$end - ONT.new.CHM13.depthMerged$start
ONT.new.CHM13.mapqMerged = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.new.CHM13.mapqMerged$size = ONT.new.CHM13.mapqMerged$end - ONT.new.CHM13.mapqMerged$start

dark.ONT.new.CHM13.biotype = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.new.CHM13.biotype = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.new.CHM13.biotype = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.new.CHM13.biotype = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_camo_biotypes.txt", sep="\t",stringsAsFactors = F, header=T)

###############################################################################################################################################################################################
### HG38_noAlt
ONT.HG38_noAlt.darkMerged = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
ONT.HG38_noAlt.darkMerged$size = ONT.HG38_noAlt.darkMerged$V3 - ONT.HG38_noAlt.darkMerged$V2
ONT.HG38_noAlt.depthMerged = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.HG38_noAlt.depthMerged$size = ONT.HG38_noAlt.depthMerged$end - ONT.HG38_noAlt.depthMerged$start
ONT.HG38_noAlt.mapqMerged = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.HG38_noAlt.mapqMerged$size = ONT.HG38_noAlt.mapqMerged$end - ONT.HG38_noAlt.mapqMerged$start

dark.ONT.HG38_noAlt.biotype = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.HG38_noAlt.biotype = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.HG38_noAlt.biotype = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.HG38_noAlt.biotype = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

###### New Run

ONT.new.HG38_noAlt.darkMerged = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
ONT.new.HG38_noAlt.darkMerged$size = ONT.new.HG38_noAlt.darkMerged$V3 - ONT.new.HG38_noAlt.darkMerged$V2
ONT.new.HG38_noAlt.depthMerged = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.new.HG38_noAlt.depthMerged$size = ONT.new.HG38_noAlt.depthMerged$end - ONT.new.HG38_noAlt.depthMerged$start
ONT.new.HG38_noAlt.mapqMerged = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.new.HG38_noAlt.mapqMerged$size = ONT.new.HG38_noAlt.mapqMerged$end - ONT.new.HG38_noAlt.mapqMerged$start

dark.ONT.new.HG38_noAlt.biotype = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.new.HG38_noAlt.biotype = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.new.HG38_noAlt.biotype = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.new.HG38_noAlt.biotype = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

###############################################################################################################################################################################################
### HG38_Alt
ONT.HG38_Alt.darkMerged = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
ONT.HG38_Alt.darkMerged$size = ONT.HG38_Alt.darkMerged$V3 - ONT.HG38_Alt.darkMerged$V2
ONT.HG38_Alt.depthMerged = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.HG38_Alt.depthMerged$size = ONT.HG38_Alt.depthMerged$end - ONT.HG38_Alt.depthMerged$start
ONT.HG38_Alt.mapqMerged = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.HG38_Alt.mapqMerged$size = ONT.HG38_Alt.mapqMerged$end - ONT.HG38_Alt.mapqMerged$start

dark.ONT.HG38_Alt.biotype = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.HG38_Alt.biotype = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.HG38_Alt.biotype = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.HG38_Alt.biotype = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

##### New Run
ONT.new.HG38_Alt.darkMerged = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
ONT.new.HG38_Alt.darkMerged$size = ONT.new.HG38_Alt.darkMerged$V3 - ONT.new.HG38_Alt.darkMerged$V2
ONT.new.HG38_Alt.depthMerged = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.new.HG38_Alt.depthMerged$size = ONT.new.HG38_Alt.depthMerged$end - ONT.new.HG38_Alt.depthMerged$start
ONT.new.HG38_Alt.mapqMerged = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.new.HG38_Alt.mapqMerged$size = ONT.new.HG38_Alt.mapqMerged$end - ONT.new.HG38_Alt.mapqMerged$start

dark.ONT.new.HG38_Alt.biotype = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.new.HG38_Alt.biotype = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.new.HG38_Alt.biotype = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.new.HG38_Alt.biotype = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


###############################################################################################################################################################################################
### HG19_noAlt
ONT.HG19_noAlt.darkMerged = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
ONT.HG19_noAlt.darkMerged$size = ONT.HG19_noAlt.darkMerged$V3 - ONT.HG19_noAlt.darkMerged$V2
ONT.HG19_noAlt.depthMerged = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.HG19_noAlt.depthMerged$size = ONT.HG19_noAlt.depthMerged$end - ONT.HG19_noAlt.depthMerged$start
ONT.HG19_noAlt.mapqMerged = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.HG19_noAlt.mapqMerged$size = ONT.HG19_noAlt.mapqMerged$end - ONT.HG19_noAlt.mapqMerged$start

dark.ONT.HG19_noAlt.biotype = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.HG19_noAlt.biotype = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.HG19_noAlt.biotype = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.HG19_noAlt.biotype = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

###### New Run
ONT.new.HG19_noAlt.darkMerged = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
ONT.new.HG19_noAlt.darkMerged$size = ONT.new.HG19_noAlt.darkMerged$V3 - ONT.new.HG19_noAlt.darkMerged$V2
ONT.new.HG19_noAlt.depthMerged = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.new.HG19_noAlt.depthMerged$size = ONT.new.HG19_noAlt.depthMerged$end - ONT.new.HG19_noAlt.depthMerged$start
ONT.new.HG19_noAlt.mapqMerged = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
ONT.new.HG19_noAlt.mapqMerged$size = ONT.new.HG19_noAlt.mapqMerged$end - ONT.new.HG19_noAlt.mapqMerged$start

dark.ONT.new.HG19_noAlt.biotype = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.new.HG19_noAlt.biotype = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.new.HG19_noAlt.biotype = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.new.HG19_noAlt.biotype = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

###############################################################################################################################################################################################
## PacBio
### CHM13
PacBio.CHM13.darkMerged = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
PacBio.CHM13.darkMerged$size = PacBio.CHM13.darkMerged$V3 - PacBio.CHM13.darkMerged$V2
PacBio.CHM13.depthMerged = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.CHM13.depthMerged$size = PacBio.CHM13.depthMerged$end - PacBio.CHM13.depthMerged$start
PacBio.CHM13.mapqMerged = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.CHM13.mapqMerged$size = PacBio.CHM13.mapqMerged$end - PacBio.CHM13.mapqMerged$start

dark.pacbio.CHM13.biotype = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.CHM13.biotype = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.CHM13.biotype = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.CHM13.biotype = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

#### New Run
PacBio.new.CHM13.darkMerged = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
PacBio.new.CHM13.darkMerged$size = PacBio.new.CHM13.darkMerged$V3 - PacBio.new.CHM13.darkMerged$V2
PacBio.new.CHM13.depthMerged = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.new.CHM13.depthMerged$size = PacBio.new.CHM13.depthMerged$end - PacBio.new.CHM13.depthMerged$start
PacBio.new.CHM13.mapqMerged = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.new.CHM13.mapqMerged$size = PacBio.new.CHM13.mapqMerged$end - PacBio.new.CHM13.mapqMerged$start

dark.pacbio.new.CHM13.biotype = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.new.CHM13.biotype = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.new.CHM13.biotype = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.new.CHM13.biotype = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

###############################################################################################################################################################################################
### HG19_noAlt
PacBio.HG19_noAlt.darkMerged = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
PacBio.HG19_noAlt.darkMerged$size = PacBio.HG19_noAlt.darkMerged$V3 - PacBio.HG19_noAlt.darkMerged$V2
PacBio.HG19_noAlt.depthMerged = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.HG19_noAlt.depthMerged$size = PacBio.HG19_noAlt.depthMerged$end - PacBio.HG19_noAlt.depthMerged$start
PacBio.HG19_noAlt.mapqMerged = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.HG19_noAlt.mapqMerged$size = PacBio.HG19_noAlt.mapqMerged$end - PacBio.HG19_noAlt.mapqMerged$start

dark.pacbio.HG19_noAlt.biotype = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.HG19_noAlt.biotype = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.HG19_noAlt.biotype = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.HG19_noAlt.biotype = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

##### New Run
PacBio.new.HG19_noAlt.darkMerged = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
PacBio.new.HG19_noAlt.darkMerged$size = PacBio.new.HG19_noAlt.darkMerged$V3 - PacBio.new.HG19_noAlt.darkMerged$V2
PacBio.new.HG19_noAlt.depthMerged = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.new.HG19_noAlt.depthMerged$size = PacBio.new.HG19_noAlt.depthMerged$end - PacBio.new.HG19_noAlt.depthMerged$start
PacBio.new.HG19_noAlt.mapqMerged = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.new.HG19_noAlt.mapqMerged$size = PacBio.new.HG19_noAlt.mapqMerged$end - PacBio.new.HG19_noAlt.mapqMerged$start

dark.pacbio.new.HG19_noAlt.biotype = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.new.HG19_noAlt.biotype = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.new.HG19_noAlt.biotype = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.new.HG19_noAlt.biotype = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

###############################################################################################################################################################################################
### HG38_noAlt
PacBio.HG38_noAlt.darkMerged = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
PacBio.HG38_noAlt.darkMerged$size = PacBio.HG38_noAlt.darkMerged$V3 - PacBio.HG38_noAlt.darkMerged$V2
PacBio.HG38_noAlt.depthMerged = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.HG38_noAlt.depthMerged$size = PacBio.HG38_noAlt.depthMerged$end - PacBio.HG38_noAlt.depthMerged$start
PacBio.HG38_noAlt.mapqMerged = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.HG38_noAlt.mapqMerged$size = PacBio.HG38_noAlt.mapqMerged$end - PacBio.HG38_noAlt.mapqMerged$start

dark.pacbio.HG38_noAlt.biotype = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.HG38_noAlt.biotype = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.HG38_noAlt.biotype = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.HG38_noAlt.biotype = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

#### New Run
PacBio.new.HG38_noAlt.darkMerged = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
PacBio.new.HG38_noAlt.darkMerged$size = PacBio.new.HG38_noAlt.darkMerged$V3 - PacBio.new.HG38_noAlt.darkMerged$V2
PacBio.new.HG38_noAlt.depthMerged = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.new.HG38_noAlt.depthMerged$size = PacBio.new.HG38_noAlt.depthMerged$end - PacBio.new.HG38_noAlt.depthMerged$start
PacBio.new.HG38_noAlt.mapqMerged = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.new.HG38_noAlt.mapqMerged$size = PacBio.new.HG38_noAlt.mapqMerged$end - PacBio.new.HG38_noAlt.mapqMerged$start

dark.pacbio.new.HG38_noAlt.biotype = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.new.HG38_noAlt.biotype = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.new.HG38_noAlt.biotype = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.new.HG38_noAlt.biotype = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)


###############################################################################################################################################################################################
### HG38_alt
PacBio.HG38_alt.darkMerged = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
PacBio.HG38_alt.darkMerged$size = PacBio.HG38_alt.darkMerged$V3 - PacBio.HG38_alt.darkMerged$V2
PacBio.HG38_alt.depthMerged = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.HG38_alt.depthMerged$size = PacBio.HG38_alt.depthMerged$end - PacBio.HG38_alt.depthMerged$start
PacBio.HG38_alt.mapqMerged = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.HG38_alt.mapqMerged$size = PacBio.HG38_alt.mapqMerged$end - PacBio.HG38_alt.mapqMerged$start

dark.pacbio.HG38_alt.biotype = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.HG38_alt.biotype = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.HG38_alt.biotype = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.HG38_alt.biotype = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

#### New Run
PacBio.new.HG38_alt.darkMerged = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.dark-merged.bed", sep="\t", stringsAsFactors = F, header=F)
PacBio.new.HG38_alt.darkMerged$size = PacBio.new.HG38_alt.darkMerged$V3 - PacBio.new.HG38_alt.darkMerged$V2
PacBio.new.HG38_alt.depthMerged = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.low_depth-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.new.HG38_alt.depthMerged$size = PacBio.new.HG38_alt.depthMerged$end - PacBio.new.HG38_alt.depthMerged$start
PacBio.new.HG38_alt.mapqMerged = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.low_mapq-merged.bed", sep="\t", stringsAsFactors = F, header=T)
PacBio.new.HG38_alt.mapqMerged$size = PacBio.new.HG38_alt.mapqMerged$end - PacBio.new.HG38_alt.mapqMerged$start

dark.pacbio.new.HG38_alt.biotype = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_dark_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.new.HG38_alt.biotype = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_depth_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.new.HG38_alt.biotype = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_mapq_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.new.HG38_alt.biotype = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_camo_biotypes.txt", sep="\t", stringsAsFactors = F, header=T)

###############################################################################################################################################################################################

nucsAndRegions = data.table(
  "Region_type"=c(rep(c("All_Dark","Low_Depth", "Low_Mapq"), 16)), 
  "Platform"=c(rep("ONT", 3), rep("ONT", 3), rep("ONT", 3), rep("ONT", 3), rep("PacBio", 3), rep("PacBio", 3), rep("PacBio", 3), rep("PacBio", 3), rep("Illumina250", 3), rep("Illumina250", 3), rep("Illumina250", 3), rep("Illumina250", 3),  rep("Illumina100", 3),  rep("Illumina100", 3),  rep("Illumina100", 3),  rep("Illumina100", 3)), 
  "Reference"=c(rep("CHM13", 3), rep("HG38_noAlt", 3), rep("HG19_noAlt", 3), rep("HG38_alt", 3), rep("CHM13", 3), rep("HG19_noAlt", 3), rep("HG38_noAlt", 3), rep("HG38_alt", 3), rep("CHM13", 3), rep("HG38_noAlt", 3), rep("HG38_alt", 3), rep("HG19_noAlt", 3), rep("HG19_noAlt", 3), rep("HG38_noAlt", 3), rep("CHM13", 3), rep("HG38_alt", 3)), 
  "Nucleotide_count"=c(sum(ONT.CHM13.darkMerged$size), sum(ONT.CHM13.depthMerged$size), sum(ONT.CHM13.mapqMerged$size), 
                       sum(ONT.HG38_noAlt.darkMerged$size), sum(ONT.HG38_noAlt.depthMerged$size), sum(ONT.HG38_noAlt.mapqMerged$size),
                       sum(ONT.HG19_noAlt.darkMerged$size), sum(ONT.HG19_noAlt.depthMerged$size), sum(ONT.HG19_noAlt.mapqMerged$size),
                       sum(ONT.HG38_Alt.darkMerged$size), sum(ONT.HG38_Alt.depthMerged$size), sum(ONT.HG38_Alt.mapqMerged$size), 
                       sum(PacBio.CHM13.darkMerged$size), sum(PacBio.CHM13.depthMerged$size), sum(PacBio.CHM13.mapqMerged$size), 
                       sum(PacBio.HG19_noAlt.darkMerged$size), sum(PacBio.HG19_noAlt.depthMerged$size), sum(PacBio.HG19_noAlt.mapqMerged$size), 
                       sum(PacBio.HG38_noAlt.darkMerged$size), sum(PacBio.HG38_noAlt.depthMerged$size), sum(PacBio.HG38_noAlt.mapqMerged$size), 
                       sum(PacBio.HG38_alt.darkMerged$size), sum(PacBio.HG38_alt.depthMerged$size), sum(PacBio.HG38_alt.mapqMerged$size), 
                       sum(Illumina250.CHM13.darkMerged$size), sum(Illumina250.CHM13.depthMerged$size), sum(Illumina250.CHM13.mapqMerged$size), 
                       sum(Illumina250.HG38_noAlt.darkMerged$size), sum(Illumina250.HG38_noAlt.depthMerged$size), sum(Illumina250.HG38_noAlt.mapqMerged$size), 
                       sum(Illumina250.HG38_Alt.darkMerged$size), sum(Illumina250.HG38_Alt.depthMerged$size), sum(Illumina250.HG38_Alt.mapqMerged$size), 
                       sum(Illumina250.HG19_noAlt.darkMerged$size), sum(Illumina250.HG19_noAlt.depthMerged$size), sum(Illumina250.HG19_noAlt.mapqMerged$size), 
                       sum(Illumina100.HG19_noAlt.darkMerged$size), sum(Illumina100.HG19_noAlt.depthMerged$size), sum(Illumina100.HG19_noAlt.mapqMerged$size), 
                       sum(Illumina100.HG38_noAlt.darkMerged$size), sum(Illumina100.HG38_noAlt.depthMerged$size), sum(Illumina100.HG38_noAlt.mapqMerged$size), 
                       sum(Illumina100.CHM13.darkMerged$size), sum(Illumina100.CHM13.depthMerged$size), sum(Illumina100.CHM13.mapqMerged$size), 
                       sum(Illumina100.HG38_Alt.darkMerged$size), sum(Illumina100.HG38_Alt.depthMerged$size), sum(Illumina100.HG38_Alt.mapqMerged$size)), 
  "Region_count"=c(length(ONT.CHM13.darkMerged$size), length(ONT.CHM13.depthMerged$size), length(ONT.CHM13.mapqMerged$size), 
                   length(ONT.HG38_noAlt.darkMerged$size), length(ONT.HG38_noAlt.depthMerged$size), length(ONT.HG38_noAlt.mapqMerged$size),
                   length(ONT.HG19_noAlt.darkMerged$size), length(ONT.HG19_noAlt.depthMerged$size), length(ONT.HG19_noAlt.mapqMerged$size),
                   length(ONT.HG38_Alt.darkMerged$size), length(ONT.HG38_Alt.depthMerged$size), length(ONT.HG38_Alt.mapqMerged$size), 
                   length(PacBio.CHM13.darkMerged$size), length(PacBio.CHM13.depthMerged$size), length(PacBio.CHM13.mapqMerged$size), 
                   length(PacBio.HG19_noAlt.darkMerged$size), length(PacBio.HG19_noAlt.depthMerged$size), length(PacBio.HG19_noAlt.mapqMerged$size), 
                   length(PacBio.HG38_noAlt.darkMerged$size), length(PacBio.HG38_noAlt.depthMerged$size), length(PacBio.HG38_noAlt.mapqMerged$size), 
                   length(PacBio.HG38_alt.darkMerged$size), length(PacBio.HG38_alt.depthMerged$size), length(PacBio.HG38_alt.mapqMerged$size), 
                   length(Illumina250.CHM13.darkMerged$size), length(Illumina250.CHM13.depthMerged$size), length(Illumina250.CHM13.mapqMerged$size), 
                   length(Illumina250.HG38_noAlt.darkMerged$size), length(Illumina250.HG38_noAlt.depthMerged$size), length(Illumina250.HG38_noAlt.mapqMerged$size), 
                   length(Illumina250.HG38_Alt.darkMerged$size), length(Illumina250.HG38_Alt.depthMerged$size), length(Illumina250.HG38_Alt.mapqMerged$size), 
                   length(Illumina250.HG19_noAlt.darkMerged$size), length(Illumina250.HG19_noAlt.depthMerged$size), length(Illumina250.HG19_noAlt.mapqMerged$size), 
                   length(Illumina100.HG19_noAlt.darkMerged$size), length(Illumina100.HG19_noAlt.depthMerged$size), length(Illumina100.HG19_noAlt.mapqMerged$size) , 
                   length(Illumina100.HG38_noAlt.darkMerged$size), length(Illumina100.HG38_noAlt.depthMerged$size), length(Illumina100.HG38_noAlt.mapqMerged$size), 
                   length(Illumina100.CHM13.darkMerged$size), length(Illumina100.CHM13.depthMerged$size), length(Illumina100.CHM13.mapqMerged$size), 
                   length(Illumina100.HG38_Alt.darkMerged$size), length(Illumina100.HG38_Alt.depthMerged$size), length(Illumina100.HG38_Alt.mapqMerged$size)), 
  "Mean_Nucleotide_per_Region"=c(mean(ONT.CHM13.darkMerged$size), mean(ONT.CHM13.depthMerged$size), mean(ONT.CHM13.mapqMerged$size), 
                                 mean(ONT.HG38_noAlt.darkMerged$size), mean(ONT.HG38_noAlt.depthMerged$size), mean(ONT.HG38_noAlt.mapqMerged$size), 
                                 mean(ONT.HG19_noAlt.darkMerged$size), mean(ONT.HG19_noAlt.depthMerged$size), mean(ONT.HG19_noAlt.mapqMerged$size), 
                                 mean(ONT.HG38_Alt.darkMerged$size), mean(ONT.HG38_Alt.depthMerged$size), mean(ONT.HG38_Alt.mapqMerged$size), 
                                 mean(PacBio.CHM13.darkMerged$size), mean(PacBio.CHM13.depthMerged$size), mean(PacBio.CHM13.mapqMerged$size), 
                                 mean(PacBio.HG19_noAlt.darkMerged$size), mean(PacBio.HG19_noAlt.depthMerged$size), mean(PacBio.HG19_noAlt.mapqMerged$size), 
                                 mean(PacBio.HG38_noAlt.darkMerged$size), mean(PacBio.HG38_noAlt.depthMerged$size), mean(PacBio.HG38_noAlt.mapqMerged$size), 
                                 mean(PacBio.HG38_alt.darkMerged$size), mean(PacBio.HG38_alt.depthMerged$size), mean(PacBio.HG38_alt.mapqMerged$size), 
                                 mean(Illumina250.CHM13.darkMerged$size), mean(Illumina250.CHM13.depthMerged$size), mean(Illumina250.CHM13.mapqMerged$size), 
                                 mean(Illumina250.HG38_noAlt.darkMerged$size), mean(Illumina250.HG38_noAlt.depthMerged$size), mean(Illumina250.HG38_noAlt.mapqMerged$size), 
                                 mean(Illumina250.HG38_Alt.darkMerged$size), mean(Illumina250.HG38_noAlt.depthMerged$size), mean(Illumina250.HG38_Alt.mapqMerged$size), 
                                 mean(Illumina250.HG19_noAlt.darkMerged$size), mean(Illumina250.HG19_noAlt.depthMerged$size), mean(Illumina250.HG19_noAlt.mapqMerged$size), 
                                 mean(Illumina100.HG19_noAlt.darkMerged$size), mean(Illumina100.HG19_noAlt.depthMerged$size), mean(Illumina100.HG19_noAlt.mapqMerged$size), 
                                 mean(Illumina100.HG38_noAlt.darkMerged$size), mean(Illumina100.HG38_noAlt.depthMerged$size), mean(Illumina100.HG38_noAlt.mapqMerged$size), 
                                 mean(Illumina100.CHM13.darkMerged$size), mean(Illumina100.CHM13.depthMerged$size), mean(Illumina100.CHM13.mapqMerged$size), 
                                 mean(Illumina100.HG38_Alt.darkMerged$size), mean(Illumina100.HG38_Alt.depthMerged$size), mean(Illumina100.HG38_Alt.mapqMerged$size)), 
  "Median_Nucleotide_per_Region"=c(median(ONT.CHM13.darkMerged$size), median(ONT.CHM13.depthMerged$size), median(ONT.CHM13.mapqMerged$size), 
                                   median(ONT.HG38_noAlt.darkMerged$size), median(ONT.HG38_noAlt.depthMerged$size), median(ONT.HG38_noAlt.mapqMerged$size), 
                                   median(ONT.HG19_noAlt.darkMerged$size), median(ONT.HG19_noAlt.depthMerged$size), median(ONT.HG19_noAlt.mapqMerged$size), 
                                   median(ONT.HG38_Alt.darkMerged$size), median(ONT.HG38_Alt.depthMerged$size), median(ONT.HG38_Alt.mapqMerged$size), 
                                   median(PacBio.CHM13.darkMerged$size), median(PacBio.CHM13.depthMerged$size), median(PacBio.CHM13.mapqMerged$size), 
                                   median(PacBio.HG19_noAlt.darkMerged$size), median(PacBio.HG19_noAlt.depthMerged$size), median(PacBio.HG19_noAlt.mapqMerged$size), 
                                   median(PacBio.HG38_noAlt.darkMerged$size), median(PacBio.HG38_noAlt.depthMerged$size), median(PacBio.HG38_noAlt.mapqMerged$size), 
                                   median(PacBio.HG38_alt.darkMerged$size), median(PacBio.HG38_alt.depthMerged$size), median(PacBio.HG38_alt.mapqMerged$size), 
                                   median(Illumina250.CHM13.darkMerged$size), median(Illumina250.CHM13.depthMerged$size), median(Illumina250.CHM13.mapqMerged$size),  
                                   median(Illumina250.HG38_noAlt.darkMerged$size), median(Illumina250.HG38_noAlt.depthMerged$size), median(Illumina250.HG38_noAlt.mapqMerged$size),  
                                   median(Illumina250.HG38_Alt.darkMerged$size), median(Illumina250.HG38_Alt.depthMerged$size), median(Illumina250.HG38_Alt.mapqMerged$size),  
                                   median(Illumina250.HG19_noAlt.darkMerged$size), median(Illumina250.HG19_noAlt.depthMerged$size), median(Illumina250.HG19_noAlt.mapqMerged$size),  
                                   median(Illumina100.HG19_noAlt.darkMerged$size), median(Illumina100.HG19_noAlt.depthMerged$size), median(Illumina100.HG19_noAlt.mapqMerged$size), 
                                   median(Illumina100.HG38_noAlt.darkMerged$size), median(Illumina100.HG38_noAlt.depthMerged$size), median(Illumina100.HG38_noAlt.mapqMerged$size),  
                                   median(Illumina100.CHM13.darkMerged$size), median(Illumina100.CHM13.depthMerged$size), median(Illumina100.CHM13.mapqMerged$size),  
                                   median(Illumina100.HG38_Alt.darkMerged$size), median(Illumina100.HG38_Alt.depthMerged$size), median(Illumina100.HG38_Alt.mapqMerged$size))
)

biotype=rbind(data.table("biotype"=dark.ONT.CHM13.biotype[,1, drop=T], "AllDark"=dark.ONT.CHM13.biotype[,2, drop=T], "Dark_by_Depth"=depth.ONT.CHM13.biotype[,2, drop=T], "Dark_by_MapQ"=mapq.ONT.CHM13.biotype[,2, drop=T], "Camo"=camo.ONT.CHM13.biotype[,2, drop=T], "Platform"=rep("ONT", 8), "Reference"=rep("CHM13", 8)), 
              data.table("biotype"=dark.ONT.HG38_noAlt.biotype[,1, drop=T], "AllDark"=dark.ONT.HG38_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG38_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG38_noAlt.biotype[,2, drop=T], "Camo"= camo.ONT.HG38_noAlt.biotype[,2, drop=T], "Platform"=rep("ONT", 8), "Reference"= rep("HG38_noAlt", 8)),
              data.table("biotype"=dark.ONT.HG19_noAlt.biotype[,1, drop=T], "AllDark"=dark.ONT.HG19_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG19_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG19_noAlt.biotype[,2, drop=T], "Camo"= camo.ONT.HG19_noAlt.biotype[,2, drop=T], "Platform"=rep("ONT", 8), "Reference"= rep("HG19_noAlt", 8)),
              data.table("biotype"=dark.ONT.HG38_Alt.biotype[,1, drop=T], "AllDark"=dark.ONT.HG38_Alt.biotype[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG38_Alt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG38_Alt.biotype[,2, drop=T], "Camo"= camo.ONT.HG38_Alt.biotype[,2, drop=T], "Platform"=rep("ONT", 8), "Reference"= rep("HG38_alt", 8)),
              data.table("biotype"=dark.pacbio.CHM13.biotype[,1, drop=T], "AllDark"=dark.pacbio.CHM13.biotype[,2, drop=T], "Dark_by_Depth"=depth.pacbio.CHM13.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.CHM13.biotype[,2, drop=T], "Camo"= camo.pacbio.CHM13.biotype[,2, drop=T], "Platform"=rep("PacBio", 8), "Reference"= rep("CHM13", 8)),
              data.table("biotype"=dark.pacbio.HG19_noAlt.biotype[,1, drop=T], "AllDark"=dark.pacbio.HG19_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG19_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG19_noAlt.biotype[,2, drop=T], "Camo"= camo.pacbio.HG19_noAlt.biotype[,2, drop=T], "Platform"=rep("PacBio", 8), "Reference"= rep("HG19_noAlt", 8)),
              data.table("biotype"=dark.pacbio.HG38_noAlt.biotype[,1, drop=T], "AllDark"=dark.pacbio.HG38_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG38_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG38_noAlt.biotype[,2, drop=T], "Camo"= camo.pacbio.HG38_noAlt.biotype[,2, drop=T], "Platform"=rep("PacBio", 8), "Reference"= rep("HG38_noAlt", 8)),
              data.table("biotype"=dark.pacbio.HG38_alt.biotype[,1, drop=T], "AllDark"=dark.pacbio.HG38_alt.biotype[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG38_alt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG38_alt.biotype[,2, drop=T], "Camo"= camo.pacbio.HG38_alt.biotype[,2, drop=T], "Platform"=rep("PacBio", 8), "Reference"= rep("HG38_alt", 8)),
              data.table("biotype"=dark.Illumina250.CHM13.biotype[,1, drop=T], "AllDark"=dark.Illumina250.CHM13.biotype[,2, drop=T], "Dark_by_Depth"=depth.Illumina250.CHM13.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina250.CHM13.biotype[,2, drop=T], "Camo"= camo.Illumina250.CHM13.biotype[,2, drop=T], "Platform"=rep("Illumina250RL", 8), "Reference"= rep("CHM13", 8)),
              data.table("biotype"=dark.Illumina250.HG38_noAlt.biotype[,1, drop=T], "AllDark"=dark.Illumina250.HG38_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.Illumina250.HG38_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina250.HG38_noAlt.biotype[,2, drop=T], "Camo"= camo.Illumina250.HG38_noAlt.biotype[,2, drop=T], "Platform"=rep("Illumina250RL", 8), "Reference"= rep("HG38_noAlt", 8)),
              data.table("biotype"=dark.Illumina250.HG38_Alt.biotype[,1, drop=T], "AllDark"=dark.Illumina250.HG38_Alt.biotype[,2, drop=T], "Dark_by_Depth"=depth.Illumina250.HG38_Alt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina250.HG38_Alt.biotype[,2, drop=T], "Camo"= camo.Illumina250.HG38_Alt.biotype[,2, drop=T], "Platform"=rep("Illumina250RL", 8), "Reference"= rep("HG38_alt", 8)),
              data.table("biotype"=dark.Illumina250.HG19_noAlt.biotype[,1, drop=T], "AllDark"=dark.Illumina250.HG19_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.Illumina250.HG19_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina250.HG19_noAlt.biotype[,2, drop=T], "Camo"= camo.Illumina250.HG19_noAlt.biotype[,2, drop=T], "Platform"=rep("Illumina250RL", 8), "Reference"= rep("HG19_noAlt", 8)),
              data.table("biotype"=dark.Illumina100.HG19_noAlt.biotype[,1, drop=T], "AllDark"=dark.Illumina100.HG19_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.HG19_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.HG19_noAlt.biotype[,2, drop=T], "Camo"= camo.Illumina100.HG19_noAlt.biotype[,2, drop=T], "Platform"=rep("Illumina100RL", 8), "Reference"= rep("HG19_noAlt", 8)),
              data.table("biotype"=dark.Illumina100.HG38_noAlt.biotype[,1, drop=T], "AllDark"=dark.Illumina100.HG38_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.HG38_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.HG38_noAlt.biotype[,2, drop=T], "Camo"= camo.Illumina100.HG38_noAlt.biotype[,2, drop=T], "Platform"=rep("Illumina100RL", 8), "Reference"= rep("HG38_noAlt", 8)),
              data.table("biotype"=dark.Illumina100.HG38_Alt.biotype[,1, drop=T], "AllDark"=dark.Illumina100.HG38_Alt.biotype[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.HG38_Alt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.HG38_Alt.biotype[,2, drop=T], "Camo"= camo.Illumina100.HG38_Alt.biotype[,2, drop=T], "Platform"=rep("Illumina100RL", 8), "Reference"= rep("HG38_alt", 8)),
              data.table("biotype"=dark.Illumina100.CHM13.biotype[,1, drop=T], "AllDark"=dark.Illumina100.CHM13.biotype[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.CHM13.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.CHM13.biotype[,2, drop=T], "Camo"= camo.Illumina100.CHM13.biotype[,2, drop=T], "Platform"=rep("Illumina100RL", 8), "Reference"= rep("CHM13", 8))
        )

colnames(biotype) = c("biotype", "AllDark", "Dark_by_Depth", "Dark_by_MapQ", "Camo", "Platform", "Reference")

NewLongRead_nucsAndRegions = data.table(
  "Region_type"=c(rep(c("All_Dark","Low_Depth", "Low_Mapq"), 16)), 
  "Platform"=c(rep("ONT", 3), rep("ONT", 3), rep("ONT", 3), rep("ONT", 3), rep("Illumina100", 3), rep("Illumina100", 3), rep("Illumina100", 3), rep("Illumina100", 3), rep("Illumina250", 3), rep("Illumina250", 3), rep("Illumina250", 3), rep("Illumina250", 3), rep("PacBio", 3), rep("PacBio", 3), rep("PacBio", 3), rep("PacBio", 3)),
  "Reference"=c(rep("CHM13", 3), rep("HG38_noAlt", 3), rep("HG19_noAlt", 3), rep("HG38_alt", 3), rep("CHM13", 3), rep("HG19_noAlt", 3), rep("HG38_noAlt", 3), rep("HG38_alt", 3), rep("CHM13", 3), rep("HG19_noAlt", 3), rep("HG38_noAlt", 3), rep("HG38_alt", 3), rep("CHM13", 3), rep("HG19_noAlt", 3), rep("HG38_noAlt", 3), rep("HG38_alt", 3)),
  "Nucleotide_count"=c(sum(ONT.new.CHM13.darkMerged$size), sum(ONT.new.CHM13.depthMerged$size), sum(ONT.new.CHM13.mapqMerged$size), 
                       sum(ONT.new.HG38_noAlt.darkMerged$size), sum(ONT.new.HG38_noAlt.depthMerged$size), sum(ONT.new.HG38_noAlt.mapqMerged$size),
                       sum(ONT.new.HG19_noAlt.darkMerged$size), sum(ONT.new.HG19_noAlt.depthMerged$size), sum(ONT.new.HG19_noAlt.mapqMerged$size),
                       sum(ONT.new.HG38_Alt.darkMerged$size), sum(ONT.new.HG38_Alt.depthMerged$size), sum(ONT.new.HG38_Alt.mapqMerged$size), 
                       sum(Illumina100.new.CHM13.darkMerged$size), sum(Illumina100.new.CHM13.depthMerged$size), sum(Illumina100.new.CHM13.mapqMerged$size), 
                       sum(Illumina100.new.HG38_noAlt.darkMerged$size), sum(Illumina100.new.HG38_noAlt.depthMerged$size), sum(Illumina100.new.HG38_noAlt.mapqMerged$size),
                       sum(Illumina100.new.HG19_noAlt.darkMerged$size), sum(Illumina100.new.HG19_noAlt.depthMerged$size), sum(Illumina100.new.HG19_noAlt.mapqMerged$size),
                       sum(Illumina100.new.HG38_Alt.darkMerged$size), sum(Illumina100.new.HG38_Alt.depthMerged$size), sum(Illumina100.new.HG38_Alt.mapqMerged$size), 
                       sum(Illumina250.new.CHM13.darkMerged$size), sum(Illumina250.new.CHM13.depthMerged$size), sum(Illumina250.new.CHM13.mapqMerged$size), 
                       sum(Illumina250.new.HG38_noAlt.darkMerged$size), sum(Illumina250.new.HG38_noAlt.depthMerged$size), sum(Illumina250.new.HG38_noAlt.mapqMerged$size),
                       sum(Illumina250.new.HG19_noAlt.darkMerged$size), sum(Illumina250.new.HG19_noAlt.depthMerged$size), sum(Illumina250.new.HG19_noAlt.mapqMerged$size),
                       sum(Illumina250.new.HG38_Alt.darkMerged$size), sum(Illumina250.new.HG38_Alt.depthMerged$size), sum(Illumina250.new.HG38_Alt.mapqMerged$size), 
                       sum(PacBio.new.CHM13.darkMerged$size), sum(PacBio.new.CHM13.depthMerged$size), sum(PacBio.new.CHM13.mapqMerged$size), 
                       sum(PacBio.new.HG19_noAlt.darkMerged$size), sum(PacBio.new.HG19_noAlt.depthMerged$size), sum(PacBio.new.HG19_noAlt.mapqMerged$size), 
                       sum(PacBio.new.HG38_noAlt.darkMerged$size), sum(PacBio.new.HG38_noAlt.depthMerged$size), sum(PacBio.new.HG38_noAlt.mapqMerged$size), 
                       sum(PacBio.new.HG38_alt.darkMerged$size), sum(PacBio.new.HG38_alt.depthMerged$size), sum(PacBio.new.HG38_alt.mapqMerged$size)), 
  "Region_count"=c(length(ONT.new.CHM13.darkMerged$size), length(ONT.new.CHM13.depthMerged$size), length(ONT.new.CHM13.mapqMerged$size), 
                   length(ONT.new.HG38_noAlt.darkMerged$size), length(ONT.new.HG38_noAlt.depthMerged$size), length(ONT.new.HG38_noAlt.mapqMerged$size),
                   length(ONT.new.HG19_noAlt.darkMerged$size), length(ONT.new.HG19_noAlt.depthMerged$size), length(ONT.new.HG19_noAlt.mapqMerged$size),
                   length(ONT.new.HG38_Alt.darkMerged$size), length(ONT.new.HG38_Alt.depthMerged$size), length(ONT.new.HG38_Alt.mapqMerged$size), 
                   length(Illumina100.new.CHM13.darkMerged$size), length(Illumina100.new.CHM13.depthMerged$size), length(Illumina100.new.CHM13.mapqMerged$size), 
                   length(Illumina100.new.HG38_noAlt.darkMerged$size), length(Illumina100.new.HG38_noAlt.depthMerged$size), length(Illumina100.new.HG38_noAlt.mapqMerged$size),
                   length(Illumina100.new.HG19_noAlt.darkMerged$size), length(Illumina100.new.HG19_noAlt.depthMerged$size), length(Illumina100.new.HG19_noAlt.mapqMerged$size),
                   length(Illumina100.new.HG38_Alt.darkMerged$size), length(Illumina100.new.HG38_Alt.depthMerged$size), length(Illumina100.new.HG38_Alt.mapqMerged$size),
                   length(Illumina250.new.CHM13.darkMerged$size), length(Illumina250.new.CHM13.depthMerged$size), length(Illumina250.new.CHM13.mapqMerged$size), 
                   length(Illumina250.new.HG38_noAlt.darkMerged$size), length(Illumina250.new.HG38_noAlt.depthMerged$size), length(Illumina250.new.HG38_noAlt.mapqMerged$size),
                   length(Illumina250.new.HG19_noAlt.darkMerged$size), length(Illumina250.new.HG19_noAlt.depthMerged$size), length(Illumina250.new.HG19_noAlt.mapqMerged$size),
                   length(Illumina250.new.HG38_Alt.darkMerged$size), length(Illumina250.new.HG38_Alt.depthMerged$size), length(Illumina250.new.HG38_Alt.mapqMerged$size),
                   length(PacBio.new.CHM13.darkMerged$size), length(PacBio.new.CHM13.depthMerged$size), length(PacBio.new.CHM13.mapqMerged$size), 
                   length(PacBio.new.HG19_noAlt.darkMerged$size), length(PacBio.new.HG19_noAlt.depthMerged$size), length(PacBio.new.HG19_noAlt.mapqMerged$size), 
                   length(PacBio.new.HG38_noAlt.darkMerged$size), length(PacBio.new.HG38_noAlt.depthMerged$size), length(PacBio.new.HG38_noAlt.mapqMerged$size), 
                   length(PacBio.new.HG38_alt.darkMerged$size), length(PacBio.new.HG38_alt.depthMerged$size), length(PacBio.new.HG38_alt.mapqMerged$size)), 
  "Mean_Nucleotide_per_Region"=c(mean(ONT.new.CHM13.darkMerged$size), mean(ONT.new.CHM13.depthMerged$size), mean(ONT.new.CHM13.mapqMerged$size), 
                                 mean(ONT.new.HG38_noAlt.darkMerged$size), mean(ONT.new.HG38_noAlt.depthMerged$size), mean(ONT.new.HG38_noAlt.mapqMerged$size), 
                                 mean(ONT.new.HG19_noAlt.darkMerged$size), mean(ONT.new.HG19_noAlt.depthMerged$size), mean(ONT.new.HG19_noAlt.mapqMerged$size), 
                                 mean(ONT.new.HG38_Alt.darkMerged$size), mean(ONT.new.HG38_Alt.depthMerged$size), mean(ONT.new.HG38_Alt.mapqMerged$size), 
                                 mean(Illumina100.new.CHM13.darkMerged$size), mean(Illumina100.new.CHM13.depthMerged$size), mean(Illumina100.new.CHM13.mapqMerged$size), 
                                 mean(Illumina100.new.HG38_noAlt.darkMerged$size), mean(Illumina100.new.HG38_noAlt.depthMerged$size), mean(Illumina100.new.HG38_noAlt.mapqMerged$size), 
                                 mean(Illumina100.new.HG19_noAlt.darkMerged$size), mean(Illumina100.new.HG19_noAlt.depthMerged$size), mean(Illumina100.new.HG19_noAlt.mapqMerged$size), 
                                 mean(Illumina100.new.HG38_Alt.darkMerged$size), mean(Illumina100.new.HG38_Alt.depthMerged$size), mean(Illumina100.new.HG38_Alt.mapqMerged$size), 
                                 mean(Illumina250.new.CHM13.darkMerged$size), mean(Illumina250.new.CHM13.depthMerged$size), mean(Illumina250.new.CHM13.mapqMerged$size), 
                                 mean(Illumina250.new.HG38_noAlt.darkMerged$size), mean(Illumina250.new.HG38_noAlt.depthMerged$size), mean(Illumina250.new.HG38_noAlt.mapqMerged$size), 
                                 mean(Illumina250.new.HG19_noAlt.darkMerged$size), mean(Illumina250.new.HG19_noAlt.depthMerged$size), mean(Illumina250.new.HG19_noAlt.mapqMerged$size), 
                                 mean(Illumina250.new.HG38_Alt.darkMerged$size), mean(Illumina250.new.HG38_Alt.depthMerged$size), mean(Illumina250.new.HG38_Alt.mapqMerged$size), 
                                 mean(PacBio.new.CHM13.darkMerged$size), mean(PacBio.new.CHM13.depthMerged$size), mean(PacBio.new.CHM13.mapqMerged$size), 
                                 mean(PacBio.new.HG19_noAlt.darkMerged$size), mean(PacBio.new.HG19_noAlt.depthMerged$size), mean(PacBio.new.HG19_noAlt.mapqMerged$size), 
                                 mean(PacBio.new.HG38_noAlt.darkMerged$size), mean(PacBio.new.HG38_noAlt.depthMerged$size), mean(PacBio.new.HG38_noAlt.mapqMerged$size), 
                                 mean(PacBio.new.HG38_alt.darkMerged$size), mean(PacBio.new.HG38_alt.depthMerged$size), mean(PacBio.new.HG38_alt.mapqMerged$size)), 
  "Median_Nucleotide_per_Region"=c(median(ONT.new.CHM13.darkMerged$size), median(ONT.new.CHM13.depthMerged$size), median(ONT.new.CHM13.mapqMerged$size), 
                                   median(ONT.new.HG38_noAlt.darkMerged$size), median(ONT.new.HG38_noAlt.depthMerged$size), median(ONT.new.HG38_noAlt.mapqMerged$size), 
                                   median(ONT.new.HG19_noAlt.darkMerged$size), median(ONT.new.HG19_noAlt.depthMerged$size), median(ONT.new.HG19_noAlt.mapqMerged$size), 
                                   median(ONT.new.HG38_Alt.darkMerged$size), median(ONT.new.HG38_Alt.depthMerged$size), median(ONT.new.HG38_Alt.mapqMerged$size),
                                   median(Illumina100.new.CHM13.darkMerged$size), median(Illumina100.new.CHM13.depthMerged$size), median(Illumina100.new.CHM13.mapqMerged$size), 
                                   median(Illumina100.new.HG38_noAlt.darkMerged$size), median(Illumina100.new.HG38_noAlt.depthMerged$size), median(Illumina100.new.HG38_noAlt.mapqMerged$size), 
                                   median(Illumina100.new.HG19_noAlt.darkMerged$size), median(Illumina100.new.HG19_noAlt.depthMerged$size), median(Illumina100.new.HG19_noAlt.mapqMerged$size), 
                                   median(Illumina100.new.HG38_Alt.darkMerged$size), median(Illumina100.new.HG38_Alt.depthMerged$size), median(Illumina100.new.HG38_Alt.mapqMerged$size),
                                   median(Illumina250.new.CHM13.darkMerged$size), median(Illumina250.new.CHM13.depthMerged$size), median(Illumina250.new.CHM13.mapqMerged$size), 
                                   median(Illumina250.new.HG38_noAlt.darkMerged$size), median(Illumina250.new.HG38_noAlt.depthMerged$size), median(Illumina250.new.HG38_noAlt.mapqMerged$size), 
                                   median(Illumina250.new.HG19_noAlt.darkMerged$size), median(Illumina250.new.HG19_noAlt.depthMerged$size), median(Illumina250.new.HG19_noAlt.mapqMerged$size), 
                                   median(Illumina250.new.HG38_Alt.darkMerged$size), median(Illumina250.new.HG38_Alt.depthMerged$size), median(Illumina250.new.HG38_Alt.mapqMerged$size),
                                   median(PacBio.new.CHM13.darkMerged$size), median(PacBio.new.CHM13.depthMerged$size), median(PacBio.new.CHM13.mapqMerged$size), 
                                   median(PacBio.new.HG19_noAlt.darkMerged$size), median(PacBio.new.HG19_noAlt.depthMerged$size), median(PacBio.new.HG19_noAlt.mapqMerged$size), 
                                   median(PacBio.new.HG38_noAlt.darkMerged$size), median(PacBio.new.HG38_noAlt.depthMerged$size), median(PacBio.new.HG38_noAlt.mapqMerged$size), 
                                   median(PacBio.new.HG38_alt.darkMerged$size), median(PacBio.new.HG38_alt.depthMerged$size), median(PacBio.new.HG38_alt.mapqMerged$size)) 
)

NewLongRead_biotype=rbind(data.table("biotype"=dark.ONT.new.CHM13.biotype[,1, drop=T], "AllDark"=dark.ONT.new.CHM13.biotype[,2, drop=T], "Dark_by_Depth"=depth.ONT.new.CHM13.biotype[,2, drop=T], "Dark_by_MapQ"=mapq.ONT.new.CHM13.biotype[,2, drop=T], "Camo"=camo.ONT.new.CHM13.biotype[,2, drop=T], "Platform"=rep("ONT", 8), "Reference"=rep("CHM13", 8)), 
              data.table("biotype"=dark.ONT.new.HG38_noAlt.biotype[,1, drop=T], "AllDark"=dark.ONT.new.HG38_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.ONT.new.HG38_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.new.HG38_noAlt.biotype[,2, drop=T], "Camo"= camo.ONT.new.HG38_noAlt.biotype[,2, drop=T], "Platform"=rep("ONT", 8), "Reference"= rep("HG38_noAlt", 8)),
              data.table("biotype"=dark.ONT.new.HG19_noAlt.biotype[,1, drop=T], "AllDark"=dark.ONT.new.HG19_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.ONT.new.HG19_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.new.HG19_noAlt.biotype[,2, drop=T], "Camo"= camo.ONT.new.HG19_noAlt.biotype[,2, drop=T], "Platform"=rep("ONT", 8), "Reference"= rep("HG19_noAlt", 8)),
              data.table("biotype"=dark.ONT.new.HG38_Alt.biotype[,1, drop=T], "AllDark"=dark.ONT.new.HG38_Alt.biotype[,2, drop=T], "Dark_by_Depth"=depth.ONT.new.HG38_Alt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.new.HG38_Alt.biotype[,2, drop=T], "Camo"= camo.ONT.new.HG38_Alt.biotype[,2, drop=T], "Platform"=rep("ONT", 8), "Reference"= rep("HG38_alt", 8)),
              data.table("biotype"=dark.pacbio.new.CHM13.biotype[,1, drop=T], "AllDark"=dark.pacbio.new.CHM13.biotype[,2, drop=T], "Dark_by_Depth"=depth.pacbio.new.CHM13.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.new.CHM13.biotype[,2, drop=T], "Camo"= camo.pacbio.new.CHM13.biotype[,2, drop=T], "Platform"=rep("PacBio", 8), "Reference"= rep("CHM13", 8)),
              data.table("biotype"=dark.pacbio.new.HG19_noAlt.biotype[,1, drop=T], "AllDark"=dark.pacbio.new.HG19_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.pacbio.new.HG19_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.new.HG19_noAlt.biotype[,2, drop=T], "Camo"= camo.pacbio.new.HG19_noAlt.biotype[,2, drop=T], "Platform"=rep("PacBio", 8), "Reference"= rep("HG19_noAlt", 8)),
              data.table("biotype"=dark.pacbio.new.HG38_noAlt.biotype[,1, drop=T], "AllDark"=dark.pacbio.new.HG38_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.pacbio.new.HG38_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.new.HG38_noAlt.biotype[,2, drop=T], "Camo"= camo.pacbio.new.HG38_noAlt.biotype[,2, drop=T], "Platform"=rep("PacBio", 8), "Reference"= rep("HG38_noAlt", 8)),
              data.table("biotype"=dark.pacbio.new.HG38_alt.biotype[,1, drop=T], "AllDark"=dark.pacbio.new.HG38_alt.biotype[,2, drop=T], "Dark_by_Depth"=depth.pacbio.new.HG38_alt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.new.HG38_alt.biotype[,2, drop=T], "Camo"= camo.pacbio.new.HG38_alt.biotype[,2, drop=T], "Platform"=rep("PacBio", 8), "Reference"= rep("HG38_alt", 8)),
              data.table("biotype"=dark.new.Illumina100.HG19_noAlt.biotype[,1, drop=T], "AllDark"=dark.new.Illumina100.HG19_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina100.HG19_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina100.HG19_noAlt.biotype[,2, drop=T], "Camo"= camo.new.Illumina100.HG19_noAlt.biotype[,2, drop=T], "Platform"=rep("Illumina100RL", 8), "Reference"= rep("HG19_noAlt", 8)),
              data.table("biotype"=dark.new.Illumina100.HG38_noAlt.biotype[,1, drop=T], "AllDark"=dark.new.Illumina100.HG38_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina100.HG38_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina100.HG38_noAlt.biotype[,2, drop=T], "Camo"= camo.new.Illumina100.HG38_noAlt.biotype[,2, drop=T], "Platform"=rep("Illumina100RL", 8), "Reference"= rep("HG38_noAlt", 8)),
              data.table("biotype"=dark.new.Illumina100.HG38_Alt.biotype[,1, drop=T], "AllDark"=dark.new.Illumina100.HG38_Alt.biotype[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina100.HG38_Alt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina100.HG38_Alt.biotype[,2, drop=T], "Camo"= camo.new.Illumina100.HG38_Alt.biotype[,2, drop=T], "Platform"=rep("Illumina100RL", 8), "Reference"= rep("HG38_alt", 8)),
              data.table("biotype"=dark.new.Illumina100.CHM13.biotype[,1, drop=T], "AllDark"=dark.new.Illumina100.CHM13.biotype[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina100.CHM13.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina100.CHM13.biotype[,2, drop=T], "Camo"= camo.new.Illumina100.CHM13.biotype[,2, drop=T], "Platform"=rep("Illumina100RL", 8), "Reference"= rep("CHM13", 8)),
              data.table("biotype"=dark.new.Illumina250.HG19_noAlt.biotype[,1, drop=T], "AllDark"=dark.new.Illumina250.HG19_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina250.HG19_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina250.HG19_noAlt.biotype[,2, drop=T], "Camo"= camo.new.Illumina250.HG19_noAlt.biotype[,2, drop=T], "Platform"=rep("Illumina250RL", 8), "Reference"= rep("HG19_noAlt", 8)),
              data.table("biotype"=dark.new.Illumina250.HG38_noAlt.biotype[,1, drop=T], "AllDark"=dark.new.Illumina250.HG38_noAlt.biotype[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina250.HG38_noAlt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina250.HG38_noAlt.biotype[,2, drop=T], "Camo"= camo.new.Illumina250.HG38_noAlt.biotype[,2, drop=T], "Platform"=rep("Illumina250RL", 8), "Reference"= rep("HG38_noAlt", 8)),
              data.table("biotype"=dark.new.Illumina250.HG38_Alt.biotype[,1, drop=T], "AllDark"=dark.new.Illumina250.HG38_Alt.biotype[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina250.HG38_Alt.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina250.HG38_Alt.biotype[,2, drop=T], "Camo"= camo.new.Illumina250.HG38_Alt.biotype[,2, drop=T], "Platform"=rep("Illumina250RL", 8), "Reference"= rep("HG38_alt", 8)),
              data.table("biotype"=dark.new.Illumina250.CHM13.biotype[,1, drop=T], "AllDark"=dark.new.Illumina250.CHM13.biotype[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina250.CHM13.biotype[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina250.CHM13.biotype[,2, drop=T], "Camo"= camo.new.Illumina250.CHM13.biotype[,2, drop=T], "Platform"=rep("Illumina250RL", 8), "Reference"= rep("CHM13", 8))
)

colnames(NewLongRead_biotype) = c("biotype", "AllDark", "Dark_by_Depth", "Dark_by_MapQ", "Camo", "Platform", "Reference")


biotypeClasses = as.list(unique(biotype$biotype))
biotype_option_indicator <- lapply(
  biotypeClasses,
  function(biotypeClasses) {
    list(label = biotypeClasses,
         value = biotypeClasses)
  }
)

# Coding Regions
## Illumina100
### CHM13
dark.Illumina100.CHM13.codingRegions = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.CHM13.codingRegions = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.CHM13.codingRegions = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.CHM13.codingRegions = fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### NEW

dark.Illumina100.new.CHM13.codingRegions = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.new.CHM13.codingRegions = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.new.CHM13.codingRegions = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.new.CHM13.codingRegions = fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG19_noAlt
dark.Illumina100.HG19_noAlt.codingRegions = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.HG19_noAlt.codingRegions = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.HG19_noAlt.codingRegions = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.HG19_noAlt.codingRegions = fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

###NEW

dark.Illumina100.new.HG19_noAlt.codingRegions = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.new.HG19_noAlt.codingRegions = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.new.HG19_noAlt.codingRegions = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.new.HG19_noAlt.codingRegions = fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG38_noAlt
dark.Illumina100.HG38_noAlt.codingRegions = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.HG38_noAlt.codingRegions = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.HG38_noAlt.codingRegions = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.HG38_noAlt.codingRegions = fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

###NEW 

dark.Illumina100.new.HG38_noAlt.codingRegions = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.new.HG38_noAlt.codingRegions = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.new.HG38_noAlt.codingRegions = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.new.HG38_noAlt.codingRegions = fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG38_Alt
dark.Illumina100.HG38_Alt.codingRegions = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.HG38_Alt.codingRegions = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.HG38_Alt.codingRegions = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.HG38_Alt.codingRegions = fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

###NEW

dark.Illumina100.new.HG38_Alt.codingRegions = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina100.new.HG38_Alt.codingRegions = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina100.new.HG38_Alt.codingRegions = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina100.new.HG38_Alt.codingRegions = fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)


## Illumina250
### CHM13
dark.Illumina250.CHM13.codingRegions = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina250.CHM13.codingRegions = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina250.CHM13.codingRegions = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina250.CHM13.codingRegions = fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

## NEW

dark.new.Illumina250.CHM13.codingRegions = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina250.CHM13.codingRegions = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina250.CHM13.codingRegions = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina250.CHM13.codingRegions = fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)


#####################################################################################3
### HG38_noAlt
dark.Illumina250.HG38_noAlt.codingRegions = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina250.HG38_noAlt.codingRegions = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina250.HG38_noAlt.codingRegions = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina250.HG38_noAlt.codingRegions = fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

## NEW

dark.new.Illumina250.HG38_noAlt.codingRegions = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina250.HG38_noAlt.codingRegions = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina250.HG38_noAlt.codingRegions = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina250.HG38_noAlt.codingRegions = fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)


#####################################################################################3
### HG38_Alt
dark.Illumina250.HG38_Alt.codingRegions = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina250.HG38_Alt.codingRegions = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina250.HG38_Alt.codingRegions = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina250.HG38_Alt.codingRegions = fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

## NEW

dark.new.Illumina250.HG38_Alt.codingRegions = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina250.HG38_Alt.codingRegions = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina250.HG38_Alt.codingRegions = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina250.HG38_Alt.codingRegions = fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)


#####################################################################################3
### HG19_noAlt
dark.Illumina250.HG19_noAlt.codingRegions = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.Illumina250.HG19_noAlt.codingRegions = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.Illumina250.HG19_noAlt.codingRegions = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.Illumina250.HG19_noAlt.codingRegions = fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

## NEW

dark.new.Illumina250.HG19_noAlt.codingRegions = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.new.Illumina250.HG19_noAlt.codingRegions = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.new.Illumina250.HG19_noAlt.codingRegions = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.new.Illumina250.HG19_noAlt.codingRegions = fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)


#####################################################################################3
##ONT
###CHM13
dark.ONT.CHM13.codingRegions = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.CHM13.codingRegions = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.CHM13.codingRegions = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.CHM13.codingRegions = fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

dark.ONT.new.CHM13.codingRegions = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.new.CHM13.codingRegions = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.new.CHM13.codingRegions = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.new.CHM13.codingRegions = fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG38_noAlt
dark.ONT.HG38_noAlt.codingRegions = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.HG38_noAlt.codingRegions = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.HG38_noAlt.codingRegions = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.HG38_noAlt.codingRegions = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

dark.ONT.new.HG38_noAlt.codingRegions = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.new.HG38_noAlt.codingRegions = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.new.HG38_noAlt.codingRegions = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.new.HG38_noAlt.codingRegions = fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG38_Alt
dark.ONT.HG38_alt.codingRegions = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.HG38_alt.codingRegions = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.HG38_alt.codingRegions = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.HG38_alt.codingRegions = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

dark.ONT.new.HG38_alt.codingRegions = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.new.HG38_alt.codingRegions = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.new.HG38_alt.codingRegions = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.new.HG38_alt.codingRegions = fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG19_noAlt
dark.ONT.HG19_noAlt.codingRegions = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.HG19_noAlt.codingRegions = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.HG19_noAlt.codingRegions = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.HG19_noAlt.codingRegions = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

dark.ONT.new.HG19_noAlt.codingRegions = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.ONT.new.HG19_noAlt.codingRegions = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.ONT.new.HG19_noAlt.codingRegions = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.ONT.new.HG19_noAlt.codingRegions = fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)


## PacBio
## CHM!3
dark.pacbio.CHM13.codingRegions = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.CHM13.codingRegions = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.CHM13.codingRegions = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.CHM13.codingRegions = fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

dark.pacbio.new.CHM13.codingRegions = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.new.CHM13.codingRegions = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.new.CHM13.codingRegions = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.new.CHM13.codingRegions = fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG19_noAlt
dark.pacbio.HG19_noAlt.codingRegions = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.HG19_noAlt.codingRegions = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.HG19_noAlt.codingRegions = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.HG19_noAlt.codingRegions = fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

dark.pacbio.new.HG19_noAlt.codingRegions = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.new.HG19_noAlt.codingRegions = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.new.HG19_noAlt.codingRegions = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.new.HG19_noAlt.codingRegions = fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG38_noAlt
dark.pacbio.HG38_noAlt.codingRegions = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.HG38_noAlt.codingRegions = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.HG38_noAlt.codingRegions = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.HG38_noAlt.codingRegions = fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

dark.pacbio.new.HG38_noAlt.codingRegions = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.new.HG38_noAlt.codingRegions = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.new.HG38_noAlt.codingRegions = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.new.HG38_noAlt.codingRegions = fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

### HG38_alt
dark.pacbio.HG38_alt.codingRegions = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.HG38_alt.codingRegions = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.HG38_alt.codingRegions = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.HG38_alt.codingRegions = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)

dark.pacbio.new.HG38_alt.codingRegions = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_dark_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
depth.pacbio.new.HG38_alt.codingRegions = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_depth_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
mapq.pacbio.new.HG38_alt.codingRegions = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_mapq_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)
camo.pacbio.new.HG38_alt.codingRegions = fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_camo_coding_regions.txt", sep="\t", stringsAsFactors = F, header=T)


codingRegions=rbind(data.table("CodingRegions"=dark.ONT.CHM13.codingRegions[,1, drop=T], "AllDark"=dark.ONT.CHM13.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.ONT.CHM13.codingRegions[,2, drop=T], "Dark_by_MapQ"=mapq.ONT.CHM13.codingRegions[,2, drop=T], "Camo"=camo.ONT.CHM13.codingRegions[,2, drop=T], "Platform"=rep("ONT", 5), "Reference"=rep("CHM13", 5)), 
                    data.table("CodingRegions"=dark.ONT.HG19_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.ONT.HG19_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG19_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG19_noAlt.codingRegions[,2, drop=T], "Camo"= camo.ONT.HG19_noAlt.codingRegions[,2, drop=T], "Platform"=rep("ONT", 5), "Reference"= rep("HG19_noAlt", 5)),
                    data.table("CodingRegions"=dark.ONT.HG38_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.ONT.HG38_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG38_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG38_noAlt.codingRegions[,2, drop=T], "Camo"= camo.ONT.HG38_noAlt.codingRegions[,2, drop=T], "Platform"=rep("ONT", 5), "Reference"= rep("HG38_noAlt", 5)),
                    data.table("CodingRegions"=dark.ONT.HG38_alt.codingRegions[,1, drop=T], "AllDark"=dark.ONT.HG38_alt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG38_alt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG38_alt.codingRegions[,2, drop=T], "Camo"= camo.ONT.HG38_alt.codingRegions[,2, drop=T], "Platform"=rep("ONT", 5), "Reference"= rep("HG38_alt", 5)),
                    data.table("CodingRegions"=dark.pacbio.CHM13.codingRegions[,1, drop=T], "AllDark"=dark.pacbio.CHM13.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.pacbio.CHM13.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.CHM13.codingRegions[,2, drop=T], "Camo"= camo.pacbio.CHM13.codingRegions[,2, drop=T], "Platform"=rep("PacBio", 5), "Reference"= rep("CHM13", 5)),
                    data.table("CodingRegions"=dark.pacbio.HG19_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.pacbio.HG19_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG19_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG19_noAlt.codingRegions[,2, drop=T], "Camo"= camo.pacbio.HG19_noAlt.codingRegions[,2, drop=T], "Platform"=rep("PacBio", 5), "Reference"= rep("HG19_noAlt", 5)),
                    data.table("CodingRegions"=dark.pacbio.HG38_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.pacbio.HG38_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG38_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG38_noAlt.codingRegions[,2, drop=T], "Camo"= camo.pacbio.HG38_noAlt.codingRegions[,2, drop=T], "Platform"=rep("PacBio", 5), "Reference"= rep("HG38_noAlt", 5)),
                    data.table("CodingRegions"=dark.pacbio.HG38_alt.codingRegions[,1, drop=T], "AllDark"=dark.pacbio.HG38_alt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG38_alt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG38_alt.codingRegions[,2, drop=T], "Camo"= camo.pacbio.HG38_alt.codingRegions[,2, drop=T], "Platform"=rep("PacBio", 5), "Reference"= rep("HG38_alt", 5)),
                    data.table("CodingRegions"=dark.Illumina250.CHM13.codingRegions[,1, drop=T], "AllDark"=dark.Illumina250.CHM13.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina250.CHM13.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina250.CHM13.codingRegions[,2, drop=T], "Camo"= camo.Illumina250.CHM13.codingRegions[,2, drop=T], "Platform"=rep("Illumina250", 5), "Reference"= rep("CHM13", 5)),
                    data.table("CodingRegions"=dark.Illumina250.HG38_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina250.HG38_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina250.HG38_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina250.HG38_noAlt.codingRegions[,2, drop=T], "Camo"= camo.Illumina250.HG38_noAlt.codingRegions[,2, drop=T], "Platform"=rep("Illumina250", 5), "Reference"= rep("HG38_noAlt", 5)),
                    data.table("CodingRegions"=dark.Illumina250.HG38_Alt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina250.HG38_Alt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina250.HG38_Alt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina250.HG38_Alt.codingRegions[,2, drop=T], "Camo"= camo.Illumina250.HG38_Alt.codingRegions[,2, drop=T], "Platform"=rep("Illumina250", 5), "Reference"= rep("HG38_alt", 5)),
                    data.table("CodingRegions"=dark.Illumina250.HG19_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina250.HG19_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina250.HG19_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina250.HG19_noAlt.codingRegions[,2, drop=T], "Camo"= camo.Illumina250.HG19_noAlt.codingRegions[,2, drop=T], "Platform"=rep("Illumina250", 5), "Reference"= rep("HG19_noAlt", 5)),
                    data.table("CodingRegions"=dark.Illumina100.HG19_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina100.HG19_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.HG19_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.HG19_noAlt.codingRegions[,2, drop=T], "Camo"= camo.Illumina100.HG19_noAlt.codingRegions[,2, drop=T], "Platform"=rep("Illumina100", 5), "Reference"= rep("HG19_noAlt", 5)),
                    data.table("CodingRegions"=dark.Illumina100.HG38_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina100.HG38_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.HG38_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.HG38_noAlt.codingRegions[,2, drop=T], "Camo"= camo.Illumina100.HG38_noAlt.codingRegions[,2, drop=T], "Platform"=rep("Illumina100", 5), "Reference"= rep("HG38_noAlt", 5)),
                    data.table("CodingRegions"=dark.Illumina100.CHM13.codingRegions[,1, drop=T], "AllDark"=dark.Illumina100.CHM13.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.CHM13.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.CHM13.codingRegions[,2, drop=T], "Camo"= camo.Illumina100.CHM13.codingRegions[,2, drop=T], "Platform"=rep("Illumina100", 5), "Reference"= rep("CHM13", 5)),
                    data.table("CodingRegions"=dark.Illumina100.HG38_Alt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina100.HG38_Alt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.HG38_Alt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.HG38_Alt.codingRegions[,2, drop=T], "Camo"= camo.Illumina100.HG38_Alt.codingRegions[,2, drop=T], "Platform"=rep("Illumina100", 5), "Reference"= rep("HG38_alt", 5))
              )
colnames(codingRegions) = c("CodingRegions", "AllDark", "Dark_by_Depth", "Dark_by_MapQ", "Camo", "Platform", "Reference")

NewLongRead_codingRegions=rbind(data.table("CodingRegions"=dark.ONT.CHM13.codingRegions[,1, drop=T], "AllDark"=dark.ONT.CHM13.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.ONT.CHM13.codingRegions[,2, drop=T], "Dark_by_MapQ"=mapq.ONT.CHM13.codingRegions[,2, drop=T], "Camo"=camo.ONT.CHM13.codingRegions[,2, drop=T], "Platform"=rep("ONT", 5), "Reference"=rep("CHM13", 5)), 
                    data.table("CodingRegions"=dark.ONT.HG19_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.ONT.HG19_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG19_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG19_noAlt.codingRegions[,2, drop=T], "Camo"= camo.ONT.HG19_noAlt.codingRegions[,2, drop=T], "Platform"=rep("ONT", 5), "Reference"= rep("HG19_noAlt", 5)),
                    data.table("CodingRegions"=dark.ONT.HG38_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.ONT.HG38_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG38_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG38_noAlt.codingRegions[,2, drop=T], "Camo"= camo.ONT.HG38_noAlt.codingRegions[,2, drop=T], "Platform"=rep("ONT", 5), "Reference"= rep("HG38_noAlt", 5)),
                    data.table("CodingRegions"=dark.ONT.HG38_alt.codingRegions[,1, drop=T], "AllDark"=dark.ONT.HG38_alt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.ONT.HG38_alt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.ONT.HG38_alt.codingRegions[,2, drop=T], "Camo"= camo.ONT.HG38_alt.codingRegions[,2, drop=T], "Platform"=rep("ONT", 5), "Reference"= rep("HG38_alt", 5)),
                    data.table("CodingRegions"=dark.pacbio.CHM13.codingRegions[,1, drop=T], "AllDark"=dark.pacbio.CHM13.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.pacbio.CHM13.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.CHM13.codingRegions[,2, drop=T], "Camo"= camo.pacbio.CHM13.codingRegions[,2, drop=T], "Platform"=rep("PacBio", 5), "Reference"= rep("CHM13", 5)),
                    data.table("CodingRegions"=dark.pacbio.HG19_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.pacbio.HG19_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG19_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG19_noAlt.codingRegions[,2, drop=T], "Camo"= camo.pacbio.HG19_noAlt.codingRegions[,2, drop=T], "Platform"=rep("PacBio", 5), "Reference"= rep("HG19_noAlt", 5)),
                    data.table("CodingRegions"=dark.pacbio.HG38_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.pacbio.HG38_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG38_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG38_noAlt.codingRegions[,2, drop=T], "Camo"= camo.pacbio.HG38_noAlt.codingRegions[,2, drop=T], "Platform"=rep("PacBio", 5), "Reference"= rep("HG38_noAlt", 5)),
                    data.table("CodingRegions"=dark.pacbio.HG38_alt.codingRegions[,1, drop=T], "AllDark"=dark.pacbio.HG38_alt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.pacbio.HG38_alt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.pacbio.HG38_alt.codingRegions[,2, drop=T], "Camo"= camo.pacbio.HG38_alt.codingRegions[,2, drop=T], "Platform"=rep("PacBio", 5), "Reference"= rep("HG38_alt", 5)),
                    data.table("CodingRegions"=dark.Illumina100.new.CHM13.codingRegions[,1, drop=T], "AllDark"=dark.Illumina100.new.CHM13.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.new.CHM13.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.new.CHM13.codingRegions[,2, drop=T], "Camo"= camo.Illumina100.new.CHM13.codingRegions[,2, drop=T], "Platform"=rep("Illumina100", 5), "Reference"= rep("CHM13", 5)),
                    data.table("CodingRegions"=dark.Illumina100.new.HG19_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina100.new.HG19_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.new.HG19_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.new.HG19_noAlt.codingRegions[,2, drop=T], "Camo"= camo.Illumina100.new.HG19_noAlt.codingRegions[,2, drop=T], "Platform"=rep("Illumina100", 5), "Reference"= rep("HG19_noAlt", 5)),
                    data.table("CodingRegions"=dark.Illumina100.new.HG38_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina100.new.HG38_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.new.HG38_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.new.HG38_noAlt.codingRegions[,2, drop=T], "Camo"= camo.Illumina100.new.HG38_noAlt.codingRegions[,2, drop=T], "Platform"=rep("Illumina100", 5), "Reference"= rep("HG38_noAlt", 5)),
                    data.table("CodingRegions"=dark.Illumina100.new.HG38_Alt.codingRegions[,1, drop=T], "AllDark"=dark.Illumina100.new.HG38_Alt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.Illumina100.new.HG38_Alt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.Illumina100.new.HG38_Alt.codingRegions[,2, drop=T], "Camo"= camo.Illumina100.new.HG38_Alt.codingRegions[,2, drop=T], "Platform"=rep("Illumina100", 5), "Reference"= rep("HG38_alt", 5)),
                    data.table("CodingRegions"=dark.new.Illumina250.CHM13.codingRegions[,1, drop=T], "AllDark"=dark.new.Illumina250.CHM13.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina250.CHM13.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina250.CHM13.codingRegions[,2, drop=T], "Camo"= camo.new.Illumina250.CHM13.codingRegions[,2, drop=T], "Platform"=rep("Illumina250", 5), "Reference"= rep("CHM13", 5)),
                    data.table("CodingRegions"=dark.new.Illumina250.HG19_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.new.Illumina250.HG19_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina250.HG19_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina250.HG19_noAlt.codingRegions[,2, drop=T], "Camo"= camo.new.Illumina250.HG19_noAlt.codingRegions[,2, drop=T], "Platform"=rep("Illumina250", 5), "Reference"= rep("HG19_noAlt", 5)),
                    data.table("CodingRegions"=dark.new.Illumina250.HG38_noAlt.codingRegions[,1, drop=T], "AllDark"=dark.new.Illumina250.HG38_noAlt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina250.HG38_noAlt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina250.HG38_noAlt.codingRegions[,2, drop=T], "Camo"= camo.new.Illumina250.HG38_noAlt.codingRegions[,2, drop=T], "Platform"=rep("Illumina250", 5), "Reference"= rep("HG38_noAlt", 5)),
                    data.table("CodingRegions"=dark.new.Illumina250.HG38_Alt.codingRegions[,1, drop=T], "AllDark"=dark.new.Illumina250.HG38_Alt.codingRegions[,2, drop=T], "Dark_by_Depth"=depth.new.Illumina250.HG38_Alt.codingRegions[,2, drop=T],"Dark_by_MapQ"= mapq.new.Illumina250.HG38_Alt.codingRegions[,2, drop=T], "Camo"= camo.new.Illumina250.HG38_Alt.codingRegions[,2, drop=T], "Platform"=rep("Illumina250", 5), "Reference"= rep("HG38_alt", 5))
              )
colnames(NewLongRead_codingRegions) = c("CodingRegions", "AllDark", "Dark_by_Depth", "Dark_by_MapQ", "Camo", "Platform", "Reference")

codingRegionClasses = as.list(unique(codingRegions$CodingRegions))
Coding_option_indicator <- lapply(
  codingRegionClasses,
  function(codingRegionClasses) {
    list(label = codingRegionClasses,
         value = codingRegionClasses)
  }
)

DarkRegionClasses = as.list(colnames(biotype)[2:5])
DarkRegion_option_indicator <- lapply(
  DarkRegionClasses,
  function(DarkRegionClasses) {
    list(label = DarkRegionClasses,
         value = DarkRegionClasses)
  }
)

References = as.list(unique(biotype$Reference))
References_option_indicator <- lapply(
  References,
  function(References) {
    list(label = References,
         value = References)
  }
)

platforms=unique(codingRegions$Platform)
platforms_option_indicator <- lapply(
  platforms,
  function(platforms) {
    list(label = platforms,
         value = platforms)
  }
)

Allcolors = hcl.colors(length(platforms))
names(Allcolors)=platforms

PercentDark = as.list(c(0, 5, 10, 25, 50, 75, 100))
PercentDark_option_indicator <- lapply(
  PercentDark,
  function(PercentDark) {
    list(label = paste0(PercentDark, "%"),
         value = PercentDark)
  }
)

vars_to_remove <- grep("HG38", ls(), value = TRUE)
rm(list = vars_to_remove)

vars_to_remove <- grep("HG19", ls(), value = TRUE)
rm(list = vars_to_remove)

vars_to_remove <- grep("CHM13", ls(), value = TRUE)
rm(list = vars_to_remove)

# Circos Data Load
#data <- "https://git.io/circos_graph_data.json"
#
#circos_graph_data = read_json(data)

chrCols = c("#996600", "#666600", "#99991E", "#CC0000", "#FF0000", "#FF00CC", "#FFCCCC", "#FF9900", "#FFCC00", "#FFFF00", "#CCFF00", "#00FF00", "#358000", "#0000CC", "#6699FF", "#99CCFF", "#00FFFF", "#CCFFFF", "#9900CC", "#CC33FF", "#CC99FF", "#666666", "#999999", "#CCCCCC", "#CC66CC")

chm13=fread("referenceSizes/CHM13.chromSizes.txt")
colnames(chm13) = c("id", "len")
chm13$label = chm13$id
chm13$color = chrCols

hg38=fread("referenceSizes/hg38.assembledOnly.chrom.sizes")
colnames(hg38) = c("id", "len")
hg38$label = hg38$id
hg38$color = chrCols

hg19=fread("referenceSizes/hg19.assembledOnly.chrom.sizes")
colnames(hg19) = c("id", "len")
hg19$label = hg19$id
hg19$color = chrCols


referencesSize = NULL
referencesSize$CHM13 = chm13
referencesSize$HG38_noAlt = hg38
referencesSize$HG38_alt = hg38
referencesSize$HG19_noAlt = hg19

referenceComparisonSize = NULL
referenceComparisonSize$CHM13vsHG38 = rbind(referencesSize$CHM13, referencesSize$HG38_noAlt)
referenceComparisonSize$CHM13vsHG38 = rbind(referencesSize$CHM13, referencesSize$HG19)
# Sliding Windows

hg19_dark = fread("data/SlidingWindows/UpdatedSamples_09_16_2024/Merged_HG19_NoAlt_1MbWindow.bed", header=T, stringsAsFactors = F, sep="\t")
hg19_Illumina100Depth=data.frame("block_id" = hg19_dark$Chr, "start" = as.numeric(hg19_dark$Start), "end" = as.numeric(hg19_dark$End), "value" = as.numeric(hg19_dark$Illumina100_Depth) / 1000000 * 100)
hg19_Illumina100MapQ=data.frame("block_id" = hg19_dark$Chr, "start" = as.numeric(hg19_dark$Start), "end" = as.numeric(hg19_dark$End), "value" = as.numeric(hg19_dark$Illumina100_MapQ) / 1000000 * 100)

hg19_ONTDepth=data.frame("block_id" = hg19_dark$Chr, "start" = as.numeric(hg19_dark$Start), "end" = as.numeric(hg19_dark$End), "value" = as.numeric(hg19_dark$ONT_Depth) / 1000000 * 100)
hg19_ONTMapQ=data.frame("block_id" = hg19_dark$Chr, "start" = as.numeric(hg19_dark$Start), "end" = as.numeric(hg19_dark$End), "value" = as.numeric(hg19_dark$ONT_MapQ) / 1000000 * 100)

hg19_PacBioDepth=data.frame("block_id" = hg19_dark$Chr, "start" = as.numeric(hg19_dark$Start), "end" = as.numeric(hg19_dark$End), "value" = as.numeric(hg19_dark$PacBio_Depth) / 1000000 * 100)
hg19_PacBioMapQ=data.frame("block_id" = hg19_dark$Chr, "start" = as.numeric(hg19_dark$Start), "end" = as.numeric(hg19_dark$End), "value" = as.numeric(hg19_dark$PacBio_MapQ) / 1000000 * 100)

hg19_Illumina250Depth=data.frame("block_id" = hg19_dark$Chr, "start" = as.numeric(hg19_dark$Start), "end" = as.numeric(hg19_dark$End), "value" = as.numeric(hg19_dark$Illumina250_Depth) / 1000000 * 100)
hg19_Illumina250MapQ=data.frame("block_id" = hg19_dark$Chr, "start" = as.numeric(hg19_dark$Start), "end" = as.numeric(hg19_dark$End), "value" = as.numeric(hg19_dark$Illumina250_MapQ) / 1000000 * 100)

hg38_dark = fread("data/SlidingWindows/UpdatedSamples_09_16_2024/Merged_HG38_NoAlt_1MbWindow.bed", header=T, stringsAsFactors = F, sep="\t")
hg38ONTDepth=data.frame("block_id" = hg38_dark$Chr, "start" = as.numeric(hg38_dark$Start), "end" = as.numeric(hg38_dark$End), "value" = as.numeric(hg38_dark$ONT_Depth) / 1000000 * 100)
hg38ONTMapQ=data.frame("block_id" = hg38_dark$Chr, "start" = as.numeric(hg38_dark$Start), "end" = as.numeric(hg38_dark$End), "value" = as.numeric(hg38_dark$ONT_MapQ) / 1000000 * 100)

hg38PacBioDepth=data.frame("block_id" = hg38_dark$Chr, "start" = as.numeric(hg38_dark$Start), "end" = as.numeric(hg38_dark$End), "value" = as.numeric(hg38_dark$PacBio_Depth) / 1000000 * 100)
hg38PacBioMapQ=data.frame("block_id" = hg38_dark$Chr, "start" = as.numeric(hg38_dark$Start), "end" = as.numeric(hg38_dark$End), "value" = as.numeric(hg38_dark$PacBio_MapQ) / 1000000 * 100)

hg38_Illumina250Depth=data.frame("block_id" = hg38_dark$Chr, "start" = as.numeric(hg38_dark$Start), "end" = as.numeric(hg38_dark$End), "value" = as.numeric(hg38_dark$Illumina250_Depth) / 1000000 * 100)
hg38_Illumina250MapQ=data.frame("block_id" = hg38_dark$Chr, "start" = as.numeric(hg38_dark$Start), "end" = as.numeric(hg38_dark$End), "value" = as.numeric(hg38_dark$Illumina250_MapQ) / 1000000 * 100)

hg38_Illumina100Depth=data.frame("block_id" = hg38_dark$Chr, "start" = as.numeric(hg38_dark$Start), "end" = as.numeric(hg38_dark$End), "value" = as.numeric(hg38_dark$Illumina100_Depth) / 1000000 * 100)
hg38_Illumina100MapQ=data.frame("block_id" = hg38_dark$Chr, "start" = as.numeric(hg38_dark$Start), "end" = as.numeric(hg38_dark$End), "value" = as.numeric(hg38_dark$Illumina100_MapQ) / 1000000 * 100)

hg38_Alt_dark = fread("data/SlidingWindows/UpdatedSamples_09_16_2024/Merged_HG38_Alt_1MbWindow.bed", header=T, stringsAsFactors = F, sep="\t")
hg38_Alt_ONTDepth=data.frame("block_id" = hg38_Alt_dark$Chr, "start" = as.numeric(hg38_Alt_dark$Start), "end" = as.numeric(hg38_Alt_dark$End), "value" = as.numeric(hg38_Alt_dark$ONT_Depth) / 1000000 * 100)
hg38_Alt_ONTMapQ=data.frame("block_id" = hg38_Alt_dark$Chr, "start" = as.numeric(hg38_Alt_dark$Start), "end" = as.numeric(hg38_Alt_dark$End), "value" = as.numeric(hg38_Alt_dark$ONT_MapQ) / 1000000 * 100)

hg38_Alt_Illumina100Depth=data.frame("block_id" = hg38_Alt_dark$Chr, "start" = as.numeric(hg38_Alt_dark$Start), "end" = as.numeric(hg38_Alt_dark$End), "value" = as.numeric(hg38_Alt_dark$Illumina100_Depth) / 1000000 * 100)
hg38_Alt_Illumina100MapQ=data.frame("block_id" = hg38_Alt_dark$Chr, "start" = as.numeric(hg38_Alt_dark$Start), "end" = as.numeric(hg38_Alt_dark$End), "value" = as.numeric(hg38_Alt_dark$Illumina100_MapQ) / 1000000 * 100)

hg38_Alt_Illumina250Depth=data.frame("block_id" = hg38_Alt_dark$Chr, "start" = as.numeric(hg38_Alt_dark$Start), "end" = as.numeric(hg38_Alt_dark$End), "value" = as.numeric(hg38_Alt_dark$Illumina250_Depth) / 1000000 * 100)
hg38_Alt_Illumina250MapQ=data.frame("block_id" = hg38_Alt_dark$Chr, "start" = as.numeric(hg38_Alt_dark$Start), "end" = as.numeric(hg38_Alt_dark$End), "value" = as.numeric(hg38_Alt_dark$Illumina250_MapQ) / 1000000 * 100)

hg38_Alt_PacBioDepth=data.frame("block_id" = hg38_Alt_dark$Chr, "start" = as.numeric(hg38_Alt_dark$Start), "end" = as.numeric(hg38_Alt_dark$End), "value" = as.numeric(hg38_Alt_dark$PacBio_Depth) / 1000000 * 100)
hg38_Alt_PacBioMapQ=data.frame("block_id" = hg38_Alt_dark$Chr, "start" = as.numeric(hg38_Alt_dark$Start), "end" = as.numeric(hg38_Alt_dark$End), "value" = as.numeric(hg38_Alt_dark$PacBio_MapQ) / 1000000 * 100)

chm13_dark = fread("data/SlidingWindows/UpdatedSamples_09_16_2024/Merged_CHM13_1MbWindow.bed", header=T, stringsAsFactors = F, sep="\t")
ONTDepth=data.frame("block_id" = chm13_dark$Chr, "start" = as.numeric(chm13_dark$Start), "end" = as.numeric(chm13_dark$End), "value" = as.numeric(chm13_dark$ONT_Depth) / 1000000 * 100)
ONTMapQ=data.frame("block_id" = chm13_dark$Chr, "start" = as.numeric(chm13_dark$Start), "end" = as.numeric(chm13_dark$End), "value" = as.numeric(chm13_dark$ONT_MapQ) / 1000000 * 100)

PacBioDepth=data.frame("block_id" = chm13_dark$Chr, "start" = as.numeric(chm13_dark$Start), "end" = as.numeric(chm13_dark$End), "value" = as.numeric(chm13_dark$PacBio_Depth) / 1000000 * 100)
PacBioMapQ=data.frame("block_id" = chm13_dark$Chr, "start" = as.numeric(chm13_dark$Start), "end" = as.numeric(chm13_dark$End), "value" = as.numeric(chm13_dark$PacBio_MapQ) / 1000000 * 100)

Illumina250Depth=data.frame("block_id" = chm13_dark$Chr, "start" = as.numeric(chm13_dark$Start), "end" = as.numeric(chm13_dark$End), "value" = as.numeric(chm13_dark$Illumina250_Depth) / 1000000 * 100)
Illumina250MapQ=data.frame("block_id" = chm13_dark$Chr, "start" = as.numeric(chm13_dark$Start), "end" = as.numeric(chm13_dark$End), "value" = as.numeric(chm13_dark$Illumina250_MapQ) / 1000000 * 100)

Illumina100Depth=data.frame("block_id" = chm13_dark$Chr, "start" = as.numeric(chm13_dark$Start), "end" = as.numeric(chm13_dark$End), "value" = as.numeric(chm13_dark$Illumina100_Depth) / 1000000 * 100)
Illumina100MapQ=data.frame("block_id" = chm13_dark$Chr, "start" = as.numeric(chm13_dark$Start), "end" = as.numeric(chm13_dark$End), "value" = as.numeric(chm13_dark$Illumina100_MapQ) / 1000000 * 100)


darkSlidingWindow=NULL
darkSlidingWindow$CHM13 = NULL
darkSlidingWindow$CHM13$ONT = NULL
darkSlidingWindow$CHM13$ONT$Depth = ONTDepth
darkSlidingWindow$CHM13$ONT$MAPQ = ONTMapQ
darkSlidingWindow$CHM13$PacBio = NULL
darkSlidingWindow$CHM13$PacBio$Depth = PacBioDepth
darkSlidingWindow$CHM13$PacBio$MAPQ = PacBioMapQ
darkSlidingWindow$CHM13$Illumina250 = NULL
darkSlidingWindow$CHM13$Illumina250$Depth = Illumina250Depth
darkSlidingWindow$CHM13$Illumina250$MAPQ = Illumina250MapQ
darkSlidingWindow$CHM13$Illumina100 = NULL
darkSlidingWindow$CHM13$Illumina100$Depth = Illumina100Depth
darkSlidingWindow$CHM13$Illumina100$MAPQ = Illumina100MapQ
darkSlidingWindow$HG38_alt = NULL
darkSlidingWindow$HG38_alt$Illumina100 = NULL
darkSlidingWindow$HG38_alt$Illumina100$Depth = hg38_Alt_Illumina100Depth
darkSlidingWindow$HG38_alt$Illumina100$MAPQ = hg38_Alt_Illumina100MapQ
darkSlidingWindow$HG38_alt$Illumina250 = NULL
darkSlidingWindow$HG38_alt$Illumina250$Depth = hg38_Alt_Illumina250Depth
darkSlidingWindow$HG38_alt$Illumina250$MAPQ = hg38_Alt_Illumina250MapQ
darkSlidingWindow$HG38_alt$ONT = NULL
darkSlidingWindow$HG38_alt$ONT$Depth = hg38_Alt_ONTDepth
darkSlidingWindow$HG38_alt$ONT$MAPQ = hg38_Alt_ONTMapQ
darkSlidingWindow$HG38_alt$PacBio = NULL
darkSlidingWindow$HG38_alt$PacBio$Depth = hg38_Alt_PacBioDepth
darkSlidingWindow$HG38_alt$PacBio$MAPQ = hg38_Alt_PacBioMapQ
darkSlidingWindow$HG38_noAlt = NULL
darkSlidingWindow$HG38_noAlt$ONT = NULL
darkSlidingWindow$HG38_noAlt$ONT$Depth = hg38ONTDepth
darkSlidingWindow$HG38_noAlt$ONT$MAPQ = hg38ONTMapQ
darkSlidingWindow$HG38_noAlt$PacBio = NULL
darkSlidingWindow$HG38_noAlt$PacBio$Depth = hg38PacBioDepth
darkSlidingWindow$HG38_noAlt$PacBio$MAPQ = hg38PacBioMapQ
darkSlidingWindow$HG38_noAlt$Illumina250 = NULL
darkSlidingWindow$HG38_noAlt$Illumina250$Depth = hg38_Illumina250Depth
darkSlidingWindow$HG38_noAlt$Illumina250$MAPQ = hg38_Illumina250MapQ
darkSlidingWindow$HG38_noAlt$Illumina100 = NULL
darkSlidingWindow$HG38_noAlt$Illumina100$Depth = hg38_Illumina100Depth
darkSlidingWindow$HG38_noAlt$Illumina100$MAPQ = hg38_Illumina100MapQ
darkSlidingWindow$HG19_noAlt = NULL
darkSlidingWindow$HG19_noAlt$Illumina100 = NULL
darkSlidingWindow$HG19_noAlt$Illumina100$Depth = hg19_Illumina100Depth
darkSlidingWindow$HG19_noAlt$Illumina100$MAPQ = hg19_Illumina100MapQ
darkSlidingWindow$HG19_noAlt$Illumina250 = NULL
darkSlidingWindow$HG19_noAlt$Illumina250$Depth = hg19_Illumina250Depth
darkSlidingWindow$HG19_noAlt$Illumina250$MAPQ = hg19_Illumina250MapQ
darkSlidingWindow$HG19_noAlt$ONT = NULL
darkSlidingWindow$HG19_noAlt$ONT$Depth = hg19_ONTDepth
darkSlidingWindow$HG19_noAlt$ONT$MAPQ = hg19_ONTMapQ
darkSlidingWindow$HG19_noAlt$PacBio = NULL
darkSlidingWindow$HG19_noAlt$PacBio$Depth = hg19_PacBioDepth
darkSlidingWindow$HG19_noAlt$PacBio$MAPQ = hg19_PacBioMapQ

#chm13_mapq_cov = melt(chm13_dark[,c(1,grep("MapQ", colnames(chm13_dark))), with=F])
#chm13_mapq_Fig = ggplot(chm13_mapq_cov, aes(x=log10(value+1), fill=variable)) + geom_density(alpha=.1) + facet_wrap(~Chr)
#hg19_mapq_cov = melt(hg19_dark[,c(1,grep("MapQ", colnames(hg19_dark))), with=F])
#hg19_mapq_Fig = ggplot(hg19_mapq_cov, aes(x=log10(value+1), fill=variable)) + geom_density(alpha=.1) + facet_wrap(~Chr)
#hg38_mapq_cov = melt(hg38_dark[,c(1,grep("MapQ", colnames(hg38_dark))), with=F])
#hg38_mapq_Fig = ggplot(hg38_mapq_cov, aes(x=log10(value+1), fill=variable)) + geom_density(alpha=.1) + facet_wrap(~Chr)
#
#chm13_depth_cov = melt(chm13_dark[,c(1,grep("Depth", colnames(chm13_dark))), with=F])
#chm13_depth_Fig = ggplot(chm13_depth_cov, aes(x=log10(value+1), fill=variable)) + geom_density(alpha=.1) + facet_wrap(~Chr)
#hg19_depth_cov = melt(hg19_dark[,c(1,grep("Depth", colnames(hg19_dark))), with=F])
#hg19_depth_Fig = ggplot(hg19_depth_cov, aes(x=log10(value+1), fill=variable)) + geom_density(alpha=.1) + facet_wrap(~Chr)
#hg38_depth_cov = melt(hg38_dark[,c(1,grep("Depth", colnames(hg38_dark))), with=F])
#hg38_depth_Fig = ggplot(hg38_depth_cov, aes(x=log10(value+1), fill=variable)) + geom_density(alpha=.1) + facet_wrap(~Chr)
#
#mapqRegionCHRFigs = NULL
#mapqRegionCHRFigs$CHM13 = ggplotly(chm13_mapq_Fig, height=800, width=2000)
#mapqRegionCHRFigs$HG38 = ggplotly(hg38_mapq_Fig, height=800, width=2000)
#mapqRegionCHRFigs$HG19 = ggplotly(hg19_mapq_Fig, height=800, width=2000)
#
#depthRegionCHRFigs = NULL
#depthRegionCHRFigs$CHM13 = ggplotly(chm13_depth_Fig, height=800, width=2000)
#depthRegionCHRFigs$HG38 = ggplotly(hg38_depth_Fig, height=800, width=2000)
#depthRegionCHRFigs$HG19 = ggplotly(hg19_depth_Fig, height=800, width=2000)



chm13_sum=apply(chm13_dark[,4:ncol(chm13_dark)], 2, sum)
hg19_noAlt_sum=apply(hg19_dark[,4:ncol(hg19_dark)], 2, sum)
hg38_Alt_sum=apply(hg38_Alt_dark[,4:ncol(hg38_Alt_dark)], 2, sum)
hg38_noAlt_sum=apply(hg38_dark[,4:ncol(hg38_dark)], 2, sum)

fullGenome=NULL
fullGenome$Depth=data.frame(Ref=c(rep("CHM13", 4),rep("HG19_noAlt", 4),rep("HG38_noAlt", 4),rep("HG38_Alt", 4)), Platform=c("Illumina100", "Illumina250", "PacBio", "ONT", "Illumina100", "Illumina250", "PacBio", "ONT", "Illumina100", "Illumina250", "PacBio", "ONT", "Illumina100", "Illumina250", "PacBio", "ONT"), 
                            NumDarkBases=c(chm13_sum["Illumina100_Depth"], chm13_sum["Illumina250_Depth"], chm13_sum["PacBio_Depth"], chm13_sum["ONT_Depth"], 
                                           hg19_noAlt_sum["Illumina100_Depth"], hg19_noAlt_sum["Illumina250_Depth"], hg19_noAlt_sum["PacBio_Depth"], hg19_noAlt_sum["ONT_Depth"],
                                           hg38_noAlt_sum["Illumina100_Depth"], hg38_noAlt_sum["Illumina250_Depth"], hg38_noAlt_sum["PacBio_Depth"], hg38_noAlt_sum["ONT_Depth"],
                                           hg38_Alt_sum["Illumina100_Depth"], hg38_Alt_sum["Illumina250_Depth"], hg38_Alt_sum["PacBio_Depth"], hg38_Alt_sum["ONT_Depth"]))
fullGenome$MapQ=data.frame(Ref=c(rep("CHM13", 4),rep("HG19_noAlt", 4),rep("HG38_noAlt", 4),rep("HG38_Alt", 4)), Platform=c("Illumina100", "Illumina250", "PacBio", "ONT", "Illumina100", "Illumina250", "PacBio", "ONT", "Illumina100", "Illumina250", "PacBio", "ONT", "Illumina100", "Illumina250", "PacBio", "ONT"), 
                           NumDarkBases=c(chm13_sum["Illumina100_MapQ"], chm13_sum["Illumina250_MapQ"], chm13_sum["PacBio_MapQ"], chm13_sum["ONT_MapQ"], 
                                          hg19_noAlt_sum["Illumina100_MapQ"], hg19_noAlt_sum["Illumina250_MapQ"], hg19_noAlt_sum["PacBio_MapQ"], hg19_noAlt_sum["ONT_MapQ"],
                                          hg38_noAlt_sum["Illumina100_MapQ"], hg38_noAlt_sum["Illumina250_MapQ"], hg38_noAlt_sum["PacBio_MapQ"], hg38_noAlt_sum["ONT_MapQ"],
                                          hg38_Alt_sum["Illumina100_MapQ"], hg38_Alt_sum["Illumina250_MapQ"],  hg38_Alt_sum["PacBio_MapQ"], hg38_Alt_sum["ONT_MapQ"]))

nucsAndRegions$Reference = factor(nucsAndRegions$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_alt", "CHM13"))
nucsAndRegions$Platform = factor(nucsAndRegions$Platform, levels=c("Illumina100", "Illumina250", "PacBio", "ONT"))
mapqFig=ggplot(nucsAndRegions[which(nucsAndRegions$Region_type=="Low_Mapq"), ], aes(x=Reference, y=Nucleotide_count/1000000, fill=Platform)) + geom_bar(stat="identity", position="dodge") + ggtitle("Genome-wide Dark-By-MapQ") + theme_bw() + xlab("Reference") + ylab("Number of Dark Bases (Mb)") + scale_fill_manual(values = RColorBrewer::brewer.pal(5, "Set2")[c(1,3,4,5)])

NewLongRead_nucsAndRegions$Reference = factor(NewLongRead_nucsAndRegions$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_alt", "CHM13"))
NewLongRead_nucsAndRegions$Platform = factor(NewLongRead_nucsAndRegions$Platform, levels=c("Illumina100", "Illumina250", "PacBio", "ONT"))
WithSuppmapqFig=ggplot(NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Region_type=="Low_Mapq"), ], aes(x=Reference, y=Nucleotide_count/1000000, fill=Platform)) + geom_bar(stat="identity", position="dodge") + ggtitle("Genome-wide Dark-By-MapQ") + theme_bw() + xlab("Reference") + ylab("Number of Dark Bases (Mb)") + scale_fill_manual(values = RColorBrewer::brewer.pal(5, "Set2")[c(1,3,4,5)])

#pdf("Figures/GenomeWideDbM.pdf", width = 6, height=3)
#mapqFig
#dev.off()

biotype$Reference = factor(biotype$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_alt", "CHM13"))
biotype$Platform = factor(biotype$Platform, levels=c("Illumina100RL", "Illumina250RL", "PacBio", "ONT"))
biotypeMapQ=ggplot(biotype[biotype=="total",], aes(x=Reference, y=Dark_by_MapQ/1000000, fill=Platform)) + geom_bar(stat="identity", position="dodge") + ggtitle("Gene Body Dark-By-MapQ") + theme_bw() + xlab("Reference") + ylab("Number of Dark Bases (Mb)")
biotypeDepth=ggplot(biotype[biotype=="total",], aes(x=Reference, y=Dark_by_Depth/1000000, fill=Platform)) + geom_bar(stat="identity", position="dodge") + ggtitle("Gene Body Dark-By-Depth") + theme_bw() + xlab("Reference") + ylab("Number of Dark Bases (Mb)")

depthFig=ggplot(nucsAndRegions[which(nucsAndRegions$Region_type=="Low_Depth"), ], aes(x=Reference, y=Nucleotide_count/1000000, fill=Platform)) + geom_bar(stat="identity", position="dodge") + ggtitle("Genome-wide Dark-By-Depth") + theme_bw() + xlab("Reference") + ylab("Number of Dark Bases (Mb)") + scale_fill_manual(values = RColorBrewer::brewer.pal(5, "Set2")[c(1,3,4,5)])
WithSuppdepthFig=ggplot(NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Region_type=="Low_Depth"), ], aes(x=Reference, y=Nucleotide_count/1000000, fill=Platform)) + geom_bar(stat="identity", position="dodge") + ggtitle("Genome-wide Dark-By-Depth") + theme_bw() + xlab("Reference") + ylab("Number of Dark Bases (Mb)") + scale_fill_manual(values = RColorBrewer::brewer.pal(5, "Set2")[c(1,3,4,5)])

#pdf("Figures/GenomeWideDbD.pdf", width = 6, height=3)
#depthFig
#dev.off()

# Camo Regions
CamoRegions=NULL
CamoRegions$CHM13=NULL
CamoRegions$CHM13$ONT=fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$CHM13$PacBio=fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG38_Alt=NULL
CamoRegions$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG38_noAlt=NULL
CamoRegions$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG19_noAlt=NULL
CamoRegions$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
CamoRegions$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)

## New Run

withSuppCamoRegions=NULL
withSuppCamoRegions$CHM13=NULL
#withSuppCamoRegions$CHM13$ONT=fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$CHM13$PacBio=fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG38_Alt=NULL
withSuppCamoRegions$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG38_noAlt=NULL
withSuppCamoRegions$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG19_noAlt=NULL
withSuppCamoRegions$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)
withSuppCamoRegions$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.camo.GATK.all_camo_regions.bed", header=F, sep="\t", stringsAsFactors = F)



##Exact Position
#ggsave(ggVennDiagram(list(ONT=paste0(CamoRegions$CHM13$ONT$V1,":",CamoRegions$CHM13$ONT$V2,"-",CamoRegions$CHM13$ONT$V3), PacBio=paste0(CamoRegions$CHM13$PacBio$V1,":",CamoRegions$CHM13$PacBio$V2,"-",CamoRegions$CHM13$PacBio$V3), Illumina100=paste0(CamoRegions$CHM13$Illumina100$V1,":",CamoRegions$CHM13$Illumina100$V2,"-",CamoRegions$CHM13$Illumina100$V3), Illumina250=paste0(CamoRegions$CHM13$Illumina250$V1,":",CamoRegions$CHM13$Illumina250$V2,"-",CamoRegions$CHM13$Illumina250$V3))), filename = "assets/CHM13VennCamoFigs.png", width = 11, height = 6, units = "in")
#ggsave(ggVennDiagram(list(ONT=paste0(CamoRegions$HG38_Alt$ONT$V1,":",CamoRegions$HG38_Alt$ONT$V2,"-",CamoRegions$HG38_Alt$ONT$V3), PacBio=paste0(CamoRegions$HG38_Alt$PacBio$V1,":",CamoRegions$HG38_Alt$PacBio$V2,"-",CamoRegions$HG38_Alt$PacBio$V3), Illumina100=paste0(CamoRegions$HG38_Alt$Illumina100$V1,":",CamoRegions$HG38_Alt$Illumina100$V2,"-",CamoRegions$HG38_Alt$Illumina100$V3), Illumina250=paste0(CamoRegions$HG38_Alt$Illumina250$V1,":",CamoRegions$HG38_Alt$Illumina250$V2,"-",CamoRegions$HG38_Alt$Illumina250$V3))), filename = "assets/HG38_altVennCamoFigs.png", width = 11, height = 6, units = "in")
#ggsave(ggVennDiagram(list(ONT=paste0(CamoRegions$HG38_noAlt$ONT$V1,":",CamoRegions$HG38_noAlt$ONT$V2,"-",CamoRegions$HG38_noAlt$ONT$V3), PacBio=paste0(CamoRegions$HG38_noAlt$PacBio$V1,":",CamoRegions$HG38_noAlt$PacBio$V2,"-",CamoRegions$HG38_noAlt$PacBio$V3), Illumina100=paste0(CamoRegions$HG38_noAlt$Illumina100$V1,":",CamoRegions$HG38_noAlt$Illumina100$V2,"-",CamoRegions$HG38_noAlt$Illumina100$V3), Illumina250=paste0(CamoRegions$HG38_noAlt$Illumina250$V1,":",CamoRegions$HG38_noAlt$Illumina250$V2,"-",CamoRegions$HG38_noAlt$Illumina250$V3))), filename = "assets/HG38_noAltVennCamoFigs.png", width = 11, height = 6, units = "in")
#ggsave(ggVennDiagram(list(ONT=paste0(CamoRegions$HG19_noAlt$ONT$V1,":",CamoRegions$HG19_noAlt$ONT$V2,"-",CamoRegions$HG19_noAlt$ONT$V3), PacBio=paste0(CamoRegions$HG19_noAlt$PacBio$V1,":",CamoRegions$HG19_noAlt$PacBio$V2,"-",CamoRegions$HG19_noAlt$PacBio$V3), Illumina100=paste0(CamoRegions$HG19_noAlt$Illumina100$V1,":",CamoRegions$HG19_noAlt$Illumina100$V2,"-",CamoRegions$HG19_noAlt$Illumina100$V3), Illumina250=paste0(CamoRegions$HG19_noAlt$Illumina250$V1,":",CamoRegions$HG19_noAlt$Illumina250$V2,"-",CamoRegions$HG19_noAlt$Illumina250$V3))), filename = "assets/HG19_noAltVennCamoFigs.png", width = 11, height = 6, units = "in")
#
##Gene Names
#ggsave(ggVennDiagram(list(ONT=CamoRegions$CHM13$ONT$V4, PacBio=CamoRegions$CHM13$PacBio$V4, Illumina100=CamoRegions$CHM13$Illumina100$V4, Illumina250=CamoRegions$CHM13$Illumina250$V4)), filename = "assets/CHM13VennCamoGeneOverlapFigs.png", width = 11, height = 6, units = "in")
#ggsave(ggVennDiagram(list(ONT=CamoRegions$HG38_Alt$ONT$V4, PacBio=CamoRegions$HG38_Alt$PacBio$V4, Illumina100=CamoRegions$HG38_Alt$Illumina100$V4, Illumina250=CamoRegions$HG38_Alt$Illumina250$V4)), filename = "assets/HG38_altVennCamoGeneOverlapFigs.png", width = 11, height = 6, units = "in")
#ggsave(ggVennDiagram(list(ONT=CamoRegions$HG38_noAlt$ONT$V4, PacBio=CamoRegions$HG38_noAlt$PacBio$V4, Illumina100=CamoRegions$HG38_noAlt$Illumina100$V4, Illumina250=CamoRegions$HG38_noAlt$Illumina250$V4)), filename = "assets/HG38_noAltVennCamoGeneOverlapFigs.png", width = 11, height = 6, units = "in")
#ggsave(ggVennDiagram(list(ONT=CamoRegions$HG19_noAlt$ONT$V4, PacBio=CamoRegions$HG19_noAlt$PacBio$V4, Illumina100=CamoRegions$HG19_noAlt$Illumina100$V4, Illumina250=CamoRegions$HG19_noAlt$Illumina250$V4)), filename = "assets/HG19_noAltVennCamoGeneOverlapFigs.png", width = 11, height = 6, units = "in")
#
#
#CamoRegionsFig=NULL
#CamoRegionsFig$CHM13="assets/CHM13VennCamoFigs.png"
#CamoRegionsFig$HG38_alt="assets/HG38_altVennCamoFigs.png"
#CamoRegionsFig$HG38_noAlt="assets/HG38_noAltVennCamoFigs.png"
#CamoRegionsFig$HG19_noAlt="assets/HG19_noAltVennCamoFigs.png"
#
#CamoGenesFig=NULL
#CamoGenesFig$CHM13="assets/CHM13VennCamoGeneOverlapFigs.png"
#CamoGenesFig$HG38_alt="assets/HG38_altVennCamoGeneOverlapFigs.png"
#CamoGenesFig$HG38_noAlt="assets/HG38_noAltVennCamoGeneOverlapFigs.png"
#CamoGenesFig$HG19_noAlt="assets/HG19_noAltVennCamoGeneOverlapFigs.png"

# Camo Genes
CamoGenePercent=NULL
CamoGenePercent$CHM13=NULL
CamoGenePercent$CHM13$ONT=fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$CHM13$PacBio=fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG38_Alt=NULL
CamoGenePercent$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG38_noAlt=NULL
CamoGenePercent$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG19_noAlt=NULL
CamoGenePercent$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
CamoGenePercent$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)

##New Run

withSuppCamoGenePercent=NULL
withSuppCamoGenePercent$CHM13=NULL
withSuppCamoGenePercent$CHM13$ONT=fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$CHM13$PacBio=fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG38_Alt=NULL
withSuppCamoGenePercent$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG38_noAlt=NULL
withSuppCamoGenePercent$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG19_noAlt=NULL
withSuppCamoGenePercent$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppCamoGenePercent$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_camo_genes.txt", header=T, sep="\t", stringsAsFactors = F)

hg19_noAlt_inter = intersect(intersect(intersect(CamoGenePercent$HG19_noAlt$ONT[which(CamoGenePercent$HG19_noAlt$ONT$perc_total > 10), "gene_name"], CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG19_noAlt$PacBio[which(CamoGenePercent$HG19_noAlt$Illumina250$perc_total > 10), "gene_name"])
hg38_noAlt_inter = intersect(intersect(intersect(CamoGenePercent$HG38_noAlt$ONT[which(CamoGenePercent$HG38_noAlt$ONT$perc_total > 10), "gene_name"], CamoGenePercent$HG38_noAlt$Illumina100[which(CamoGenePercent$HG38_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG38_noAlt$Illumina100[which(CamoGenePercent$HG38_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG38_noAlt$PacBio[which(CamoGenePercent$HG38_noAlt$Illumina250$perc_total > 10), "gene_name"])
hg38_Alt_inter = intersect(intersect(intersect(CamoGenePercent$HG38_Alt$ONT[which(CamoGenePercent$HG38_Alt$ONT$perc_total > 10), "gene_name"], CamoGenePercent$HG38_Alt$Illumina100[which(CamoGenePercent$HG38_Alt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG38_Alt$Illumina100[which(CamoGenePercent$HG38_Alt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG38_Alt$PacBio[which(CamoGenePercent$HG38_Alt$Illumina250$perc_total > 10), "gene_name"])
hg19_noAlt_inter = intersect(intersect(intersect(CamoGenePercent$HG19_noAlt$ONT[which(CamoGenePercent$HG19_noAlt$ONT$perc_total > 10), "gene_name"], CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG19_noAlt$PacBio[which(CamoGenePercent$HG19_noAlt$Illumina250$perc_total > 10), "gene_name"])

hg19_noAlt_union = union(union(union(CamoGenePercent$HG19_noAlt$ONT[which(CamoGenePercent$HG19_noAlt$ONT$perc_total > 10), "gene_name"], CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG19_noAlt$PacBio[which(CamoGenePercent$HG19_noAlt$Illumina250$perc_total > 10), "gene_name"])
hg38_noAlt_union = union(union(union(CamoGenePercent$HG38_noAlt$ONT[which(CamoGenePercent$HG38_noAlt$ONT$perc_total > 10), "gene_name"], CamoGenePercent$HG38_noAlt$Illumina100[which(CamoGenePercent$HG38_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG38_noAlt$Illumina100[which(CamoGenePercent$HG38_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG38_noAlt$PacBio[which(CamoGenePercent$HG38_noAlt$Illumina250$perc_total > 10), "gene_name"])
hg38_Alt_union = union(union(union(CamoGenePercent$HG38_Alt$ONT[which(CamoGenePercent$HG38_Alt$ONT$perc_total > 10), "gene_name"], CamoGenePercent$HG38_Alt$Illumina100[which(CamoGenePercent$HG38_Alt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG38_Alt$Illumina100[which(CamoGenePercent$HG38_Alt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG38_Alt$PacBio[which(CamoGenePercent$HG38_Alt$Illumina250$perc_total > 10), "gene_name"])
hg19_noAlt_inter = union(union(union(CamoGenePercent$HG19_noAlt$ONT[which(CamoGenePercent$HG19_noAlt$ONT$perc_total > 10), "gene_name"], CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total > 10), "gene_name"]), CamoGenePercent$HG19_noAlt$PacBio[which(CamoGenePercent$HG19_noAlt$Illumina250$perc_total > 10), "gene_name"])

#medRelGenes = fread("data/MedicallyRelevantGenes/medically_relevant_genes.tsv", header=T, stringsAsFactors = F, sep="\t")
#
#intersect(hg19_noAlt_inter, medRelGenes$gene_name)
#intersect(hg38_noAlt_inter, medRelGenes$gene_name)
#intersect(hg38_Alt_inter, medRelGenes$gene_name)
#
#write.table(intersect(hg19_noAlt_union, medRelGenes$gene_name), file="data/MedicallyRelevantGenes/HG19_noAlt.UnionCamoGenes.MedRelevantGenes.txt", sep="\n", quote=F, row.names = F, col.names = F)
#write.table(intersect(hg38_noAlt_union, medRelGenes$gene_name), file="data/MedicallyRelevantGenes/HG38_noAlt.UnionCamoGenes.MedRelevantGenes.txt", sep="\n", quote=F, row.names = F, col.names = F)
#write.table(intersect(hg38_Alt_union, medRelGenes$gene_name), file="data/MedicallyRelevantGenes/HG38_Alt.UnionCamoGenes.MedRelevantGenes.txt", sep="\n", quote=F, row.names = F, col.names = F)

# DarkByDepth Genes
darkByDepthGenePercent=NULL
darkByDepthGenePercent$CHM13=NULL
darkByDepthGenePercent$CHM13$ONT=fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$CHM13$PacBio=fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG38_Alt=NULL
darkByDepthGenePercent$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG38_noAlt=NULL
darkByDepthGenePercent$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG19_noAlt=NULL
darkByDepthGenePercent$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByDepthGenePercent$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)

### New Run

withSuppDarkByDepthGenePercent=NULL
withSuppDarkByDepthGenePercent$CHM13=NULL
withSuppDarkByDepthGenePercent$CHM13$ONT=fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$CHM13$PacBio=fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG38_Alt=NULL
withSuppDarkByDepthGenePercent$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG38_noAlt=NULL
withSuppDarkByDepthGenePercent$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG19_noAlt=NULL
withSuppDarkByDepthGenePercent$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkByDepthGenePercent$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_low_depth_genes.txt", header=T, sep="\t", stringsAsFactors = F)

# Dark Genes
darkGenePercent=NULL
darkGenePercent$CHM13=NULL
darkGenePercent$CHM13$ONT=fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$CHM13$PacBio=fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG38_Alt=NULL
darkGenePercent$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG38_noAlt=NULL
darkGenePercent$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG19_noAlt=NULL
darkGenePercent$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkGenePercent$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)

## New Run

withSuppDarkGenePercent=NULL
withSuppDarkGenePercent$CHM13=NULL
withSuppDarkGenePercent$CHM13$ONT=fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$CHM13$PacBio=fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG38_Alt=NULL
withSuppDarkGenePercent$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG38_noAlt=NULL
withSuppDarkGenePercent$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG19_noAlt=NULL
withSuppDarkGenePercent$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)
withSuppDarkGenePercent$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_dark_genes.txt", header=T, sep="\t", stringsAsFactors = F)


# DarkByMapQ Genes
darkByMapQGenePercent=NULL
darkByMapQGenePercent$CHM13=NULL
darkByMapQGenePercent$CHM13$ONT=fread("data/ONT_CHM13/UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$CHM13$PacBio=fread("data/PacBio_CHM13/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_Output_01_18_2024/Illumina250.Illumina250.T2T_CHM13_v2.0.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG38_Alt=NULL
darkByMapQGenePercent$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_Alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG38_noAlt=NULL
darkByMapQGenePercent$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG38_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG19_noAlt=NULL
darkByMapQGenePercent$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
darkByMapQGenePercent$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_Output_01_18_2024/Illumina250.Illumina250.HG19_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)

### New Run

sithSuppDarkByMapQGenePercent=NULL
sithSuppDarkByMapQGenePercent$CHM13=NULL
sithSuppDarkByMapQGenePercent$CHM13$ONT=fread("data/ONT_CHM13/Updated_output_12_09_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$CHM13$PacBio=fread("data/PacBio_CHM13/Updated_output_12_09_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$CHM13$Illumina100=fread("data/Illumina100_CHM13/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$CHM13$Illumina250=fread("data/Illumina250_CHM13/Updated_output_12_09_2024/Illumina250.Illumina250.T2T_CHM13_v2.0_run2.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG38_Alt=NULL
sithSuppDarkByMapQGenePercent$HG38_Alt$ONT=fread("data/ONT_HG38_Alt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_Alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG38_Alt$PacBio=fread("data/PacBio_HG38_Alt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG38_v107_Alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG38_Alt$Illumina100=fread("data/Illumina100_HG38_Alt/Updated_output_12_09_2024/illuminaRL100.1KGenomes_hg38_plus_decoy.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG38_Alt$Illumina250=fread("data/Illumina250_HG38_Alt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_Alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG38_noAlt=NULL
sithSuppDarkByMapQGenePercent$HG38_noAlt$ONT=fread("data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG38_noAlt$PacBio=fread("data/PacBio_HG38_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG38_noAlt$Illumina100=fread("data/Illumina100_HG38_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG38_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG38_noAlt$Illumina250=fread("data/Illumina250_HG38_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG38_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG19_noAlt=NULL
sithSuppDarkByMapQGenePercent$HG19_noAlt$ONT=fread("data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG19_noAlt$PacBio=fread("data/PacBio_HG19_noAlt/Updated_output_12_09_2024/PacBio.PacBio.All1KG.HG19_no_alt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG19_noAlt$Illumina100=fread("data/Illumina100_HG19_noAlt/Updated_output_12_09_2024/originalADSP.Illumina_OriginalADSP.HG19_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)
sithSuppDarkByMapQGenePercent$HG19_noAlt$Illumina250=fread("data/Illumina250_HG19_noAlt/Updated_output_12_09_2024/Illumina250.Illumina250.HG19_noAlt.percent_low_mapq_genes.txt", header=T, sep="\t", stringsAsFactors = F)






# Set the layout of the app
app %>% set_layout(
  h1('Dark Region Comparison App', style=list(textAlign = "center")),
  h2('Assessing the role of supplementary reads in defining dark regions', style=list(textAlign = "center")),
  br(),br(),
  htmlDiv(list(
    dccTabs(id="DataTabs", value='primaryTab', children=list(
      dccTab(label='Primary Alignments Only', value='primaryTab', className='custom-tab', selected_className='custom-tab--selected'),
      dccTab(label='Primary + Supplementary Alignments', value='primarySuppTab', className='custom-tab', selected_className='custom-tab--selected'),
      dccTab(label='Comparison', value='comparisonTab', className='custom-tab', selected_className='custom-tab--selected')
      ))
  )),
  htmlDiv(id="tabs-content"),
  br(),
  h1("Package Info:"),
  br(),
  div(img(src="assets/SessionInfo.png", alt="image")),
  br()
 
)

# Biotype Comparison


app %>% add_callback(
  output(id='tabs-content', property = 'children'),
  params = list(input(id = 'DataTabs', property = 'value')),
  function(tab){
    if(tab == 'primaryTab'){
      return(htmlDiv(list(
        br(), br(),
         h2("Number of Genome-wide Dark Bases", style=list(textAlign = "center")),
         br(),
         dccGraph(id="GW_MapQ", style = list(width = '40%', display = 'inline-block'), figure = ggplotly(mapqFig)),
         div(style = list(width = '12%', display = 'inline-block')),
         dccGraph(id="GW_depth", style = list(width = '40%', display = 'inline-block'), figure = ggplotly(depthFig)),
         br(), br(),
         
         htmlHr(class="dashed"),
         h2("Number of Dark Bases in Annotated Gene Bodies ", style=list(textAlign = "center")),
         br(),
         
         div("Biotype:", style = list(width = '48%', display = 'inline-block')),
         div(style = list(width = '4%', display = 'inline-block')),
         div("Coding Region Type:", style = list(width = '48%', display = 'inline-block')),
         br(),
         div(
               dccDropdown(
                 id = 'biotype',
                 options = biotype_option_indicator,
                 value = 'total'
               ),
               style = list(width = '48%', display = 'inline-block')
         ),
         div(style = list(width = '4%', display = 'inline-block')),
         div(
           dccDropdown(
             id = 'codingRegion',
             options = Coding_option_indicator,
             value = 'CDS'
           ),
           style = list(width = '48%', display = 'inline-block')
         ),
         br(),
         dccGraph(id = 'Biotype-graphic', style = list(width = '40%', display = 'inline-block')),
         div(style = list(width = '12%', display = 'inline-block')),
         dccGraph(id = 'codingRegion-graphic', style = list(width = '40%', display = 'inline-block')),
         br(),
        
         htmlHr(class="dashed"),
         h2("Number of Bases Broken out by Region Type", style=list(textAlign = "center")),
         br(),
         div("Region Type:", style = list(width = '48%', display = 'inline-block')),
         br(),
         div(
           dccDropdown(
             id = 'regionType',
             options = DarkRegion_option_indicator,
             value = 'AllDark'
           ),
           style = list(width = '48%', display = 'inline-block')
         ),
         br(),
         dccGraph(id = 'Biotype-RegionType-graphic', style = list(width = '40%', display = 'inline-block')),
         div(style = list(width = '12%', display = 'inline-block')),
         dccGraph(id = 'codingRegion-RegionType-graphic', style = list(width = '40%', display = 'inline-block')),
         br(),
         br(),
         htmlHr(class="dashed"),
         h2("Number of Dark Genes", style=list(textAlign = "center")),
         br(),
         div(
           dccDropdown(
             id = 'percentDark',
             options = PercentDark_option_indicator,
             value = "0"
           ),
           style = list(width = '48%', display = 'inline-block')
         ),
         br(),
         dccGraph(id = 'Total-DarkType-graphic', style = list(width = '40%', display = 'inline-block')),
         div(style = list(width = '12%', display = 'inline-block')),
         dccGraph(id = 'Biotype-DarkType-graphic', style = list(width = '40%', display = 'inline-block')),
         h2("Number of Dark-by-Depth Genes", style=list(textAlign = "center")),
         br(),
         dccGraph(id = 'Total-DarkByDepthType-graphic', style = list(width = '40%', display = 'inline-block')),
         div(style = list(width = '12%', display = 'inline-block')),
         dccGraph(id = 'Biotype-DarkByDepthType-graphic', style = list(width = '40%', display = 'inline-block')),
         h2("Number of Dark-by-MapQ Genes", style=list(textAlign = "center")),
         br(),
         dccGraph(id = 'Total-DarkByMapQType-graphic', style = list(width = '40%', display = 'inline-block')),
         div(style = list(width = '12%', display = 'inline-block')),
         dccGraph(id = 'Biotype-DarkByMapQType-graphic', style = list(width = '40%', display = 'inline-block')),
         br(),
         h2("Number of Genes that are both Dark-by-Depth and Dark-by-MAPQ"),
         dccGraph(id = 'DarkGeneOverlap-graphic', style = list(width = '40%', display = 'inline-block')),
         br(),
         h2("Number of Camouflaged Genes", style=list(textAlign = "center")),
         br(),
         dccGraph(id = 'Total-CamoType-graphic', style = list(width = '40%', display = 'inline-block')),
         div(style = list(width = '12%', display = 'inline-block')),
         dccGraph(id = 'Biotype-CamoType-graphic', style = list(width = '40%', display = 'inline-block')),
         br(),
         br(),
         dccGraph(id = 'PercentCamoOfMapQ-graphic', style = list(width = '40%', display = 'inline-block')),
         br(),
         br(),
         htmlHr(class="dashed"),
         h1('Data Tables', style=list(textAlign = "center")),
         br(),
         br(),
         div(
           strong("All Dark Region Stats", style=list('font-size'="18pt")),
           dashDataTable(
             id = "Nucleotide-region-AllDark-datatable",
             data = df_to_list(nucsAndRegions[which(nucsAndRegions$Region_type=="All_Dark"),]),
             sort_action='native',
             sort_mode='single',
             style_as_list_view=T,
             style_data = list(
               color = 'black',
               background_color = 'white'
             ),
             style_header = list(
               textAlign = "left",
               fontWeight = 'bold'
             ),
             style_cell_conditional = list(list(
               'if' = list(column_id = "Reference"),
               textAlign="left"
             ), list(
               'if' = list(column_id = "Platform"),
               textAlign="left"
             ), list(
               'if' = list(column_id = "Region_type"),
               textAlign="left"
             )),
             style_data_conditional=list(list(
               'if' = list(row_index = 'odd'),
               backgroundColor = 'rgb(250, 250, 250)'
             ))
           ),
           style = list(textAlign = 'center')
         ),
         br(),br(),
         div(
           strong("Dark-by-Depth Region Stats", style=list('font-size'="18pt")),
           dashDataTable(
             id = "Nucleotide-region-dbd-datatable",
             data = df_to_list(nucsAndRegions[which(nucsAndRegions$Region_type=="Low_Depth"),]),
             sort_action='native',
             sort_mode='single',
             style_data = list(
               color = 'black',
               background_color = 'white'
             ),
             style_header = list(
               textAlign = "left",
               fontWeight = 'bold'
             ),
             style_cell_conditional = list(list(
               'if' = list(column_id = "Reference"),
               textAlign="left"
             ), list(
               'if' = list(column_id = "Platform"),
               textAlign="left"
             ), list(
               'if' = list(column_id = "Region_type"),
               textAlign="left"
             )),
             style_data_conditional=list(list(
               'if' = list(row_index = 'odd'),
               backgroundColor = 'rgb(250, 250, 250)'
             ))
           ),
           style = list(textAlign = 'center')
         ),
         br(),br(),
         div(
           strong("Dark-by-MapQ Region Stats", style=list('font-size'="18pt")),
           dashDataTable(
             id = "Nucleotide-region-dbm-datatable",
             data = df_to_list(nucsAndRegions[which(nucsAndRegions$Region_type=="Low_Mapq"),]),
             sort_action='native',
             sort_mode='single',
             style_data = list(
               color = 'black',
               background_color = 'white'
             ),
             style_header = list(
               textAlign = "left",
               fontWeight = 'bold'
             ),
             style_cell_conditional = list(list(
               'if' = list(column_id = "Reference"),
               textAlign="left"
             ), list(
               'if' = list(column_id = "Platform"),
               textAlign="left"
             ), list(
               'if' = list(column_id = "Region_type"),
               textAlign="left"
             )),
             style_data_conditional=list(list(
               'if' = list(row_index = 'odd'),
               backgroundColor = 'rgb(250, 250, 250)'
             ))
           ),
           style = list(textAlign = 'center', font="20pt")
         )
        )))
    } else if(tab == 'primarySuppTab'){
      return(htmlDiv(list(
        br(), br(),
        h2("Number of Genome-wide Dark Bases", style=list(textAlign = "center")),
        br(),
        dccGraph(id="SuppGW_MapQ", style = list(width = '40%', display = 'inline-block'), figure = ggplotly(WithSuppmapqFig)),
        div(style = list(width = '12%', display = 'inline-block')),
        dccGraph(id="SuppGW_depth", style = list(width = '40%', display = 'inline-block'), figure = ggplotly(WithSuppdepthFig)),
        br(), br(),
        
        htmlHr(class="dashed"),
        h2("Number of Dark Bases in Annotated Gene Bodies ", style=list(textAlign = "center")),
        br(),
        
        div("Biotype:", style = list(width = '48%', display = 'inline-block')),
        div(style = list(width = '4%', display = 'inline-block')),
        div("Coding Region Type:", style = list(width = '48%', display = 'inline-block')),
        br(),
        div(
          dccDropdown(
            id = 'biotype',
            options = biotype_option_indicator,
            value = 'total'
          ),
          style = list(width = '48%', display = 'inline-block')
        ),
        div(style = list(width = '4%', display = 'inline-block')),
        div(
          dccDropdown(
            id = 'codingRegion',
            options = Coding_option_indicator,
            value = 'CDS'
          ),
          style = list(width = '48%', display = 'inline-block')
        ),
        br(),
        dccGraph(id = 'Biotype-graphic', style = list(width = '40%', display = 'inline-block')),
        div(style = list(width = '12%', display = 'inline-block')),
        dccGraph(id = 'codingRegion-graphic', style = list(width = '40%', display = 'inline-block')),
        br(),
        
        htmlHr(class="dashed"),
        h2("Number of Bases Broken out by Region Type", style=list(textAlign = "center")),
        br(),
        div("Region Type:", style = list(width = '48%', display = 'inline-block')),
        br(),
        div(
          dccDropdown(
            id = 'regionType',
            options = DarkRegion_option_indicator,
            value = 'AllDark'
          ),
          style = list(width = '48%', display = 'inline-block')
        ),
        br(),
        dccGraph(id = 'Biotype-RegionType-graphic', style = list(width = '40%', display = 'inline-block')),
        div(style = list(width = '12%', display = 'inline-block')),
        dccGraph(id = 'codingRegion-RegionType-graphic', style = list(width = '40%', display = 'inline-block')),
        br(),
        br(),
        htmlHr(class="dashed"),
        h2("Number of Dark Genes", style=list(textAlign = "center")),
        br(),
        div(
          dccDropdown(
            id = 'percentDark',
            options = PercentDark_option_indicator,
            value = "0"
          ),
          style = list(width = '48%', display = 'inline-block')
        ),
        br(),
        dccGraph(id = 'Total-DarkType-graphic', style = list(width = '40%', display = 'inline-block')),
        div(style = list(width = '12%', display = 'inline-block')),
        dccGraph(id = 'Biotype-DarkType-graphic', style = list(width = '40%', display = 'inline-block')),
        h2("Number of Dark-by-Depth Genes", style=list(textAlign = "center")),
        br(),
        dccGraph(id = 'Total-DarkByDepthType-graphic', style = list(width = '40%', display = 'inline-block')),
        div(style = list(width = '12%', display = 'inline-block')),
        dccGraph(id = 'Biotype-DarkByDepthType-graphic', style = list(width = '40%', display = 'inline-block')),
        h2("Number of Dark-by-MapQ Genes", style=list(textAlign = "center")),
        br(),
        dccGraph(id = 'Total-DarkByMapQType-graphic', style = list(width = '40%', display = 'inline-block')),
        div(style = list(width = '12%', display = 'inline-block')),
        dccGraph(id = 'Biotype-DarkByMapQType-graphic', style = list(width = '40%', display = 'inline-block')),
        br(),
        h2("Number of Genes that are both Dark-by-Depth and Dark-by-MAPQ"),
        dccGraph(id = 'DarkGeneOverlap-graphic', style = list(width = '40%', display = 'inline-block')),
        br(),
        h2("Number of Camouflaged Genes", style=list(textAlign = "center")),
        br(),
        dccGraph(id = 'Total-CamoType-graphic', style = list(width = '40%', display = 'inline-block')),
        div(style = list(width = '12%', display = 'inline-block')),
        dccGraph(id = 'Biotype-CamoType-graphic', style = list(width = '40%', display = 'inline-block')),
        br(),
        br(),
        dccGraph(id = 'PercentCamoOfMapQ-graphic', style = list(width = '40%', display = 'inline-block')),
        br(),
        br(),
        htmlHr(class="dashed"),
        h1('Data Tables', style=list(textAlign = "center")),
        br(),
        br(),
        div(
          strong("All Dark Region Stats", style=list('font-size'="18pt")),
          dashDataTable(
            id = "Nucleotide-region-AllDark-datatable",
            data = df_to_list(nucsAndRegions[which(nucsAndRegions$Region_type=="All_Dark"),]),
            sort_action='native',
            sort_mode='single',
            style_as_list_view=T,
            style_data = list(
              color = 'black',
              background_color = 'white'
            ),
            style_header = list(
              textAlign = "left",
              fontWeight = 'bold'
            ),
            style_cell_conditional = list(list(
              'if' = list(column_id = "Reference"),
              textAlign="left"
            ), list(
              'if' = list(column_id = "Platform"),
              textAlign="left"
            ), list(
              'if' = list(column_id = "Region_type"),
              textAlign="left"
            )),
            style_data_conditional=list(list(
              'if' = list(row_index = 'odd'),
              backgroundColor = 'rgb(250, 250, 250)'
            ))
          ),
          style = list(textAlign = 'center')
        ),
        br(),br(),
        div(
          strong("Dark-by-Depth Region Stats", style=list('font-size'="18pt")),
          dashDataTable(
            id = "Nucleotide-region-dbd-datatable",
            data = df_to_list(nucsAndRegions[which(nucsAndRegions$Region_type=="Low_Depth"),]),
            sort_action='native',
            sort_mode='single',
            style_data = list(
              color = 'black',
              background_color = 'white'
            ),
            style_header = list(
              textAlign = "left",
              fontWeight = 'bold'
            ),
            style_cell_conditional = list(list(
              'if' = list(column_id = "Reference"),
              textAlign="left"
            ), list(
              'if' = list(column_id = "Platform"),
              textAlign="left"
            ), list(
              'if' = list(column_id = "Region_type"),
              textAlign="left"
            )),
            style_data_conditional=list(list(
              'if' = list(row_index = 'odd'),
              backgroundColor = 'rgb(250, 250, 250)'
            ))
          ),
          style = list(textAlign = 'center')
        ),
        br(),br(),
        div(
          strong("Dark-by-MapQ Region Stats", style=list('font-size'="18pt")),
          dashDataTable(
            id = "Nucleotide-region-dbm-datatable",
            data = df_to_list(nucsAndRegions[which(nucsAndRegions$Region_type=="Low_Mapq"),]),
            sort_action='native',
            sort_mode='single',
            style_data = list(
              color = 'black',
              background_color = 'white'
            ),
            style_header = list(
              textAlign = "left",
              fontWeight = 'bold'
            ),
            style_cell_conditional = list(list(
              'if' = list(column_id = "Reference"),
              textAlign="left"
            ), list(
              'if' = list(column_id = "Platform"),
              textAlign="left"
            ), list(
              'if' = list(column_id = "Region_type"),
              textAlign="left"
            )),
            style_data_conditional=list(list(
              'if' = list(row_index = 'odd'),
              backgroundColor = 'rgb(250, 250, 250)'
            ))
          ),
          style = list(textAlign = 'center', font="20pt")
        )
      )))
    } else if (tab == 'comparisonTab') {
      return(htmlDiv(list(
        br(), br(),
        h2("Comparison of Genome-wide Dark Bases between Primary Reads with and without Supplementary Reads", style=list(textAlign = "center")),
        br(),
        div(
          style = list(textAlign = 'center', font="20pt"),
          dccRadioItems(
            id = "platformRadio",
            options = list(list(label = "ONT", value = "ONT"),
                         list(label = "PacBio", value = "PacBio"),
                         list(label = "Illumina 100bp", value = "Illumina100"),
                         list(label = "Illumina 250bp", value = "Illumina250")),
            value = 'ONT', inline = F)
        ), 
        dccGraph(id = 'Platform-Comp-graph', style = list(width = '100%', display = 'inline-block')),
        br(), br(),
        dccGraph(id="percentCompGraph1", style = list(width = '50%', display = 'inline-block')),
        dccGraph(id="percentCompGraph2", style = list(width = '50%', display = 'inline-block')),
        br(),br(),
        dccGraph(id = 'Platform-Comp-graph2', style = list(width = '100%', display = 'inline-block')),
        br(), br(),
        htmlHr(class="dashed"),
        h2("Comparison of the Number of Dark Regions", style=list(textAlign = "center")),
        br(),
        dccGraph(id = 'Platform-Comp-graph3', style = list(width = '100%', display = 'inline-block')),
        br(), br(),
        dccGraph(id = 'Platform-Comp-graph4', style = list(width = '100%', display = 'inline-block')),
        htmlHr(class="dashed"),
        h2("Genes In overlapping", style=list(textAlign = "center")),
        br(),
        dccGraph(id = 'Wordcloud', style = list(width = '100%', display = 'inline-block')),
        br(), br()
        
        
      )))
    }
  }
)


app %>% add_callback(
  output('Wordcloud', 'figure'),
  list(
    input('platformRadio', 'value')
  ),
  function(xaxis_column_name) {
    df2Use = NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    df2Use$type = rep("PrimarySupp", nrow(df2Use))
    temp=nucsAndRegions[which(nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    temp$type = rep("PrimaryOnly", nrow(temp))
    df2Use = rbind(df2Use, temp)
    temp=NULL
    
    fig=ggplot(df2Use, aes(x=Region_type, y=Nucleotide_count, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1))
    fig = fig + facet_wrap( ~ type)
    ggplotly(fig)
  }
)

app %>% add_callback(
  output('Platform-Comp-graph', 'figure'),
  list(
    input('platformRadio', 'value')
  ),
  function(xaxis_column_name) {
    df2Use = NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    df2Use$type = rep("PrimarySupp", nrow(df2Use))
    temp=nucsAndRegions[which(nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    temp$type = rep("PrimaryOnly", nrow(temp))
    df2Use = rbind(df2Use, temp)
    temp=NULL
    
    fig=ggplot(df2Use, aes(x=Region_type, y=Nucleotide_count, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1))
    fig = fig + facet_wrap( ~ type)
    df2Use=NULL
    ggplotly(fig)
  }
)


app %>% add_callback(
  output('percentCompGraph1', 'figure'),
  list(
    input('platformRadio', 'value')
  ),
  function(xaxis_column_name) {
    df2Use = NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    colnames(df2Use) = c("Region_type", "Platform", "Reference", "PrimarySupp")
    temp=nucsAndRegions[which(nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    colnames(temp) = c("Region_type", "Platform", "Reference", "PrimaryOnly")
    mergedDf = merge(df2Use, temp, by = c("Region_type", "Platform", "Reference"))
    mergedDf$ratioPrimary.vs.PrimarySupp = mergedDf$PrimaryOnly/mergedDf$PrimarySupp
    
    
    fig=ggplot(mergedDf , aes(x=ratioPrimary.vs.PrimarySupp, y=Region_type, color=Reference)) + geom_point() + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Dark Region Type") + xlab("Ratio of Primary Only vs Primary + Supplementary Alignments")
    
    temp=NULL
    df2Use=NULL
    ggplotly(fig)
  }
)

app %>% add_callback(
  output('percentCompGraph2', 'figure'),
  list(
    input('platformRadio', 'value')
  ),
  function(xaxis_column_name) {
    df2Use = NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    colnames(df2Use) = c("Region_type", "Platform", "Reference", "PrimarySupp")
    temp=nucsAndRegions[which(nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    colnames(temp) = c("Region_type", "Platform", "Reference", "PrimaryOnly")
    mergedDf = merge(df2Use, temp, by = c("Region_type", "Platform", "Reference"))
    mergedDf$ratioPrimary.vs.PrimarySupp = mergedDf$PrimaryOnly/mergedDf$PrimarySupp
    
    
    fig=ggplot(mergedDf , aes(x=PrimaryOnly/1000000, y=PrimarySupp/1000000, color=Reference)) + geom_point() + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Primary + Supplementary Dark Bases (Mb)") + xlab("Primary Alignment Only Dark Bases (Mb)")
    fig=fig+facet_wrap(~ Region_type)
    
    
    temp=NULL
    df2Use=NULL
    ggplotly(fig)
  }
)

app %>% add_callback(
  output('Platform-Comp-graph2', 'figure'),
  list(
    input('platformRadio', 'value')
  ),
  function(xaxis_column_name) {
    df2Use = NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    df2Use$type = rep("PrimarySupp", nrow(df2Use))
    temp=nucsAndRegions[which(nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Nucleotide_count")]
    temp$type = rep("PrimaryOnly", nrow(temp))
    df2Use = rbind(df2Use, temp)
    temp=NULL
    
    fig=ggplot(df2Use, aes(x=Region_type, y=Nucleotide_count, fill=type)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1))
    fig = fig + facet_wrap( ~ Reference, nrow = 1)
    ggplotly(fig)
  }
)

app %>% add_callback(
  output('Platform-Comp-graph3', 'figure'),
  list(
    input('platformRadio', 'value')
  ),
  function(xaxis_column_name) {
    df2Use = NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Region_count")]
    df2Use$type = rep("PrimarySupp", nrow(df2Use))
    temp=nucsAndRegions[which(nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Region_count")]
    temp$type = rep("PrimaryOnly", nrow(temp))
    df2Use = rbind(df2Use, temp)
    temp=NULL
    
    fig=ggplot(df2Use, aes(x=Region_type, y=Region_count, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1))
    fig = fig + facet_wrap( ~type , nrow = 1)
    ggplotly(fig)
  }
)

app %>% add_callback(
  output('Platform-Comp-graph4', 'figure'),
  list(
    input('platformRadio', 'value')
  ),
  function(xaxis_column_name) {
    df2Use = NewLongRead_nucsAndRegions[which(NewLongRead_nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Region_count")]
    df2Use$type = rep("PrimarySupp", nrow(df2Use))
    temp=nucsAndRegions[which(nucsAndRegions$Platform == xaxis_column_name), c("Region_type", "Platform", "Reference", "Region_count")]
    temp$type = rep("PrimaryOnly", nrow(temp))
    df2Use = rbind(df2Use, temp)
    temp=NULL
    
    fig=ggplot(df2Use, aes(x=Region_type, y=Region_count, fill=type)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1))
    fig = fig + facet_wrap( ~ Reference, nrow = 1)
    ggplotly(fig)
  }
)

app %>% add_callback(
  output('Biotype-graphic', 'figure'),
  list(
    input('biotype', 'value'),
    input('DataTabs', 'value')
  ),
  function(xaxis_column_name, tabType) {
    df2Use = NULL
    if(tabType == "primaryTab"){
      df2Use = biotype
    } else if (tabType == "primarySuppTab"){
      df2Use = NewLongRead_biotype
    } else if (tabType == "comparisonTab"){
      df2Use = NewLongRead_biotype
    } 
    
    filtered_df=melt(df2Use[df2Use$biotype == xaxis_column_name,] ) %>% dplyr::transmute(x = variable, y = value, color=Platform, group=Platform, Ref=Reference)
    filtered_df$colors = Allcolors[filtered_df$color]
    
    filtered_df$y = filtered_df$y / 1000000
    
    filtered_df$group = factor(filtered_df$group, levels=c("Illumina100RL", "Illumina250RL", "PacBio", "ONT"))
    filtered_df$Ref = factor(filtered_df$Ref, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_alt", "CHM13"))
    
    fig = ggplot(filtered_df, aes(x=Ref, y=y, fill=group)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1))  + ylab("Number of Bases (Mb)") + xlab("") + scale_fill_manual(values = RColorBrewer::brewer.pal(5, "Set2")[c(1,3,4,5)])
    fig = fig + facet_wrap( ~ x)
    #pdf(paste0("Figures/",xaxis_column_name, "_Biotype_GeneBody.pdf"))
    #print(fig)
    #dev.off()
    ggplotly(fig)
  }
)

app %>% add_callback(
  output('codingRegion-graphic', 'figure'),
  list(
    input('codingRegion', 'value'),
    input('DataTabs', 'value')
  ),
  function(xaxis_column_name, tabType) {
    df2Use = NULL
    if(tabType == "primaryTab"){
      df2Use = codingRegions
    } else if (tabType == "primarySuppTab"){
      df2Use = NewLongRead_codingRegions
    } else if (tabType == "comparisonTab"){
      df2Use = NewLongRead_codingRegions
    } 
    
    filtered_df=melt(df2Use[which(df2Use$CodingRegions == xaxis_column_name),] ) %>% dplyr::transmute(x = variable, y = value, color =Platform, Ref=Reference)
    
    filtered_df$color = factor(filtered_df$color, levels=c("Illumina100", "Illumina250", "PacBio", "ONT"))
    filtered_df$Ref = factor(filtered_df$Ref, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_alt", "CHM13"))
    
    filtered_df$y = filtered_df$y / 1000000
    
    fig = ggplot(filtered_df, aes(x=Ref, y=y, fill=color)) + geom_bar(stat="identity", position = "dodge") + theme_bw()  + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Bases (Mb)") + xlab("") + scale_fill_brewer(palette="Set2") + scale_fill_manual(values = RColorBrewer::brewer.pal(5, "Set2")[c(1,3,4,5)])
    fig = fig + facet_wrap( ~ x)
    ggplotly(fig)
  }
)


# Dark Region Type Comparison Figures

app %>% add_callback(
  output('Biotype-RegionType-graphic', 'figure'),
  list(
    input('regionType', 'value'),
    input('DataTabs', 'value')
  ),
  function(xaxis_column_name, tabType) {
    df2Use = NULL
    if(tabType == "primaryTab"){
      df2Use = biotype
    } else if (tabType == "primarySuppTab"){
      df2Use = NewLongRead_biotype
    } else if (tabType == "comparisonTab"){
      df2Use = NewLongRead_biotype
    } 
    
    filtered_df=melt(df2Use)
    filtered_df=filtered_df[which(filtered_df$variable == xaxis_column_name),] %>% dplyr::transmute(x = biotype, y = value, color=Platform, Ref=Reference)
    filtered_df$colors = Allcolors[filtered_df$color]
    
    filtered_df$y = filtered_df$y / 1000000
    
    filtered_df$x = factor(filtered_df$x, levels=c("total", "protein coding", "pseudogene", "lincRNA","miRNA", "snRNA", "rRNA", "other"))
    
    fig = ggplot(filtered_df, aes(x=color, y=y, fill=Ref)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Bases (Mb)") + xlab("")
    fig = fig + facet_wrap( ~ x)
    ggplotly(fig)
  }
)

app %>% add_callback(
  output('codingRegion-RegionType-graphic', 'figure'),
  list(
    input('regionType', 'value'),
    input('DataTabs', 'value')
  ),
  function(xaxis_column_name, tabType) {
    df2Use = NULL
    if(tabType == "primaryTab"){
      df2Use = codingRegions
    } else if (tabType == "primarySuppTab"){
      df2Use = NewLongRead_codingRegions
    } else if (tabType == "comparisonTab"){
      df2Use = NewLongRead_codingRegions
    } 
    
    filtered_df = data.table::melt(df2Use)
    filtered_df=filtered_df[which(filtered_df$variable == xaxis_column_name),] %>% dplyr::transmute(x = CodingRegions, y = value, color =Platform, Ref=Reference)
    
    filtered_df$y = filtered_df$y / 1000000
    filtered_df$Ref = factor(filtered_df$Ref, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_alt", "CHM13"))
    
    fig = ggplot(filtered_df, aes(x=color, y=y, fill=Ref)) + geom_bar(stat="identity", position = "dodge") + theme_bw()  + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Bases (Mb)") + xlab("")
    fig = fig + facet_wrap( ~ x)
    ggplotly(fig)
    
  }
)

app %>% add_callback(
  output('Total-DarkType-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    darkGenes = data.frame(Platform=c(rep("Illumina100", 4), rep("Illumina250", 4), rep("ONT", 4), rep("PacBio", 4)), 
                           Reference=rep(c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"), 4), 
                           numGene=c(length(unlist(darkGenePercent$HG19_noAlt$Illumina100[which(darkGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG38_noAlt$Illumina100[which(darkGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG38_Alt$Illumina100[which(darkGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$CHM13$Illumina100[which(darkGenePercent$CHM13$Illumina100$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG19_noAlt$Illumina250[which(darkGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG38_noAlt$Illumina250[which(darkGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG38_Alt$Illumina250[which(darkGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$CHM13$Illumina250[which(darkGenePercent$CHM13$Illumina250$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG19_noAlt$ONT[which(darkGenePercent$HG19_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG38_noAlt$ONT[which(darkGenePercent$HG38_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG38_Alt$ONT[which(darkGenePercent$HG38_Alt$ONT$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$CHM13$ONT[which(darkGenePercent$CHM13$ONT$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG19_noAlt$PacBio[which(darkGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG38_noAlt$PacBio[which(darkGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$HG38_Alt$PacBio[which(darkGenePercent$HG38_Alt$PacBio$perc_total >= perc), "gene_name"])), 
                                     length(unlist(darkGenePercent$CHM13$PacBio[which(darkGenePercent$CHM13$PacBio$perc_total >= perc), "gene_name"]))))
    
    darkGenes$Platform = factor(darkGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    darkGenes$Reference = factor(darkGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(darkGenes, aes(x=Platform, y=numGene, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    
    #pdf(paste0("Figures/AllDark_", perc, ".pdf"))
    #print(fig)
    #dev.off()
    
    ggplotly(fig)
    
  }
)

app %>% add_callback(
  output('Biotype-DarkType-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    darkIllumina100_chm13 = as.data.frame(table(darkGenePercent$CHM13$Illumina100[which(darkGenePercent$CHM13$Illumina100$perc_total >= perc), "biotype"]))
    darkIllumina250_chm13 = as.data.frame(table(darkGenePercent$CHM13$Illumina250[which(darkGenePercent$CHM13$Illumina250$perc_total >= perc), "biotype"]))
    darkONT_chm13 = as.data.frame(table(darkGenePercent$CHM13$ONT[which(darkGenePercent$CHM13$ONT$perc_total >= perc), "biotype"]))
    darkPacBio_chm13 = as.data.frame(table(darkGenePercent$CHM13$PacBio[which(darkGenePercent$CHM13$PacBio$perc_total >= perc), "biotype"]))
    
    darkIllumina100_hg19_noAlt = as.data.frame(table(darkGenePercent$HG19_noAlt$Illumina100[which(darkGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "biotype"]))
    darkIllumina250_hg19_noAlt = as.data.frame(table(darkGenePercent$HG19_noAlt$Illumina250[which(darkGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "biotype"]))
    darkONT_hg19_noAlt = as.data.frame(table(darkGenePercent$HG19_noAlt$ONT[which(darkGenePercent$HG19_noAlt$ONT$perc_total >= perc), "biotype"]))
    darkPacBio_hg19_noAlt = as.data.frame(table(darkGenePercent$HG19_noAlt$PacBio[which(darkGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "biotype"]))
    
    darkIllumina100_hg38_noAlt = as.data.frame(table(darkGenePercent$HG38_noAlt$Illumina100[which(darkGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "biotype"]))
    darkIllumina250_hg38_noAlt = as.data.frame(table(darkGenePercent$HG38_noAlt$Illumina250[which(darkGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "biotype"]))
    darkONT_hg38_noAlt = as.data.frame(table(darkGenePercent$HG38_noAlt$ONT[which(darkGenePercent$HG38_noAlt$ONT$perc_total >= perc), "biotype"]))
    darkPacBio_hg38_noAlt = as.data.frame(table(darkGenePercent$HG38_noAlt$PacBio[which(darkGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "biotype"]))
    
    darkIllumina100_hg38_Alt = as.data.frame(table(darkGenePercent$HG38_Alt$Illumina100[which(darkGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "biotype"]))
    darkIllumina250_hg38_Alt = as.data.frame(table(darkGenePercent$HG38_Alt$Illumina250[which(darkGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "biotype"]))
    darkONT_hg38_Alt = as.data.frame(table(darkGenePercent$HG38_Alt$ONT[which(darkGenePercent$HG38_Alt$ONT$perc_total >= perc), "biotype"]))
    darkPacBio_hg38_Alt = as.data.frame(table(darkGenePercent$HG38_Alt$PacBio[which(darkGenePercent$HG38_Alt$PacBio$perc_total >= perc), "biotype"]))
    
    darkIllumina100_chm13$Reference = rep("CHM13", nrow(darkIllumina100_chm13))
    darkIllumina250_chm13$Reference = rep("CHM13", nrow(darkIllumina250_chm13))
    darkONT_chm13$Reference = rep("CHM13", nrow(darkONT_chm13))
    darkPacBio_chm13$Reference = rep("CHM13", nrow(darkPacBio_chm13))
    
    darkIllumina100_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkIllumina100_hg19_noAlt))
    darkIllumina250_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkIllumina250_hg19_noAlt))
    darkONT_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkONT_hg19_noAlt))
    darkPacBio_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkPacBio_hg19_noAlt))
    
    darkIllumina100_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkIllumina100_hg38_noAlt))
    darkIllumina250_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkIllumina250_hg38_noAlt))
    darkONT_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkONT_hg38_noAlt))
    darkPacBio_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkPacBio_hg38_noAlt))
    
    darkIllumina100_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkIllumina100_hg38_Alt))
    darkIllumina250_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkIllumina250_hg38_Alt))
    darkONT_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkONT_hg38_Alt))
    darkPacBio_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkPacBio_hg38_Alt))
    
    darkIllumina100_chm13$Platform = rep("Illumina100", nrow(darkIllumina100_chm13))
    darkIllumina250_chm13$Platform = rep("Illumina250", nrow(darkIllumina250_chm13))
    darkONT_chm13$Platform = rep("ONT", nrow(darkONT_chm13))
    darkPacBio_chm13$Platform = rep("PacBio", nrow(darkPacBio_chm13))
    
    darkIllumina100_hg19_noAlt$Platform = rep("Illumina100", nrow(darkIllumina100_hg19_noAlt))
    darkIllumina250_hg19_noAlt$Platform = rep("Illumina250", nrow(darkIllumina250_hg19_noAlt))
    darkONT_hg19_noAlt$Platform = rep("ONT", nrow(darkONT_hg19_noAlt))
    darkPacBio_hg19_noAlt$Platform = rep("PacBio", nrow(darkPacBio_hg19_noAlt))
    
    darkIllumina100_hg38_noAlt$Platform = rep("Illumina100", nrow(darkIllumina100_hg38_noAlt))
    darkIllumina250_hg38_noAlt$Platform = rep("Illumina250", nrow(darkIllumina250_hg38_noAlt))
    darkONT_hg38_noAlt$Platform = rep("ONT", nrow(darkONT_hg38_noAlt))
    darkPacBio_hg38_noAlt$Platform = rep("PacBio", nrow(darkPacBio_hg38_noAlt))
    
    darkIllumina100_hg38_Alt$Platform = rep("Illumina100", nrow(darkIllumina100_hg38_Alt))
    darkIllumina250_hg38_Alt$Platform = rep("Illumina250", nrow(darkIllumina250_hg38_Alt))
    darkONT_hg38_Alt$Platform = rep("ONT", nrow(darkONT_hg38_Alt))
    darkPacBio_hg38_Alt$Platform = rep("PacBio", nrow(darkPacBio_hg38_Alt))
    
    
    darkGenes = rbind(darkIllumina100_chm13, darkIllumina250_chm13, darkONT_chm13, darkPacBio_chm13, darkIllumina100_hg19_noAlt, darkIllumina250_hg19_noAlt, darkONT_hg19_noAlt, darkPacBio_hg19_noAlt, darkIllumina100_hg38_noAlt, darkIllumina250_hg38_noAlt, darkONT_hg38_noAlt, darkPacBio_hg38_noAlt, darkIllumina100_hg38_Alt, darkIllumina250_hg38_Alt, darkONT_hg38_Alt, darkPacBio_hg38_Alt)
    
    darkGenes$Platform = factor(darkGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    darkGenes$biotype = factor(darkGenes$biotype, levels = c("protein coding", "pseudogene", "lincRNA", "miRNA", "snRNA", "rRNA", "other"))
    darkGenes$Reference = factor(darkGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(darkGenes, aes(x=Platform, y=Freq, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw()  + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    fig = fig + facet_wrap( ~ biotype)
    ggplotly(fig)
    
  }
)


app %>% add_callback(
  output('DarkGeneOverlap-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    
    illumina100_hg19_noAlt = intersect(unique(unlist(darkByDepthGenePercent$HG19_noAlt$Illumina100[which(darkByDepthGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG19_noAlt$Illumina100[which(darkByMapQGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "gene_name"])))
    illumina100_hg38_noAlt = intersect(unique(unlist(darkByDepthGenePercent$HG38_noAlt$Illumina100[which(darkByDepthGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG38_noAlt$Illumina100[which(darkByMapQGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "gene_name"])))
    illumina100_hg38_Alt = intersect(unique(unlist(darkByDepthGenePercent$HG38_Alt$Illumina100[which(darkByDepthGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG38_Alt$Illumina100[which(darkByMapQGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "gene_name"])))
    illumina100_chm13 = intersect(unique(unlist(darkByDepthGenePercent$CHM13$Illumina100[which(darkByDepthGenePercent$CHM13$Illumina100$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$CHM13$Illumina100[which(darkByMapQGenePercent$CHM13$Illumina100$perc_total >= perc), "gene_name"])))
    
    illumina250_hg19_noAlt = intersect(unique(unlist(darkByDepthGenePercent$HG19_noAlt$Illumina250[which(darkByDepthGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG19_noAlt$Illumina250[which(darkByMapQGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "gene_name"])))
    illumina250_hg38_noAlt = intersect(unique(unlist(darkByDepthGenePercent$HG38_noAlt$Illumina250[which(darkByDepthGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG38_noAlt$Illumina250[which(darkByMapQGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "gene_name"])))
    illumina250_hg38_Alt = intersect(unique(unlist(darkByDepthGenePercent$HG38_Alt$Illumina250[which(darkByDepthGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG38_Alt$Illumina250[which(darkByMapQGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "gene_name"])))
    illumina250_chm13 = intersect(unique(unlist(darkByDepthGenePercent$CHM13$Illumina250[which(darkByDepthGenePercent$CHM13$Illumina250$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$CHM13$Illumina250[which(darkByMapQGenePercent$CHM13$Illumina250$perc_total >= perc), "gene_name"])))
    
    ONT_hg19_noAlt = intersect(unique(unlist(darkByDepthGenePercent$HG19_noAlt$ONT[which(darkByDepthGenePercent$HG19_noAlt$ONT$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG19_noAlt$ONT[which(darkByMapQGenePercent$HG19_noAlt$ONT$perc_total >= perc), "gene_name"])))
    ONT_hg38_noAlt = intersect(unique(unlist(darkByDepthGenePercent$HG38_noAlt$ONT[which(darkByDepthGenePercent$HG38_noAlt$ONT$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG38_noAlt$ONT[which(darkByMapQGenePercent$HG38_noAlt$ONT$perc_total >= perc), "gene_name"])))
    ONT_hg38_Alt = intersect(unique(unlist(darkByDepthGenePercent$HG38_Alt$ONT[which(darkByDepthGenePercent$HG38_Alt$ONT$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG38_Alt$ONT[which(darkByMapQGenePercent$HG38_Alt$ONT$perc_total >= perc), "gene_name"])))
    ONT_chm13 = intersect(unique(unlist(darkByDepthGenePercent$CHM13$ONT[which(darkByDepthGenePercent$CHM13$ONT$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$CHM13$ONT[which(darkByMapQGenePercent$CHM13$ONT$perc_total >= perc), "gene_name"])))
    
    PacBio_hg19_noAlt = intersect(unique(unlist(darkByDepthGenePercent$HG19_noAlt$PacBio[which(darkByDepthGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG19_noAlt$PacBio[which(darkByMapQGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "gene_name"])))
    PacBio_hg38_noAlt = intersect(unique(unlist(darkByDepthGenePercent$HG38_noAlt$PacBio[which(darkByDepthGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG38_noAlt$PacBio[which(darkByMapQGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "gene_name"])))
    PacBio_hg38_Alt = intersect(unique(unlist(darkByDepthGenePercent$HG38_Alt$PacBio[which(darkByDepthGenePercent$HG38_Alt$PacBio$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$HG38_Alt$PacBio[which(darkByMapQGenePercent$HG38_Alt$PacBio$perc_total >= perc), "gene_name"])))
    PacBio_chm13 = intersect(unique(unlist(darkByDepthGenePercent$CHM13$PacBio[which(darkByDepthGenePercent$CHM13$PacBio$perc_total >= perc), "gene_name"])), unique(unlist(darkByMapQGenePercent$CHM13$PacBio[which(darkByMapQGenePercent$CHM13$PacBio$perc_total >= perc), "gene_name"])))
    
    
    
    darkGenes = data.frame(Platform=c(rep("Illumina100", 4), rep("Illumina250", 4), rep("ONT", 4), rep("PacBio", 4)), Reference=rep(c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"), 4), numGene=c(length(illumina100_hg19_noAlt), length(illumina100_hg38_noAlt), length(illumina100_hg38_Alt), length(illumina100_chm13), length(illumina250_hg19_noAlt), length(illumina250_hg38_noAlt), length(illumina250_hg38_Alt), length(illumina250_chm13), length(ONT_hg19_noAlt), length(ONT_hg38_noAlt), length(ONT_hg38_Alt), length(ONT_chm13), length(PacBio_hg19_noAlt), length(PacBio_hg38_noAlt), length(PacBio_hg38_Alt), length(PacBio_chm13)))
    darkGenes$Platform = factor(darkGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    darkGenes$Reference = factor(darkGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(darkGenes, aes(x=Platform, y=numGene, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    
    
    
    #pdf(paste0("Figures/OverlappedGenes_", perc, ".pdf"))
    #print(fig)
    #dev.off()
    
    
    ggplotly(fig)
    
  }
)




app %>% add_callback(
  output('Total-DarkByDepthType-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    #TODO: I think the legend and coloring is out of order. IDK why
    darkByDepthGenes = data.frame(Platform=c(rep("Illumina100", 4), rep("Illumina250", 4), rep("ONT", 4), rep("PacBio", 4)), 
                                  Reference=rep(c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"), 4), 
                                  numGene=c(length(unlist(darkByDepthGenePercent$HG19_noAlt$Illumina100[which(darkByDepthGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG38_noAlt$Illumina100[which(darkByDepthGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG38_Alt$Illumina100[which(darkByDepthGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$CHM13$Illumina100[which(darkByDepthGenePercent$CHM13$Illumina100$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG19_noAlt$Illumina250[which(darkByDepthGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG38_noAlt$Illumina250[which(darkByDepthGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG38_Alt$Illumina250[which(darkByDepthGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$CHM13$Illumina250[which(darkByDepthGenePercent$CHM13$Illumina250$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG19_noAlt$ONT[which(darkByDepthGenePercent$HG19_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG38_noAlt$ONT[which(darkByDepthGenePercent$HG38_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG38_Alt$ONT[which(darkByDepthGenePercent$HG38_Alt$ONT$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$CHM13$ONT[which(darkByDepthGenePercent$CHM13$ONT$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG19_noAlt$PacBio[which(darkByDepthGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG38_noAlt$PacBio[which(darkByDepthGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$HG38_Alt$PacBio[which(darkByDepthGenePercent$HG38_Alt$PacBio$perc_total >= perc), "gene_name"])), 
                                            length(unlist(darkByDepthGenePercent$CHM13$PacBio[which(darkByDepthGenePercent$CHM13$PacBio$perc_total >= perc), "gene_name"]))))
    
    darkByDepthGenes$Platform = factor(darkByDepthGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    darkByDepthGenes$Reference = factor(darkByDepthGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(darkByDepthGenes, aes(x=Platform, y=numGene, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    
    
    #pdf(paste0("Figures/DbD_", perc, ".pdf"))
    #print(fig)
    #dev.off()
    
    ggplotly(fig)
    
  }
)

app %>% add_callback(
  output('Biotype-DarkByDepthType-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    darkByDepthIllumina100_chm13 = as.data.frame(table(darkByDepthGenePercent$CHM13$Illumina100[which(darkByDepthGenePercent$CHM13$Illumina100$perc_total >= perc), "biotype"]))
    darkByDepthIllumina250_chm13 = as.data.frame(table(darkByDepthGenePercent$CHM13$Illumina250[which(darkByDepthGenePercent$CHM13$Illumina250$perc_total >= perc), "biotype"]))
    darkByDepthONT_chm13 = as.data.frame(table(darkByDepthGenePercent$CHM13$ONT[which(darkByDepthGenePercent$CHM13$ONT$perc_total >= perc), "biotype"]))
    darkByDepthPacBio_chm13 = as.data.frame(table(darkByDepthGenePercent$CHM13$PacBio[which(darkByDepthGenePercent$CHM13$PacBio$perc_total >= perc), "biotype"]))
    
    darkByDepthIllumina100_hg19_noAlt = as.data.frame(table(darkByDepthGenePercent$HG19_noAlt$Illumina100[which(darkByDepthGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "biotype"]))
    darkByDepthIllumina250_hg19_noAlt = as.data.frame(table(darkByDepthGenePercent$HG19_noAlt$Illumina250[which(darkByDepthGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "biotype"]))
    darkByDepthONT_hg19_noAlt = as.data.frame(table(darkByDepthGenePercent$HG19_noAlt$ONT[which(darkByDepthGenePercent$HG19_noAlt$ONT$perc_total >= perc), "biotype"]))
    darkByDepthPacBio_hg19_noAlt = as.data.frame(table(darkByDepthGenePercent$HG19_noAlt$PacBio[which(darkByDepthGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "biotype"]))
    
    darkByDepthIllumina100_hg38_noAlt = as.data.frame(table(darkByDepthGenePercent$HG38_noAlt$Illumina100[which(darkByDepthGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "biotype"]))
    darkByDepthIllumina250_hg38_noAlt = as.data.frame(table(darkByDepthGenePercent$HG38_noAlt$Illumina250[which(darkByDepthGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "biotype"]))
    darkByDepthONT_hg38_noAlt = as.data.frame(table(darkByDepthGenePercent$HG38_noAlt$ONT[which(darkByDepthGenePercent$HG38_noAlt$ONT$perc_total >= perc), "biotype"]))
    darkByDepthPacBio_hg38_noAlt = as.data.frame(table(darkByDepthGenePercent$HG38_noAlt$PacBio[which(darkByDepthGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "biotype"]))
    
    darkByDepthIllumina100_hg38_Alt = as.data.frame(table(darkByDepthGenePercent$HG38_Alt$Illumina100[which(darkByDepthGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "biotype"]))
    darkByDepthIllumina250_hg38_Alt = as.data.frame(table(darkByDepthGenePercent$HG38_Alt$Illumina250[which(darkByDepthGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "biotype"]))
    darkByDepthONT_hg38_Alt = as.data.frame(table(darkByDepthGenePercent$HG38_Alt$ONT[which(darkByDepthGenePercent$HG38_Alt$ONT$perc_total >= perc), "biotype"]))
    darkByDepthPacBio_hg38_Alt = as.data.frame(table(darkByDepthGenePercent$HG38_Alt$PacBio[which(darkByDepthGenePercent$HG38_Alt$PacBio$perc_total >= perc), "biotype"]))
    
    darkByDepthIllumina100_chm13$Reference = rep("CHM13", nrow(darkByDepthIllumina100_chm13))
    darkByDepthIllumina250_chm13$Reference = rep("CHM13", nrow(darkByDepthIllumina250_chm13))
    darkByDepthONT_chm13$Reference = rep("CHM13", nrow(darkByDepthONT_chm13))
    darkByDepthPacBio_chm13$Reference = rep("CHM13", nrow(darkByDepthPacBio_chm13))
    
    darkByDepthIllumina100_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkByDepthIllumina100_hg19_noAlt))
    darkByDepthIllumina250_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkByDepthIllumina250_hg19_noAlt))
    darkByDepthONT_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkByDepthONT_hg19_noAlt))
    darkByDepthPacBio_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkByDepthPacBio_hg19_noAlt))
    
    darkByDepthIllumina100_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkByDepthIllumina100_hg38_noAlt))
    darkByDepthIllumina250_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkByDepthIllumina250_hg38_noAlt))
    darkByDepthONT_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkByDepthONT_hg38_noAlt))
    darkByDepthPacBio_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkByDepthPacBio_hg38_noAlt))
    
    darkByDepthIllumina100_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkByDepthIllumina100_hg38_Alt))
    darkByDepthIllumina250_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkByDepthIllumina250_hg38_Alt))
    darkByDepthONT_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkByDepthONT_hg38_Alt))
    darkByDepthPacBio_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkByDepthPacBio_hg38_Alt))
    
    darkByDepthIllumina100_chm13$Platform = rep("Illumina100", nrow(darkByDepthIllumina100_chm13))
    darkByDepthIllumina250_chm13$Platform = rep("Illumina250", nrow(darkByDepthIllumina250_chm13))
    darkByDepthONT_chm13$Platform = rep("ONT", nrow(darkByDepthONT_chm13))
    darkByDepthPacBio_chm13$Platform = rep("PacBio", nrow(darkByDepthPacBio_chm13))
    
    darkByDepthIllumina100_hg19_noAlt$Platform = rep("Illumina100", nrow(darkByDepthIllumina100_hg19_noAlt))
    darkByDepthIllumina250_hg19_noAlt$Platform = rep("Illumina250", nrow(darkByDepthIllumina250_hg19_noAlt))
    darkByDepthONT_hg19_noAlt$Platform = rep("ONT", nrow(darkByDepthONT_hg19_noAlt))
    darkByDepthPacBio_hg19_noAlt$Platform = rep("PacBio", nrow(darkByDepthPacBio_hg19_noAlt))
    
    darkByDepthIllumina100_hg38_noAlt$Platform = rep("Illumina100", nrow(darkByDepthIllumina100_hg38_noAlt))
    darkByDepthIllumina250_hg38_noAlt$Platform = rep("Illumina250", nrow(darkByDepthIllumina250_hg38_noAlt))
    darkByDepthONT_hg38_noAlt$Platform = rep("ONT", nrow(darkByDepthONT_hg38_noAlt))
    darkByDepthPacBio_hg38_noAlt$Platform = rep("PacBio", nrow(darkByDepthPacBio_hg38_noAlt))
    
    darkByDepthIllumina100_hg38_Alt$Platform = rep("Illumina100", nrow(darkByDepthIllumina100_hg38_Alt))
    darkByDepthIllumina250_hg38_Alt$Platform = rep("Illumina250", nrow(darkByDepthIllumina250_hg38_Alt))
    darkByDepthONT_hg38_Alt$Platform = rep("ONT", nrow(darkByDepthONT_hg38_Alt))
    darkByDepthPacBio_hg38_Alt$Platform = rep("PacBio", nrow(darkByDepthPacBio_hg38_Alt))
    
    
    darkByDepthGenes = rbind(darkByDepthIllumina100_chm13, darkByDepthIllumina250_chm13, darkByDepthONT_chm13, darkByDepthPacBio_chm13, darkByDepthIllumina100_hg19_noAlt, darkByDepthIllumina250_hg19_noAlt, darkByDepthONT_hg19_noAlt, darkByDepthPacBio_hg19_noAlt, darkByDepthIllumina100_hg38_noAlt, darkByDepthIllumina250_hg38_noAlt, darkByDepthONT_hg38_noAlt, darkByDepthPacBio_hg38_noAlt, darkByDepthIllumina100_hg38_Alt, darkByDepthIllumina250_hg38_Alt, darkByDepthONT_hg38_Alt, darkByDepthPacBio_hg38_Alt)
    
    darkByDepthGenes$Platform = factor(darkByDepthGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    darkByDepthGenes$biotype = factor(darkByDepthGenes$biotype, levels = c("protein coding", "pseudogene", "lincRNA", "miRNA", "snRNA", "rRNA", "other"))
    darkByDepthGenes$Reference = factor(darkByDepthGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(darkByDepthGenes, aes(x=Platform, y=Freq, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw()  + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    fig = fig + facet_wrap( ~ biotype)
    ggplotly(fig)
    
  }
)


app %>% add_callback(
  output('Total-DarkByMapQType-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    darkByMapQGenes = data.frame(Platform=c(rep("Illumina100", 4), rep("Illumina250", 4), rep("ONT", 4), rep("PacBio", 4)), 
                                 Reference=rep(c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"), 4), 
                                 numGene=c(length(unlist(darkByMapQGenePercent$HG19_noAlt$Illumina100[which(darkByMapQGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG38_noAlt$Illumina100[which(darkByMapQGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG38_Alt$Illumina100[which(darkByMapQGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$CHM13$Illumina100[which(darkByMapQGenePercent$CHM13$Illumina100$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG19_noAlt$Illumina250[which(darkByMapQGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG38_noAlt$Illumina250[which(darkByMapQGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG38_Alt$Illumina250[which(darkByMapQGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$CHM13$Illumina250[which(darkByMapQGenePercent$CHM13$Illumina250$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG19_noAlt$ONT[which(darkByMapQGenePercent$HG19_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG38_noAlt$ONT[which(darkByMapQGenePercent$HG38_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG38_Alt$ONT[which(darkByMapQGenePercent$HG38_Alt$ONT$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$CHM13$ONT[which(darkByMapQGenePercent$CHM13$ONT$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG19_noAlt$PacBio[which(darkByMapQGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG38_noAlt$PacBio[which(darkByMapQGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$HG38_Alt$PacBio[which(darkByMapQGenePercent$HG38_Alt$PacBio$perc_total >= perc), "gene_name"])), 
                                           length(unlist(darkByMapQGenePercent$CHM13$PacBio[which(darkByMapQGenePercent$CHM13$PacBio$perc_total >= perc), "gene_name"]))))
    
    darkByMapQGenes$Platform = factor(darkByMapQGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    darkByMapQGenes$Reference = factor(darkByMapQGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(darkByMapQGenes, aes(x=Platform, y=numGene, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    
    
    #pdf(paste0("Figures/DbM_", perc, ".pdf"))
    #print(fig)
    #dev.off()
    
    
    ggplotly(fig)
    
  }
)

app %>% add_callback(
  output('Biotype-DarkByMapQType-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    darkByMapQIllumina100_chm13 = as.data.frame(table(darkByMapQGenePercent$CHM13$Illumina100[which(darkByMapQGenePercent$CHM13$Illumina100$perc_total >= perc), "biotype"]))
    darkByMapQIllumina250_chm13 = as.data.frame(table(darkByMapQGenePercent$CHM13$Illumina250[which(darkByMapQGenePercent$CHM13$Illumina250$perc_total >= perc), "biotype"]))
    darkByMapQONT_chm13 = as.data.frame(table(darkByMapQGenePercent$CHM13$ONT[which(darkByMapQGenePercent$CHM13$ONT$perc_total >= perc), "biotype"]))
    darkByMapQPacBio_chm13 = as.data.frame(table(darkByMapQGenePercent$CHM13$PacBio[which(darkByMapQGenePercent$CHM13$PacBio$perc_total >= perc), "biotype"]))
    
    darkByMapQIllumina100_hg19_noAlt = as.data.frame(table(darkByMapQGenePercent$HG19_noAlt$Illumina100[which(darkByMapQGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "biotype"]))
    darkByMapQIllumina250_hg19_noAlt = as.data.frame(table(darkByMapQGenePercent$HG19_noAlt$Illumina250[which(darkByMapQGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "biotype"]))
    darkByMapQONT_hg19_noAlt = as.data.frame(table(darkByMapQGenePercent$HG19_noAlt$ONT[which(darkByMapQGenePercent$HG19_noAlt$ONT$perc_total >= perc), "biotype"]))
    darkByMapQPacBio_hg19_noAlt = as.data.frame(table(darkByMapQGenePercent$HG19_noAlt$PacBio[which(darkByMapQGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "biotype"]))
    
    darkByMapQIllumina100_hg38_noAlt = as.data.frame(table(darkByMapQGenePercent$HG38_noAlt$Illumina100[which(darkByMapQGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "biotype"]))
    darkByMapQIllumina250_hg38_noAlt = as.data.frame(table(darkByMapQGenePercent$HG38_noAlt$Illumina250[which(darkByMapQGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "biotype"]))
    darkByMapQONT_hg38_noAlt = as.data.frame(table(darkByMapQGenePercent$HG38_noAlt$ONT[which(darkByMapQGenePercent$HG38_noAlt$ONT$perc_total >= perc), "biotype"]))
    darkByMapQPacBio_hg38_noAlt = as.data.frame(table(darkByMapQGenePercent$HG38_noAlt$PacBio[which(darkByMapQGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "biotype"]))
    
    darkByMapQIllumina100_hg38_Alt = as.data.frame(table(darkByMapQGenePercent$HG38_Alt$Illumina100[which(darkByMapQGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "biotype"]))
    darkByMapQIllumina250_hg38_Alt = as.data.frame(table(darkByMapQGenePercent$HG38_Alt$Illumina250[which(darkByMapQGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "biotype"]))
    darkByMapQONT_hg38_Alt = as.data.frame(table(darkByMapQGenePercent$HG38_Alt$ONT[which(darkByMapQGenePercent$HG38_Alt$ONT$perc_total >= perc), "biotype"]))
    darkByMapQPacBio_hg38_Alt = as.data.frame(table(darkByMapQGenePercent$HG38_Alt$PacBio[which(darkByMapQGenePercent$HG38_Alt$PacBio$perc_total >= perc), "biotype"]))
    
    darkByMapQIllumina100_chm13$Reference = rep("CHM13", nrow(darkByMapQIllumina100_chm13))
    darkByMapQIllumina250_chm13$Reference = rep("CHM13", nrow(darkByMapQIllumina250_chm13))
    darkByMapQONT_chm13$Reference = rep("CHM13", nrow(darkByMapQONT_chm13))
    darkByMapQPacBio_chm13$Reference = rep("CHM13", nrow(darkByMapQPacBio_chm13))
    
    darkByMapQIllumina100_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkByMapQIllumina100_hg19_noAlt))
    darkByMapQIllumina250_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkByMapQIllumina250_hg19_noAlt))
    darkByMapQONT_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkByMapQONT_hg19_noAlt))
    darkByMapQPacBio_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(darkByMapQPacBio_hg19_noAlt))
    
    darkByMapQIllumina100_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkByMapQIllumina100_hg38_noAlt))
    darkByMapQIllumina250_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkByMapQIllumina250_hg38_noAlt))
    darkByMapQONT_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkByMapQONT_hg38_noAlt))
    darkByMapQPacBio_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(darkByMapQPacBio_hg38_noAlt))
    
    darkByMapQIllumina100_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkByMapQIllumina100_hg38_Alt))
    darkByMapQIllumina250_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkByMapQIllumina250_hg38_Alt))
    darkByMapQONT_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkByMapQONT_hg38_Alt))
    darkByMapQPacBio_hg38_Alt$Reference = rep("HG38_Alt", nrow(darkByMapQPacBio_hg38_Alt))
    
    darkByMapQIllumina100_chm13$Platform = rep("Illumina100", nrow(darkByMapQIllumina100_chm13))
    darkByMapQIllumina250_chm13$Platform = rep("Illumina250", nrow(darkByMapQIllumina250_chm13))
    darkByMapQONT_chm13$Platform = rep("ONT", nrow(darkByMapQONT_chm13))
    darkByMapQPacBio_chm13$Platform = rep("PacBio", nrow(darkByMapQPacBio_chm13))
    
    darkByMapQIllumina100_hg19_noAlt$Platform = rep("Illumina100", nrow(darkByMapQIllumina100_hg19_noAlt))
    darkByMapQIllumina250_hg19_noAlt$Platform = rep("Illumina250", nrow(darkByMapQIllumina250_hg19_noAlt))
    darkByMapQONT_hg19_noAlt$Platform = rep("ONT", nrow(darkByMapQONT_hg19_noAlt))
    darkByMapQPacBio_hg19_noAlt$Platform = rep("PacBio", nrow(darkByMapQPacBio_hg19_noAlt))
    
    darkByMapQIllumina100_hg38_noAlt$Platform = rep("Illumina100", nrow(darkByMapQIllumina100_hg38_noAlt))
    darkByMapQIllumina250_hg38_noAlt$Platform = rep("Illumina250", nrow(darkByMapQIllumina250_hg38_noAlt))
    darkByMapQONT_hg38_noAlt$Platform = rep("ONT", nrow(darkByMapQONT_hg38_noAlt))
    darkByMapQPacBio_hg38_noAlt$Platform = rep("PacBio", nrow(darkByMapQPacBio_hg38_noAlt))
    
    darkByMapQIllumina100_hg38_Alt$Platform = rep("Illumina100", nrow(darkByMapQIllumina100_hg38_Alt))
    darkByMapQIllumina250_hg38_Alt$Platform = rep("Illumina250", nrow(darkByMapQIllumina250_hg38_Alt))
    darkByMapQONT_hg38_Alt$Platform = rep("ONT", nrow(darkByMapQONT_hg38_Alt))
    darkByMapQPacBio_hg38_Alt$Platform = rep("PacBio", nrow(darkByMapQPacBio_hg38_Alt))
    
    
    darkByMapQGenes = rbind(darkByMapQIllumina100_chm13, darkByMapQIllumina250_chm13, darkByMapQONT_chm13, darkByMapQPacBio_chm13, darkByMapQIllumina100_hg19_noAlt, darkByMapQIllumina250_hg19_noAlt, darkByMapQONT_hg19_noAlt, darkByMapQPacBio_hg19_noAlt, darkByMapQIllumina100_hg38_noAlt, darkByMapQIllumina250_hg38_noAlt, darkByMapQONT_hg38_noAlt, darkByMapQPacBio_hg38_noAlt, darkByMapQIllumina100_hg38_Alt, darkByMapQIllumina250_hg38_Alt, darkByMapQONT_hg38_Alt, darkByMapQPacBio_hg38_Alt)
    
    darkByMapQGenes$Platform = factor(darkByMapQGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    darkByMapQGenes$biotype = factor(darkByMapQGenes$biotype, levels = c("protein coding", "pseudogene", "lincRNA", "miRNA", "snRNA", "rRNA", "other"))
    darkByMapQGenes$Reference = factor(darkByMapQGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(darkByMapQGenes, aes(x=Platform, y=Freq, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw()  + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    fig = fig + facet_wrap( ~ biotype)
    ggplotly(fig)
    
  }
)

app %>% add_callback(
  output('Total-CamoType-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    CamoGenes = data.frame(Platform=c(rep("Illumina100", 4), rep("Illumina250", 4), rep("ONT", 4), rep("PacBio", 4)), 
                           Reference=rep(c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"), 4), 
                           numGene=c(length(unlist(CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG38_noAlt$Illumina100[which(CamoGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG38_Alt$Illumina100[which(CamoGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$CHM13$Illumina100[which(CamoGenePercent$CHM13$Illumina100$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG19_noAlt$Illumina250[which(CamoGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG38_noAlt$Illumina250[which(CamoGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG38_Alt$Illumina250[which(CamoGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$CHM13$Illumina250[which(CamoGenePercent$CHM13$Illumina250$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG19_noAlt$ONT[which(CamoGenePercent$HG19_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG38_noAlt$ONT[which(CamoGenePercent$HG38_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG38_Alt$ONT[which(CamoGenePercent$HG38_Alt$ONT$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$CHM13$ONT[which(CamoGenePercent$CHM13$ONT$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG19_noAlt$PacBio[which(CamoGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG38_noAlt$PacBio[which(CamoGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$HG38_Alt$PacBio[which(CamoGenePercent$HG38_Alt$PacBio$perc_total >= perc), "gene_name"])), 
                                     length(unlist(CamoGenePercent$CHM13$PacBio[which(CamoGenePercent$CHM13$PacBio$perc_total >= perc), "gene_name"]))))
    
    
    CamoGenes$Platform = factor(CamoGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    CamoGenes$Reference = factor(CamoGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(CamoGenes, aes(x=Platform, y=numGene, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    
    #pdf(paste0("Figures/Camo_", perc, ".pdf"))
    #print(fig)
    #dev.off()
    
    
    ggplotly(fig)
    
  }
)

app %>% add_callback(
  output('Biotype-CamoType-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    camoIllumina100_chm13 = as.data.frame(table(CamoGenePercent$CHM13$Illumina100[which(CamoGenePercent$CHM13$Illumina100$perc_total >= perc), "biotype"]))
    camoIllumina250_chm13 = as.data.frame(table(CamoGenePercent$CHM13$Illumina250[which(CamoGenePercent$CHM13$Illumina250$perc_total >= perc), "biotype"]))
    camoONT_chm13 = as.data.frame(table(CamoGenePercent$CHM13$ONT[which(CamoGenePercent$CHM13$ONT$perc_total >= perc), "biotype"]))
    camoPacBio_chm13 = as.data.frame(table(CamoGenePercent$CHM13$PacBio[which(CamoGenePercent$CHM13$PacBio$perc_total >= perc), "biotype"]))
    
    camoIllumina100_hg19_noAlt = as.data.frame(table(CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "biotype"]))
    camoIllumina250_hg19_noAlt = as.data.frame(table(CamoGenePercent$HG19_noAlt$Illumina250[which(CamoGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "biotype"]))
    camoONT_hg19_noAlt = as.data.frame(table(CamoGenePercent$HG19_noAlt$ONT[which(CamoGenePercent$HG19_noAlt$ONT$perc_total >= perc), "biotype"]))
    camoPacBio_hg19_noAlt = as.data.frame(table(CamoGenePercent$HG19_noAlt$PacBio[which(CamoGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "biotype"]))
    
    camoIllumina100_hg38_noAlt = as.data.frame(table(CamoGenePercent$HG38_noAlt$Illumina100[which(CamoGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "biotype"]))
    camoIllumina250_hg38_noAlt = as.data.frame(table(CamoGenePercent$HG38_noAlt$Illumina250[which(CamoGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "biotype"]))
    camoONT_hg38_noAlt = as.data.frame(table(CamoGenePercent$HG38_noAlt$ONT[which(CamoGenePercent$HG38_noAlt$ONT$perc_total >= perc), "biotype"]))
    camoPacBio_hg38_noAlt = as.data.frame(table(CamoGenePercent$HG38_noAlt$PacBio[which(CamoGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "biotype"]))
    
    camoIllumina100_hg38_Alt = as.data.frame(table(CamoGenePercent$HG38_Alt$Illumina100[which(CamoGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "biotype"]))
    camoIllumina250_hg38_Alt = as.data.frame(table(CamoGenePercent$HG38_Alt$Illumina250[which(CamoGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "biotype"]))
    camoONT_hg38_Alt = as.data.frame(table(CamoGenePercent$HG38_Alt$ONT[which(CamoGenePercent$HG38_Alt$ONT$perc_total >= perc), "biotype"]))
    camoPacBio_hg38_Alt = as.data.frame(table(CamoGenePercent$HG38_Alt$PacBio[which(CamoGenePercent$HG38_Alt$PacBio$perc_total >= perc), "biotype"]))
    
    camoIllumina100_chm13$Reference = rep("CHM13", nrow(camoIllumina100_chm13))
    camoIllumina250_chm13$Reference = rep("CHM13", nrow(camoIllumina250_chm13))
    camoONT_chm13$Reference = rep("CHM13", nrow(camoONT_chm13))
    camoPacBio_chm13$Reference = rep("CHM13", nrow(camoPacBio_chm13))
    
    camoIllumina100_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(camoIllumina100_hg19_noAlt))
    camoIllumina250_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(camoIllumina250_hg19_noAlt))
    camoONT_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(camoONT_hg19_noAlt))
    camoPacBio_hg19_noAlt$Reference = rep("HG19_noAlt", nrow(camoPacBio_hg19_noAlt))
    
    camoIllumina100_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(camoIllumina100_hg38_noAlt))
    camoIllumina250_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(camoIllumina250_hg38_noAlt))
    camoONT_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(camoONT_hg38_noAlt))
    camoPacBio_hg38_noAlt$Reference = rep("HG38_noAlt", nrow(camoPacBio_hg38_noAlt))
    
    camoIllumina100_hg38_Alt$Reference = rep("HG38_Alt", nrow(camoIllumina100_hg38_Alt))
    camoIllumina250_hg38_Alt$Reference = rep("HG38_Alt", nrow(camoIllumina250_hg38_Alt))
    camoONT_hg38_Alt$Reference = rep("HG38_Alt", nrow(camoONT_hg38_Alt))
    camoPacBio_hg38_Alt$Reference = rep("HG38_Alt", nrow(camoPacBio_hg38_Alt))
    
    camoIllumina100_chm13$Platform = rep("Illumina100", nrow(camoIllumina100_chm13))
    camoIllumina250_chm13$Platform = rep("Illumina250", nrow(camoIllumina250_chm13))
    camoONT_chm13$Platform = rep("ONT", nrow(camoONT_chm13))
    camoPacBio_chm13$Platform = rep("PacBio", nrow(camoPacBio_chm13))
    
    camoIllumina100_hg19_noAlt$Platform = rep("Illumina100", nrow(camoIllumina100_hg19_noAlt))
    camoIllumina250_hg19_noAlt$Platform = rep("Illumina250", nrow(camoIllumina250_hg19_noAlt))
    camoONT_hg19_noAlt$Platform = rep("ONT", nrow(camoONT_hg19_noAlt))
    camoPacBio_hg19_noAlt$Platform = rep("PacBio", nrow(camoPacBio_hg19_noAlt))
    
    camoIllumina100_hg38_noAlt$Platform = rep("Illumina100", nrow(camoIllumina100_hg38_noAlt))
    camoIllumina250_hg38_noAlt$Platform = rep("Illumina250", nrow(camoIllumina250_hg38_noAlt))
    camoONT_hg38_noAlt$Platform = rep("ONT", nrow(camoONT_hg38_noAlt))
    camoPacBio_hg38_noAlt$Platform = rep("PacBio", nrow(camoPacBio_hg38_noAlt))
    
    camoIllumina100_hg38_Alt$Platform = rep("Illumina100", nrow(camoIllumina100_hg38_Alt))
    camoIllumina250_hg38_Alt$Platform = rep("Illumina250", nrow(camoIllumina250_hg38_Alt))
    camoONT_hg38_Alt$Platform = rep("ONT", nrow(camoONT_hg38_Alt))
    camoPacBio_hg38_Alt$Platform = rep("PacBio", nrow(camoPacBio_hg38_Alt))
    
    
    camoGenes = rbind(camoIllumina100_chm13, camoIllumina250_chm13, camoONT_chm13, camoPacBio_chm13, camoIllumina100_hg19_noAlt, camoIllumina250_hg19_noAlt, camoONT_hg19_noAlt, camoPacBio_hg19_noAlt, camoIllumina100_hg38_noAlt, camoIllumina250_hg38_noAlt, camoONT_hg38_noAlt, camoPacBio_hg38_noAlt, camoIllumina100_hg38_Alt, camoIllumina250_hg38_Alt, camoONT_hg38_Alt, camoPacBio_hg38_Alt)
    
    camoGenes$Platform = factor(camoGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    camoGenes$biotype = factor(camoGenes$biotype, levels = c("protein coding", "pseudogene", "lincRNA", "miRNA", "snRNA", "rRNA", "other"))
    camoGenes$Reference = factor(camoGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    
    fig = ggplot(camoGenes, aes(x=Platform, y=Freq, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw()  + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Number of Genes") + xlab("")
    
    
    fig = fig + facet_wrap( ~ biotype)
    
    #pdf(paste0("Figures/Camo_Biotype_", perc, ".pdf"))
    #print(fig)
    #dev.off()
    
    ggplotly(fig)
    
  }
)

app %>% add_callback(
  output('PercentCamoOfMapQ-graphic', 'figure'),
  list(
    input('percentDark', 'value')
  ),
  function(perc) {
    CamoGenes = data.frame(Platform=c(rep("Illumina100", 4), rep("Illumina250", 4), rep("ONT", 4), rep("PacBio", 4)), Reference=rep(c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"), 4), numGene=c(length(CamoGenePercent$HG19_noAlt$Illumina100[which(CamoGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG38_noAlt$Illumina100[which(CamoGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG38_Alt$Illumina100[which(CamoGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "gene_name"]), length(CamoGenePercent$CHM13$Illumina100[which(CamoGenePercent$CHM13$Illumina100$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG19_noAlt$Illumina250[which(CamoGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG38_noAlt$Illumina250[which(CamoGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG38_Alt$Illumina250[which(CamoGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "gene_name"]), length(CamoGenePercent$CHM13$Illumina250[which(CamoGenePercent$CHM13$Illumina250$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG19_noAlt$ONT[which(CamoGenePercent$HG19_noAlt$ONT$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG38_noAlt$ONT[which(CamoGenePercent$HG38_noAlt$ONT$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG38_Alt$ONT[which(CamoGenePercent$HG38_Alt$ONT$perc_total >= perc), "gene_name"]), length(CamoGenePercent$CHM13$ONT[which(CamoGenePercent$CHM13$ONT$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG19_noAlt$PacBio[which(CamoGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG38_noAlt$PacBio[which(CamoGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "gene_name"]), length(CamoGenePercent$HG38_Alt$PacBio[which(CamoGenePercent$HG38_Alt$PacBio$perc_total >= perc), "gene_name"]), length(CamoGenePercent$CHM13$PacBio[which(CamoGenePercent$CHM13$PacBio$perc_total >= perc), "gene_name"])))
    CamoGenes$MapQNumGene = c(length(unlist(darkByMapQGenePercent$HG19_noAlt$Illumina100[which(darkByMapQGenePercent$HG19_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG38_noAlt$Illumina100[which(darkByMapQGenePercent$HG38_noAlt$Illumina100$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG38_Alt$Illumina100[which(darkByMapQGenePercent$HG38_Alt$Illumina100$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$CHM13$Illumina100[which(darkByMapQGenePercent$CHM13$Illumina100$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG19_noAlt$Illumina250[which(darkByMapQGenePercent$HG19_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG38_noAlt$Illumina250[which(darkByMapQGenePercent$HG38_noAlt$Illumina250$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG38_Alt$Illumina250[which(darkByMapQGenePercent$HG38_Alt$Illumina250$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$CHM13$Illumina250[which(darkByMapQGenePercent$CHM13$Illumina250$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG19_noAlt$ONT[which(darkByMapQGenePercent$HG19_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG38_noAlt$ONT[which(darkByMapQGenePercent$HG38_noAlt$ONT$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG38_Alt$ONT[which(darkByMapQGenePercent$HG38_Alt$ONT$perc_total >= perc), "gene_name"])),
                              length(unlist(darkByMapQGenePercent$CHM13$ONT[which(darkByMapQGenePercent$CHM13$ONT$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG19_noAlt$PacBio[which(darkByMapQGenePercent$HG19_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG38_noAlt$PacBio[which(darkByMapQGenePercent$HG38_noAlt$PacBio$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$HG38_Alt$PacBio[which(darkByMapQGenePercent$HG38_Alt$PacBio$perc_total >= perc), "gene_name"])), 
                              length(unlist(darkByMapQGenePercent$CHM13$PacBio[which(darkByMapQGenePercent$CHM13$PacBio$perc_total >= perc), "gene_name"])))
    CamoGenes$Reference = factor(CamoGenes$Reference, levels=c("HG19_noAlt", "HG38_noAlt", "HG38_Alt", "CHM13"))
    CamoGenes$Percent = CamoGenes$numGene/CamoGenes$MapQNumGene * 100
    CamoGenes$Platform = factor(CamoGenes$Platform, levels = c("Illumina100", "Illumina250", "PacBio", "ONT"))
    
    fig = ggplot(CamoGenes, aes(x=Platform, y=Percent, fill=Reference)) + geom_bar(stat="identity", position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1)) + ylab("Percent of MapQ Genes That are Camo") + xlab("")
    
    #pdf(paste0("Figures/CamoPercOfMapQ_", perc, ".pdf"))
    #print(fig)
    #dev.off()
    
    ggplotly(fig)
    
  }

)


app %>% add_callback(
  output(id = "Nucleotide-regions-datatable", property = "data"),
  list(
    input('Reference-dropdown', 'value'),
    input('Platform', 'value')
  ),
  function(reference, platform) {
    return(df_to_list(nucsAndRegions[which(nucsAndRegions$Platform == platform & nucsAndRegions$Reference == reference),]))
  }
)



# Run the app
app %>% run_app()
#app %>% run_app(host = '0.0.0.0', port = as.numeric(Sys.getenv('PORT')))







