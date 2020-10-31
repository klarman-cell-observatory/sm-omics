### SM-Omics: An automated platform for high-throughput spatial multi-omics

The spatial organization of cells and molecules plays a key role in tissue function in homeostasis and disease. Spatial Transcriptomics (ST) has recently emerged as a key technique to capture and positionally barcode RNAs directly in tissues. Here, we advance the application of ST at scale, by presenting Spatial Multiomics (SM-Omics) as a fully automated high-throughput platform for combined and spatially resolved transcriptomics and antibody-based proteomics. 

Please cite: Vickovic S & Loetstedt B et al: SM-Omics: An automated platform for high-throughput spatial multi-omics, doi: https://doi.org/10.1101/2020.10.14.338418

# Automation SM-Omics tech workflow
![github-small](https://github.com/klarman-cell-observatory/sm-omics/blob/master/automation.png)

The raw and processed files needed to recreate all the results in this study are available at: https://singlecell.broadinstitute.org/single_cell/study/SCP979/

All processed gene expression files have be provided in the following format (*stdata_under_tissue_IDs.txt):\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x_y\
gene1   int

All processed IF expression files have be provided in the following format (*stifs_under_tissue_IDs.txt):\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x_y\
ab1     int

All processed antibody-tag expression files have be provided in the following format (*stabs_under_tissue_IDs.txt):\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x_y\
tag1    int

Additionally, all downscaled IF images and corresponding probabilites masks have been provided (*Ab.jpb and *Ab_Probabilities.tiff) as well. 

Each sample processed in this spatial study has been annotated into smaller ROIs avaialbe as *annotations.tsv

For generating spatial gene expression estimates and spatial differential expression analysis, we advise you to follow instruction at: https://github.com/tare/Splotch and cite Äijö T, Maniatis S & Vickovic S et al: Splotch: Robust estimation of aligned spatial temporal gene expression data, doi: https://doi.org/10.1101/757096

For using our spatial spots alignemnts and reporting tool, please go to our SpoTteR repository: https://github.com/klarman-cell-observatory/SpoTerR





