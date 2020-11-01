# SM-Omics: An automated platform for high-throughput spatial multi-omics

The spatial organization of cells and molecules plays a key role in tissue function in homeostasis and disease. Spatial Transcriptomics (ST) has recently emerged as a key technique to capture and positionally barcode RNAs directly in tissues. Here, we advance the application of ST at scale, by presenting Spatial Multiomics (SM-Omics) as a fully automated high-throughput platform for combined and spatially resolved transcriptomics and antibody-based proteomics. 

Please cite: Vickovic S & Loetstedt B et al: [SM-Omics: An automated platform for high-throughput spatial multi-omics](https://doi.org/10.1101/2020.10.14.338418)

### Automation SM-Omics tech workflow
![github-small](https://github.com/klarman-cell-observatory/sm-omics/blob/master/automation.png)
Illustration kindly made by Ania Hupalowska.

### Data availability
The raw and processed sequencing and image files needed to recreate all the results in this study have been made avaiable at [Broad's Sincel Cell Portal](https://singlecell.broadinstitute.org/single_cell/study/SCP979/).

For all file descriptions and metadata, please refer to: metadata.xlsx

### Data pre-processing
Initial sequncing data processing was performed with ST Pipeline ([v.1.3.1](https://github.com/SpatialTranscriptomicsResearch/st_pipeline/releases/tag/1.3.1)). For IF image pre-processing, either of Cy3 spatial gene expression footprints or traditional IFs, please check under [footprints](./surface_reactions) and [ifs](./ifs). 

For using our spatial spots alignemnts and reporting tool, please go to our [SpoTteR repository](https://github.com/klarman-cell-observatory/SpoTerR). For speed and accuracy tests, please check out our code [here](./spotter_testing).

### Spatial expression estimates using Splotch
For generating spatial gene expression estimates and spatial differential expression analysis, we advise you to follow instruction at: https://github.com/tare/Splotch and cite Äijö T, Maniatis S & Vickovic S et al: Splotch: Robust estimation of aligned spatial temporal gene expression data, doi: https://doi.org/10.1101/757096. In order to ease use, we have made the complete Splotch workflow available trough [Broad's Firecloud platform](https://portal.firecloud.org/?return=firecloud#methods/jgoud/splotch/58).

For recreating images in the paper, we have made the following code avaiable: [genes](./surface_reactions) and [tags](./surface_reactions) with correspoding python requirements listed in the same folders.

### Correlating genes and protein expression
For correlating gene to IF protein expression, please refer to the this [code and examples](./IF_vs_mRNA_signals).

### pyenv
Python env requirements have been listed in the [yml](./smomics_env.yml) file. 

### Renv
Renv requirements and sessionInfo has been listed in the [sessions file](./sessionInfo.txt) file. 








