# COVID-19
Dissecting the Role of the Human Microbiome in COVID-19 via Metagenome-assembled Genomes

# Introduction

This REPO contains in-house scripts, data and detailed instructions for users to reproduce much of the analyses we have done for our manuscript titled "Dissecting the Role of the Human Microbiome in COVID-19 via Metagenome-assembled Genomes".

If further assisstance is required, please do not hesitate to contact me by raise an issue in the "Issues" section of this REPO.

# Prerequisites
Below are a list of softwares and databases required before running out test data. Most of the softwares can be installed through CONDA.

# Softwares
A list of required softwares and URLs for their downloads. Please follow instructions for proper software installation on their respective servers. The versions in the parenthesis indicate the ones we used for our project.

A list of required softwares and URLs for their downloads. Please follow instructions for proper software installation on their respective servers. The versions in the parenthesis indicate the ones we used for our project.

Software	Availability
| Software  | Availability  |
| :-----: | :-: |
| metaWRAP(v1.3.2)| https://github.com/bxlab/metaWRAP |
| metaSPAdes (v3.13.0)| https://github.com/ablab/spades |
| MaxBin2  (v2.2.6)| https://github.com/assemblerflow/flowcraft/blob/master/docs/user/components/maxbin2.rst |
| metaBAT2  (v2.12.1)| https://bitbucket.org/berkeleylab/metabat/src/master/ |
| CONCOCT  (v1.0.0)| https://github.com/BinPro/CONCOCT |
| CheckM  (v1.0.12)| https://github.com/Ecogenomics/CheckM |
| dRep  (v3.0.0)| https://github.com/MrOlm/drep |
| GTDB-tk  (v1.4.1)| http://gtdb.ecogenomic.org/ |
| Salmon  (v0.13.1)| https://github.com/COMBINE-lab/salmon |
| PhyloPhlAn  (v3.0.58)| https://github.com/biobakery/phylophlan |
| MicrobeAnnotator  (v2.0.5)| https://github.com/cruizperez/MicrobeAnnotator |

Note: Please make sure all the softwares are installed with specific conda environment to avoid unnecessary conflits.

# Databases
A list of databases and their URLs for downloads:

| Database  | Availability  |
| :-----: | :-: |
| Indexed hg38 | ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes |
| CheckM | https://data.ace.uq.edu.au/public/CheckM_databases |
| PhyloPhlAn | https://github.com/biobakery/phylophlan/wiki |
| GTDB-tk | https://gtdb.ecogenomic.org/downloads |
| Kofam/Swissprot/Trembl/RefSeq | https://github.com/cruizperez/MicrobeAnnotator/tree/master/microbeannotator/database |

# Metagenomics sequencing data
The example sequencing data can be downloaded from NCBI/ENA/GSA. The accession numbers of those metagenomic studies are PRJNA624223, PRJNA656660, PRJNA660883, PRJNA743981, PRJCA003532, and PRJNA650244. 



# Usage
The Example workflow is divided into two folders: 'Pipeline' and 'Script'. 'Pipeline' folder contains details for the public softwares and their parameters used for our project, while the 'Script' folder contains in-house scripts for further data analysis and visualisation. 

Construction of the metagenome-assembled genomes

Part1: 01_quality_control.sh
Pre-processing of the raw sequencing data in FASTQ format, including quality control (removal of low-quality and adaptor sequences) and removal of host genome and contaminations from human host.

Part2: 02_assembly.sh
Metagenomic assembly: Assemble short reads into long contigs.

Part3: 03_binning.sh
Metagenomic binning: bin contigs into MAGs. 

Part4: 04_refine.sh
Consolidate bin sets.

Part5: 05_dereplication.sh
MAG depreplication to generate unique MAGs.

Part6: 06_MAGs_taxonomy.sh
High-quality bins were identified to obtain MAGs. The taxonomic annotation was then performed for all MAGs to determine their taxonomic identities and phylogenetic relationships.

Part7: 07_MAGs_function.sh
MAGs were subjected to tools including Prokka to identify protein-coding and non-coding genes. MicrobeAnnotator uses an iterative approach to annotate microbial genomes (Bacteria, Archaea and Virus) starting from proteins predicted using your favorite ORF prediction tool, e.g. Prodigal. The iterative approach is composed of three or five main steps (depending on the flavor of MicrobeAnnotator you run). Search of initial protein dataset using KOFamscan, extraction of unannotated proteins. Search of proteins extracted in the previous step using UniProt Swissprot database. Extract unannotated proteins and repeat search using RefSeq and Trembl (if running the full version). In the end, the program will check those entries that had an annotation match but no KO number and will look for other database identifiers (E.C. and InterPro) in the annotation metadata and will try to link those to KO numbers to refine the annotations.

Statistical analysis and visualization
All analyzed data were loaded to R for further analysis and visualisation using serveral in-house scripts. The in-house scripts are available in the folder 'Script'.

# Dependencies of R
sessionInfo()
R version 4.1.2 (2021-11-01)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS High Sierra 10.13.6

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
LAPACK: /Library/Frameworks/R.framework/Versions/4.1/Resources/lib/libRlapack.dylib

Random number generation:
 RNG:     Mersenne-Twister 
 Normal:  Inversion 
 Sample:  Rounding 
 
locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] cowplot_1.1.1     plyr_1.8.6        vegan_2.5-7       permute_0.9-7     ggpattern_0.4.2   reshape2_1.4.4    readxl_1.3.1      dplyr_1.0.8       stringr_1.4.0    
[10] data.table_1.14.2 caret_6.0-91      lattice_0.20-45   ggplot2_3.3.5    

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.8.3         lubridate_1.8.0      listenv_0.8.0        class_7.3-20         assertthat_0.2.1     digest_0.6.29        ipred_0.9-12         foreach_1.5.2       
 [9] utf8_1.2.2           parallelly_1.30.0    R6_2.5.1             cellranger_1.1.0     hardhat_0.2.0        stats4_4.1.2         e1071_1.7-9          pillar_1.7.0        
[17] rlang_1.0.2          rstudioapi_0.13      rpart_4.1.16         Matrix_1.4-0         labeling_0.4.2       splines_4.1.2        gower_1.0.0          munsell_0.5.0       
[25] proxy_0.4-26         compiler_4.1.2       pkgconfig_2.0.3      mgcv_1.8-39          globals_0.14.0       nnet_7.3-17          tidyselect_1.1.2     tibble_3.1.6        
[33] prodlim_2019.11.13   codetools_0.2-18     fansi_1.0.2          future_1.24.0        crayon_1.5.0         withr_2.5.0          MASS_7.3-55          recipes_0.2.0       
[41] ModelMetrics_1.2.2.2 grid_4.1.2           nlme_3.1-155         gtable_0.3.0         lifecycle_1.0.1      DBI_1.1.2            magrittr_2.0.2       pROC_1.18.0         
[49] scales_1.1.1         future.apply_1.8.1   cli_3.2.0            stringi_1.7.6        farver_2.1.0         timeDate_3043.102    ellipsis_0.3.2       generics_0.1.2      
[57] vctrs_0.3.8          lava_1.6.10          RColorBrewer_1.1-2   iterators_1.0.14     tools_4.1.2          glue_1.6.2           purrr_0.3.4          parallel_4.1.2      
[65] survival_3.3-1       yaml_2.3.5           colorspace_2.0-3     cluster_2.1.2    
