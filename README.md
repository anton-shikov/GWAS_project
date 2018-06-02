
# Search for multiple associations in GWAS data.

## Project description
GWAS(genome wide associated study) is a powerful method in genetics especially in the light of human health science. It allows us to find genetic markers (predominantly SNP - single nucleotide polymorphism) associated with phonotypical traits. What is more important is an ability to reveal markers associate with diseases, that can help us to elaborate and perform easier diagnostics and genotype risks calculation.

What we find the most enthralling is the identification of markers having multiple associations with diverse traits. What stays for the mechanisms of these effects? Does it somehow correlate with there position in genome?
Finding appropriate data to answer this question implies massive screening and analysis. Luckily, in 2017 UK Biobank released the most extensive genetic data in history (500,000 humans). This GWAS data is publically open, allowing us to perform search and analysis of multiple associations


## Goals and objectives
The aims of the project:
1) Getting acquainted with GWAS research data in UK Biobank database.
2) Downloading data and subsequent filtering valuable associations among all presented phenotypes
3) Detecting GWAS markers with multiple phenotype associations
4) Analyzing and uncovering the mechanisms of GWAS-markers pleiotropic action with the help of genomic experiments and phenotypic correlations analysis.

## Methods
Simple bash-script was written in order to download, unpack and extract desirable (p-value less then e-08) data from UK biobank 
https://docs.google.com/spreadsheets/d/1b3oGI2lUt57BcuHttWaZotQcI0-mBRPyZihz87Ms_No/edit#gid=1209628142
Yet another bash-script for extracted data merging was written and successfully executed. 
Big table with all extracted data was analyzed with the help of phyton. To parse this tsv-file and unify strings with identical SNP phyton script was used.
All scripts are presented in repository and they are correctly working. 
Unfortunately, even archived file was too big for adding it to the current git repository, for this reason, data was uploaded to Google drive
(https://drive.google.com/drive/folders/1bfQJ6X6sSNmHh0QfLi-7j9l2oh5e3Npa).	
After that heatmap with phenotypes was builded (using Szymkiewicz–Simpson coefficient for common SNP).
This heatmap was subjected to hierarchical clustering in order to find SNP associated with clusters instead of single phenotypes.
The obtained data was used for further analysis (visualizing Manhattan plots, calculating MAF correlations, realization sliding clip in search of local maxima)

### Scripts description
1. Downloading.sh - script for downloading tsv-files for all phenotypes  
2. Data_prep.sh - script for downloaded data preprocessing, this files were subsequently merged in uneted tsv-file  
3. tsv_parse.py - script for merging rows in tsv-file (merging SNP associaeted with several phenotypes)  
4. Data_Visualization.r - script for visualisation data (building geom point and geom density plots)  
5. Data_plot_preparation.sh, Data_preparation_for_plot.py - scripts for data preprocessing for Manhattan plot  
6. Data_preparation_for_heatmap.py - script for  data preprocessing for heatmap  
7. Heatmap_array_build.py - script for building heatmap with phenotypes  
8. Heatmap_viz.r - script for heatmap visualizing and hierarchical clustering  
9. Manhattan_plot_viz.r - script for Manhattan plot visualizing  
10. Clustered_manhattan_prep.py - script for data preparation for Manhattan plot with associated clusters  
11. MAF_preparation.py, Specifying_data_for_phen_corr.sh - scripts for data preprocessing for calculating MAF correlation  
12. MAF_correlation.r - scripts for calculating MAF correlation and visualizing scatter plots and violin plots  
13. Sliding_clip.py - script for finding local maxima  
14. VCF_obtaining.py, BED_obtaining.py - scripts for converting tsv-files into BED and VCF files for functional annotation  

## Results 
The following framework shows that using clusterisation in search of multiple associations in GWAS data could be an efficient method to reduce artifacts and find interesting SNP needed further investigation
#### Data distribution for nonclustered data
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/geom_point_09.jpeg?raw=true)
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/geom_point_09.jpeg?raw=true)
#### Data distribution for clustered data
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/Clust_geom_point.jpeg?raw=true)
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/Clustered_density_clust_09.jpeg?raw=true)
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/hist.jpeg?raw=true)
#### Manhattan plot for nonclustered data
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/Manhattan_09.jpeg?raw=true)
#### Manhattan plot for clustered data
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/Clustered_Manhattan_09.jpeg?raw=true) 
#### MAF correlation for nonclustered data
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/scatter_09.jpeg?raw=true)
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/Violin_09.jpeg?raw=true)
#### MAF correlation for clustered data
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/Clust_scatter_09.jpeg?raw=true)
  ![](https://github.com/anton-shikov/GWAS_project/blob/master/results/Clust_violin_09.jpeg?raw=true)
