library(data.table)

chm13_ONT_depth = read.table("UpdatedSamples_09_16_2024/CHM13.1MbWindow.ONT.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
chm13_ONT_mapq = read.table("UpdatedSamples_09_16_2024/CHM13.1MbWindow.ONT.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(chm13_ONT_depth) = paste0(chm13_ONT_depth$V1,":",chm13_ONT_depth$V2,"-",chm13_ONT_depth$V3)
rownames(chm13_ONT_mapq) = paste0(chm13_ONT_mapq$V1,":",chm13_ONT_mapq$V2,"-",chm13_ONT_mapq$V3)
setDT(chm13_ONT_depth)
setDT(chm13_ONT_mapq)


chm13_PacBio_depth = read.table("UpdatedSamples_09_16_2024/CHM13.1MbWindow.PacBio.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
chm13_PacBio_mapq = read.table("UpdatedSamples_09_16_2024/CHM13.1MbWindow.PacBio.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(chm13_PacBio_depth) = paste0(chm13_PacBio_depth$V1,":",chm13_PacBio_depth$V2,"-",chm13_PacBio_depth$V3)
rownames(chm13_PacBio_mapq) = paste0(chm13_PacBio_mapq$V1,":",chm13_PacBio_mapq$V2,"-",chm13_PacBio_mapq$V3)
setDT(chm13_PacBio_depth)
setDT(chm13_PacBio_mapq)

hg38_noAlt_ONT_depth = read.table("UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.ONT.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg38_noAlt_ONT_mapq = read.table("UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.ONT.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg38_noAlt_ONT_depth) = paste0(hg38_noAlt_ONT_depth$V1,":",hg38_noAlt_ONT_depth$V2,"-",hg38_noAlt_ONT_depth$V3)
rownames(hg38_noAlt_ONT_mapq) = paste0(hg38_noAlt_ONT_mapq$V1,":",hg38_noAlt_ONT_mapq$V2,"-",hg38_noAlt_ONT_mapq$V3)
setDT(hg38_noAlt_ONT_depth)
setDT(hg38_noAlt_ONT_mapq)

hg19_noAlt_ONT_depth = read.table("UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.ONT.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg19_noAlt_ONT_mapq = read.table("UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.ONT.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg19_noAlt_ONT_depth) = paste0(hg19_noAlt_ONT_depth$V1,":",hg19_noAlt_ONT_depth$V2,"-",hg19_noAlt_ONT_depth$V3)
rownames(hg19_noAlt_ONT_mapq) = paste0(hg19_noAlt_ONT_mapq$V1,":",hg19_noAlt_ONT_mapq$V2,"-",hg19_noAlt_ONT_mapq$V3)
setDT(hg19_noAlt_ONT_depth)
setDT(hg19_noAlt_ONT_mapq)

hg19_noAlt_PacBio_depth = read.table("UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.PacBio.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg19_noAlt_PacBio_mapq = read.table("UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.PacBio.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg19_noAlt_PacBio_depth) = paste0(hg19_noAlt_PacBio_depth$V1,":",hg19_noAlt_PacBio_depth$V2,"-",hg19_noAlt_PacBio_depth$V3)
rownames(hg19_noAlt_PacBio_mapq) = paste0(hg19_noAlt_PacBio_mapq$V1,":",hg19_noAlt_PacBio_mapq$V2,"-",hg19_noAlt_PacBio_mapq$V3)
setDT(hg19_noAlt_PacBio_depth)
setDT(hg19_noAlt_PacBio_mapq)





hg38_noAlt_PacBio_depth = read.table("UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.PacBio.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg38_noAlt_PacBio_mapq = read.table("UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.PacBio.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg38_noAlt_PacBio_depth) = paste0(hg38_noAlt_PacBio_depth$V1,":",hg38_noAlt_PacBio_depth$V2,"-",hg38_noAlt_PacBio_depth$V3)
rownames(hg38_noAlt_PacBio_mapq) = paste0(hg38_noAlt_PacBio_mapq$V1,":",hg38_noAlt_PacBio_mapq$V2,"-",hg38_noAlt_PacBio_mapq$V3)
setDT(hg38_noAlt_PacBio_depth)
setDT(hg38_noAlt_PacBio_mapq)

hg38_Alt_PacBio_depth = read.table("UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.PacBio.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg38_Alt_PacBio_mapq = read.table("UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.PacBio.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg38_Alt_PacBio_depth) = paste0(hg38_Alt_PacBio_depth$V1,":",hg38_Alt_PacBio_depth$V2,"-",hg38_Alt_PacBio_depth$V3)
rownames(hg38_Alt_PacBio_mapq) = paste0(hg38_Alt_PacBio_mapq$V1,":",hg38_Alt_PacBio_mapq$V2,"-",hg38_Alt_PacBio_mapq$V3)
setDT(hg38_Alt_PacBio_depth)
setDT(hg38_Alt_PacBio_mapq)

#
# Illumina250

chm13_Illumina250_depth = read.table("UpdatedSamples_09_16_2024/CHM13.1MbWindow.Illumina250.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
chm13_Illumina250_mapq = read.table("UpdatedSamples_09_16_2024/CHM13.1MbWindow.Illumina250.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(chm13_Illumina250_depth) = paste0(chm13_Illumina250_depth$V1,":",chm13_Illumina250_depth$V2,"-",chm13_Illumina250_depth$V3)
rownames(chm13_Illumina250_mapq) = paste0(chm13_Illumina250_mapq$V1,":",chm13_Illumina250_mapq$V2,"-",chm13_Illumina250_mapq$V3)
setDT(chm13_Illumina250_depth)
setDT(chm13_Illumina250_mapq)


hg38_Alt_Illumina250_depth = read.table("UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.Illumina250.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg38_Alt_Illumina250_mapq = read.table("UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.Illumina250.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg38_Alt_Illumina250_depth) = paste0(hg38_Alt_Illumina250_depth$V1,":",hg38_Alt_Illumina250_depth$V2,"-",hg38_Alt_Illumina250_depth$V3)
rownames(hg38_Alt_Illumina250_mapq) = paste0(hg38_Alt_Illumina250_mapq$V1,":",hg38_Alt_Illumina250_mapq$V2,"-",hg38_Alt_Illumina250_mapq$V3)
setDT(hg38_Alt_Illumina250_depth)
setDT(hg38_Alt_Illumina250_mapq)

hg38_noAlt_Illumina250_depth = read.table("UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.Illumina250.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg38_noAlt_Illumina250_mapq = read.table("UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.Illumina250.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg38_noAlt_Illumina250_depth) = paste0(hg38_noAlt_Illumina250_depth$V1,":",hg38_noAlt_Illumina250_depth$V2,"-",hg38_noAlt_Illumina250_depth$V3)
rownames(hg38_noAlt_Illumina250_mapq) = paste0(hg38_noAlt_Illumina250_mapq$V1,":",hg38_noAlt_Illumina250_mapq$V2,"-",hg38_noAlt_Illumina250_mapq$V3)
setDT(hg38_noAlt_Illumina250_depth)
setDT(hg38_noAlt_Illumina250_mapq)

hg19_noAlt_Illumina250_depth = read.table("UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.Illumina250.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg19_noAlt_Illumina250_mapq = read.table("UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.Illumina250.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg19_noAlt_Illumina250_depth) = paste0(hg19_noAlt_Illumina250_depth$V1,":",hg19_noAlt_Illumina250_depth$V2,"-",hg19_noAlt_Illumina250_depth$V3)
rownames(hg19_noAlt_Illumina250_mapq) = paste0(hg19_noAlt_Illumina250_mapq$V1,":",hg19_noAlt_Illumina250_mapq$V2,"-",hg19_noAlt_Illumina250_mapq$V3)
setDT(hg19_noAlt_Illumina250_depth)
setDT(hg19_noAlt_Illumina250_mapq)


# Original ADSP Illumina 100
hg19_noAlt_Illumina100_depth = read.table("UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.Illumina100.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg19_noAlt_Illumina100_mapq = read.table("UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.Illumina100.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg19_noAlt_Illumina100_depth) = paste0(hg19_noAlt_Illumina100_depth$V1,":",hg19_noAlt_Illumina100_depth$V2,"-",hg19_noAlt_Illumina100_depth$V3)
rownames(hg19_noAlt_Illumina100_mapq) = paste0(hg19_noAlt_Illumina100_mapq$V1,":",hg19_noAlt_Illumina100_mapq$V2,"-",hg19_noAlt_Illumina100_mapq$V3)
setDT(hg19_noAlt_Illumina100_depth)
setDT(hg19_noAlt_Illumina100_mapq)

hg38_Alt_Illumina100_depth = read.table("UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.Illumina100.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg38_Alt_Illumina100_mapq = read.table("UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.Illumina100.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg38_Alt_Illumina100_depth) = paste0(hg38_Alt_Illumina100_depth$V1,":",hg38_Alt_Illumina100_depth$V2,"-",hg38_Alt_Illumina100_depth$V3)
rownames(hg38_Alt_Illumina100_mapq) = paste0(hg38_Alt_Illumina100_mapq$V1,":",hg38_Alt_Illumina100_mapq$V2,"-",hg38_Alt_Illumina100_mapq$V3)
setDT(hg38_Alt_Illumina100_depth)
setDT(hg38_Alt_Illumina100_mapq)


hg38_noAlt_Illumina100_depth = read.table("UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.Illumina100.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg38_noAlt_Illumina100_mapq = read.table("UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.Illumina100.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg38_noAlt_Illumina100_depth) = paste0(hg38_noAlt_Illumina100_depth$V1,":",hg38_noAlt_Illumina100_depth$V2,"-",hg38_noAlt_Illumina100_depth$V3)
rownames(hg38_noAlt_Illumina100_mapq) = paste0(hg38_noAlt_Illumina100_mapq$V1,":",hg38_noAlt_Illumina100_mapq$V2,"-",hg38_noAlt_Illumina100_mapq$V3)
setDT(hg38_noAlt_Illumina100_depth)
setDT(hg38_noAlt_Illumina100_mapq)

chm13_Illumina100_depth = read.table("UpdatedSamples_09_16_2024/CHM13.1MbWindow.Illumina100.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
chm13_Illumina100_mapq = read.table("UpdatedSamples_09_16_2024/CHM13.1MbWindow.Illumina100.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(chm13_Illumina100_depth) = paste0(chm13_Illumina100_depth$V1,":",chm13_Illumina100_depth$V2,"-",chm13_Illumina100_depth$V3)
rownames(chm13_Illumina100_mapq) = paste0(chm13_Illumina100_mapq$V1,":",chm13_Illumina100_mapq$V2,"-",chm13_Illumina100_mapq$V3)
setDT(chm13_Illumina100_depth)
setDT(chm13_Illumina100_mapq)



hg38_Alt_ONT_depth = read.table("UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.ONT.DepthByDark.bed", header=F,sep="\t", stringsAsFactors=F)
hg38_Alt_ONT_mapq = read.table("UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.ONT.DepthByMapQ.bed", header=F,sep="\t", stringsAsFactors=F)
rownames(hg38_Alt_ONT_depth) = paste0(hg38_Alt_ONT_depth$V1,":",hg38_Alt_ONT_depth$V2,"-",hg38_Alt_ONT_depth$V3)
rownames(hg38_Alt_ONT_mapq) = paste0(hg38_Alt_ONT_mapq$V1,":",hg38_Alt_ONT_mapq$V2,"-",hg38_Alt_ONT_mapq$V3)
setDT(hg38_Alt_ONT_depth)
setDT(hg38_Alt_ONT_mapq)

print("Merging")

mergedCHM13 = chm13_ONT_depth[,1:3]
mergedCHM13_Percent = chm13_ONT_depth[,1:3]
if(identical(rownames(chm13_ONT_depth), rownames(chm13_ONT_mapq)) & identical(rownames(chm13_ONT_depth), rownames(chm13_PacBio_mapq)) & identical(rownames(chm13_PacBio_depth), rownames(chm13_PacBio_mapq)) ){
	mergedCHM13 = cbind(mergedCHM13, chm13_ONT_depth$V4, chm13_ONT_mapq$V4, chm13_PacBio_depth$V4, chm13_PacBio_mapq$V4, chm13_Illumina250_depth$V4, chm13_Illumina250_mapq$V4, chm13_Illumina100_depth$V4, chm13_Illumina100_mapq$V4)
	mergedCHM13_Percent = cbind(mergedCHM13_Percent, chm13_ONT_depth$V4/1000000*100, chm13_ONT_mapq$V4/1000000*100, chm13_PacBio_depth$V4/1000000*100, chm13_PacBio_mapq$V4/1000000*100, chm13_Illumina250_depth$V4/1000000*100, chm13_Illumina250_mapq$V4/1000000*100, chm13_Illumina100_depth$V4/1000000*100, chm13_Illumina100_mapq$V4/1000000/100)
}
colnames(mergedCHM13) = c("Chr", "Start", "End", "ONT_Depth", "ONT_MapQ", "PacBio_Depth", "PacBio_MapQ", "Illumina250_Depth", "Illumina250_MapQ", "Illumina100_Depth", "Illumina100_MapQ")

print("CHM13 merge done")

mergedHG38_Alt = hg38_Alt_ONT_depth[,1:3]
mergedHG38_Alt_Percent = hg38_Alt_ONT_depth[,1:3]
if(identical(rownames(hg38_Alt_ONT_depth), rownames(hg38_Alt_ONT_mapq)) ){
	mergedHG38_Alt = cbind(mergedHG38_Alt, hg38_Alt_ONT_depth$V4, hg38_Alt_ONT_mapq$V4, hg38_Alt_Illumina100_depth$V4, hg38_Alt_Illumina100_mapq$V4, hg38_Alt_Illumina250_depth$V4, hg38_Alt_Illumina250_mapq$V4, hg38_Alt_PacBio_depth$V4, hg38_Alt_PacBio_mapq$V4)
	mergedHG38_Alt_Percent = cbind(mergedHG38_Alt, hg38_Alt_ONT_depth$V4/1000000*100, hg38_Alt_ONT_mapq$V4/1000000*100, hg38_Alt_Illumina100_depth$V4/1000000*100, hg38_Alt_Illumina100_mapq$V4/1000000*100, hg38_Alt_Illumina250_depth$V4/1000000*100, hg38_Alt_Illumina250_mapq$V4/1000000*100, hg38_Alt_PacBio_depth$V4/1000000*100, hg38_Alt_PacBio_mapq$V4/1000000*100)
}
colnames(mergedHG38_Alt) = c("Chr", "Start", "End", "ONT_Depth", "ONT_MapQ", "Illumina100_Depth", "Illumina100_MapQ", "Illumina250_Depth", "Illumina250_MapQ", "PacBio_Depth", "PacBio_MapQ")


mergedHG38_noAlt = hg38_noAlt_ONT_depth[,1:3]
mergedHG38_noAlt_Percent = hg38_noAlt_ONT_depth[,1:3]
if(identical(rownames(hg38_noAlt_ONT_depth), rownames(hg38_noAlt_ONT_mapq)) & identical(rownames(hg38_noAlt_ONT_mapq), rownames(hg38_noAlt_PacBio_mapq)) & identical(rownames(hg38_noAlt_PacBio_mapq), rownames(hg38_noAlt_PacBio_depth)) ){
	mergedHG38_noAlt = cbind(mergedHG38_noAlt, hg38_noAlt_ONT_depth$V4, hg38_noAlt_ONT_mapq$V4, hg38_noAlt_PacBio_depth$V4, hg38_noAlt_PacBio_mapq$V4, hg38_noAlt_Illumina250_depth$V4, hg38_noAlt_Illumina250_mapq$V4, hg38_noAlt_Illumina100_depth$V4, hg38_noAlt_Illumina100_mapq$V4)
	mergedHG38_noAlt_Percent = cbind(mergedHG38_noAlt, hg38_noAlt_ONT_depth$V4/1000000*100, hg38_noAlt_ONT_mapq$V4/1000000*100, hg38_noAlt_PacBio_depth$V4/1000000*100, hg38_noAlt_PacBio_mapq$V4/1000000*100, hg38_noAlt_Illumina250_depth$V4/1000000*100, hg38_noAlt_Illumina250_mapq$V4/1000000*100, hg38_noAlt_Illumina100_depth$V4/1000000*100, hg38_noAlt_Illumina100_mapq$V4/1000000*100)
}
colnames(mergedHG38_noAlt) = c("Chr", "Start", "End", "ONT_Depth", "ONT_MapQ", "PacBio_Depth", "PacBio_MapQ", "Illumina250_Depth", "Illumina250_MapQ", "Illumina100_Depth", "Illumina100_MapQ")

print("HG38 merge done")

mergedHG19_noAlt = hg19_noAlt_Illumina100_depth[,1:3]
mergedHG19_noAlt_Percent = hg19_noAlt_Illumina100_depth[,1:3]
if(identical(rownames(hg19_noAlt_Illumina100_depth), rownames(hg19_noAlt_Illumina100_mapq)) ){
	mergedHG19_noAlt = cbind(mergedHG19_noAlt, hg19_noAlt_Illumina100_depth$V4, hg19_noAlt_Illumina100_mapq$V4, hg19_noAlt_ONT_depth$V4, hg19_noAlt_ONT_mapq$V4, hg19_noAlt_Illumina250_depth$V4, hg19_noAlt_Illumina250_mapq$V4, hg19_noAlt_PacBio_depth$V4, hg19_noAlt_PacBio_mapq$V4)
	mergedHG19_noAlt_Percent = cbind(mergedHG19_noAlt, hg19_noAlt_Illumina100_depth$V4/1000000*100, hg19_noAlt_Illumina100_mapq$V4/1000000*100, hg19_noAlt_ONT_depth$V4/1000000*100, hg19_noAlt_ONT_mapq$V4/1000000*100, hg19_noAlt_Illumina250_depth$V4/1000000*100, hg19_noAlt_Illumina250_mapq$V4/1000000*100, hg19_noAlt_PacBio_depth$V4/1000000*100, hg19_noAlt_PacBio_mapq$V4/1000000*100)
}
colnames(mergedHG19_noAlt) = c("Chr", "Start", "End", "Illumina100_Depth", "Illumina100_MapQ", "ONT_Depth", "ONT_MapQ", "Illumina250_Depth", "Illumina250_MapQ", "PacBio_Depth", "PacBio_MapQ")

print("HG19 merge done")


write.table(mergedHG19_noAlt, file="UpdatedSamples_09_16_2024/Merged_HG19_NoAlt_1MbWindow.bed", quote=F, sep="\t", row.names=F)
write.table(mergedHG38_noAlt, file="UpdatedSamples_09_16_2024/Merged_HG38_NoAlt_1MbWindow.bed", quote=F, sep="\t", row.names=F)
write.table(mergedHG38_Alt, file="UpdatedSamples_09_16_2024/Merged_HG38_Alt_1MbWindow.bed", quote=F, sep="\t", row.names=F)
write.table(mergedCHM13, file="UpdatedSamples_09_16_2024/Merged_CHM13_1MbWindow.bed", quote=F, sep="\t", row.names=F)

write.table(mergedHG19_noAlt_Percent, file="UpdatedSamples_09_16_2024/Merged_HG19_NoAlt_1MbWindow_Percent.bed", quote=F, sep="\t", row.names=F)
write.table(mergedHG38_noAlt_Percent, file="UpdatedSamples_09_16_2024/Merged_HG38_NoAlt_1MbWindow_Percent.bed", quote=F, sep="\t", row.names=F)
write.table(mergedHG38_Alt_Percent, file="UpdatedSamples_09_16_2024/Merged_HG38_Alt_1MbWindow_Percent.bed", quote=F, sep="\t", row.names=F)
write.table(mergedCHM13_Percent, file="UpdatedSamples_09_16_2024/Merged_CHM13_1MbWindow_Percent.bed", quote=F, sep="\t", row.names=F)



