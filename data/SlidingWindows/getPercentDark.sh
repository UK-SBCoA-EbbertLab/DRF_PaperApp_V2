
bedtools makewindows -g ../../referenceSizes/CHM13.chromSizes.txt -w 1000000 -s 1000000 > CHM13.1MbWindow.bed
bedtools makewindows -g ../../referenceSizes/hg38.assembledOnly.chrom.sizes -w 1000000 -s 1000000 > HG38.1MbWindow.bed
bedtools makewindows -g ../../referenceSizes/hg19.assembledOnly.chrom.sizes -w 1000000 -s 1000000 > HG19.1MbWindow.bed


## CHM13
# Illumina100
bedtools intersect -wao -a CHM13.1MbWindow.bed -b ../../data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/CHM13.1MbWindow.Illumina100.DepthByDark.bed
bedtools intersect -wao -a CHM13.1MbWindow.bed -b ../../data/Illumina100_CHM13/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.T2T_CHM13_v2.0.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/CHM13.1MbWindow.Illumina100.DepthByMapQ.bed

# Illumina250
bedtools intersect -wao -a CHM13.1MbWindow.bed -b ../../data/Illumina250_CHM13/Updated_output_07_17_2023/illuminaRL250.IlluminaRL250.T2T_CHM13_v2.0.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/CHM13.1MbWindow.Illumina250.DepthByDark.bed
bedtools intersect -wao -a CHM13.1MbWindow.bed -b ../../data/Illumina250_CHM13/Updated_output_07_17_2023/illuminaRL250.IlluminaRL250.T2T_CHM13_v2.0.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/CHM13.1MbWindow.Illumina250.DepthByMapQ.bed

# PacBio
bedtools intersect -wao -a CHM13.1MbWindow.bed -b ../../data/PacBio_CHM13/UpdatedSamples_09_16_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/CHM13.1MbWindow.PacBio.DepthByDark.bed
bedtools intersect -wao -a CHM13.1MbWindow.bed -b ../../data/PacBio_CHM13/UpdatedSamples_09_16_2024/PacBio.PacBio.All1KG.T2T_CHM13_v2.0.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/CHM13.1MbWindow.PacBio.DepthByMapQ.bed

# ONT
bedtools intersect -wao -a CHM13.1MbWindow.bed -b ../../data/ONT_CHM13/UpdatedSamples_09_16_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/CHM13.1MbWindow.ONT.DepthByDark.bed
bedtools intersect -wao -a CHM13.1MbWindow.bed -b ../../data/ONT_CHM13/UpdatedSamples_09_16_2024/ONT.ONT_1KG.T2T_CHM13_v2.0.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/CHM13.1MbWindow.ONT.DepthByMapQ.bed




## HG38_Alt
# Illumina100
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.Illumina100.DepthByDark.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/Illumina100_HG38_Alt/Updated_output_07_17_2023/illuminaRL100.1KGenomes_hg38_plus_decoy.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.Illumina100.DepthByMapQ.bed

# Illumina250
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/Illumina250_HG38_Alt/Updated_output_07_17_2023/illuminaRL250.IlluminaRL250.HG38_Alt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.Illumina250.DepthByDark.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/Illumina250_HG38_Alt/Updated_output_07_17_2023/illuminaRL250.IlluminaRL250.HG38_Alt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.Illumina250.DepthByMapQ.bed

# PacBio
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/PacBio_HG38_Alt/UpdatedSamples_09_16_2024/PacBio.PacBio.All1KG.HG38_v107_Alt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.PacBio.DepthByDark.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/PacBio_HG38_Alt/UpdatedSamples_09_16_2024/PacBio.PacBio.All1KG.HG38_v107_Alt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.PacBio.DepthByMapQ.bed

# ONT
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/ONT_HG38_Alt/UpdatedSamples_09_16_2024/ONT.ONT_1KG.HG38_Alt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.ONT.DepthByDark.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/ONT_HG38_Alt/UpdatedSamples_09_16_2024/ONT.ONT_1KG.HG38_Alt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_Alt.1MbWindow.ONT.DepthByMapQ.bed






## HG38_noAlt
# Illumina100
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.Illumina100.DepthByDark.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/Illumina100_HG38_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG38_noAlt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.Illumina100.DepthByMapQ.bed

# Illumina250
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/Illumina250_HG38_noAlt/Updated_output_07_17_2023/illuminaRL250.IlluminaRL250.HG38_noAlt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.Illumina250.DepthByDark.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/Illumina250_HG38_noAlt/Updated_output_07_17_2023/illuminaRL250.IlluminaRL250.HG38_noAlt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.Illumina250.DepthByMapQ.bed

# PacBio
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/PacBio_HG38_noAlt/UpdatedSamples_09_16_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.PacBio.DepthByDark.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/PacBio_HG38_noAlt/UpdatedSamples_09_16_2024/PacBio.PacBio.All1KG.HG38_v107_no_alt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.PacBio.DepthByMapQ.bed

# ONT
#bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.ONT.DepthByDark.bed
#bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/ONT_HG38_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG38_noAlt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.ONT.DepthByMapQ.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/ONT_HG38_noAlt/UpdatedSamples_09_16_2024/ONT.ONT_1KG.HG38_noAlt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.ONT.DepthByDark.bed
bedtools intersect -wao -a HG38.1MbWindow.bed -b ../../data/ONT_HG38_noAlt/UpdatedSamples_09_16_2024/ONT.ONT_1KG.HG38_noAlt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG38_noAlt.1MbWindow.ONT.DepthByMapQ.bed





## HG19_noAlt
# Illumina100
bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.Illumina100.DepthByDark.bed
bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/Illumina100_HG19_noAlt/Updated_output_07_17_2023/originalADSP.Illumina_OriginalADSP.HG19_noAlt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.Illumina100.DepthByMapQ.bed

# Illumina250
bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/Illumina250_HG19_noAlt/Updated_output_07_17_2023/IlluminaRL250.Illumina250_HG37_no_alt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.Illumina250.DepthByDark.bed
bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/Illumina250_HG19_noAlt/Updated_output_07_17_2023/IlluminaRL250.Illumina250_HG37_no_alt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.Illumina250.DepthByMapQ.bed

# PacBio
#bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.PacBio.DepthByDark.bed
#bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/PacBio_HG19_noAlt/UpdatedSamples_11_30_2023/PacBio.PacBio.All1KG.HG19_no_alt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.PacBio.DepthByMapQ.bed
bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/PacBio_HG19_noAlt/UpdatedSamples_09_16_2024/PacBio.PacBio.All1KG.HG19_no_alt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.PacBio.DepthByDark.bed
bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/PacBio_HG19_noAlt/UpdatedSamples_09_16_2024/PacBio.PacBio.All1KG.HG19_no_alt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.PacBio.DepthByMapQ.bed

# ONT
#bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.ONT.DepthByDark.bed
#bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/ONT_HG19_noAlt/UpdatedSamples_11_30_2023/ONT.ONT_1KG.HG19_noAlt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.ONT.DepthByMapQ.bed
bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/ONT_HG19_noAlt/UpdatedSamples_09_16_2024/ONT.ONT_1KG.HG19_noAlt.low_depth-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.ONT.DepthByDark.bed
bedtools intersect -wao -a HG19.1MbWindow.bed -b ../../data/ONT_HG19_noAlt/UpdatedSamples_09_16_2024/ONT.ONT_1KG.HG19_noAlt.low_mapq-merged.bed | bedtools merge -i - -d 0 -c 9 -o sum > UpdatedSamples_09_16_2024/HG19_noAlt.1MbWindow.ONT.DepthByMapQ.bed




