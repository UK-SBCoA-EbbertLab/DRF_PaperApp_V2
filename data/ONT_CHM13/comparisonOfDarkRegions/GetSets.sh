 bedtools intersect -a ../Updated_output_01_17_2025/ONT.ONT_1KG.T2T_CHM13_v2.0.dark-merged.bed -b ../UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.dark-merged.bed > IntersectPrimarySupp.vs.PrimaryOnly.bed
 bedtools subtract -b ../Updated_output_01_17_2025/ONT.ONT_1KG.T2T_CHM13_v2.0.dark-merged.bed -a ../UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.dark-merged.bed > Unique2PrimaryOnly.bed
 bedtools subtract -a ../Updated_output_01_17_2025/ONT.ONT_1KG.T2T_CHM13_v2.0.dark-merged.bed -b ../UpdatedSamples_11_30_2023/ONT.ONT_1KG.T2T_CHM13_v2.0.dark-merged.bed > Unique2PrimarySupp.bed
