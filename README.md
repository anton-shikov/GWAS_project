
# Search for multiple associacions in GWAS data.

## Project description
GWAS(genome wide assosiated study) is a powerful method in genetics especially in the light of human health science. It allows us to find genetic markers (predominantly SNP - single nucleotide polymorphism) associated with phenotypical traits. What is more important is an ability to reveal markers associate with diseases, that can help us to elaborate and perform easier diagnostics and genotyoe risks calculation.

What we find the most enthralling is the identification of markers having multiple associacions with diverse traits. What stays for the mechanisms of these effect? Does it somehow correlate with there position in genome?
Finding appropriate data to answer this question implies massive screening and analysis. Luckily in 2017 UK Biobank released the most extensive genetic data in history (500,000 humans). This GWAS data is publically open, alowing us to perform search and analysis of multiple associacions


## Goals and objectives
The aims of the project:
1) Getting acquainted with GWAS  research data in UK Biobank database.
2) Downloading data and subsequential filtering valuable associacions among all presented phenotypes
3) Detecting GWAS markers with multiple phenotype associacions
4) Analysing and uncovering the mechanisms of GWAS-markers pleiotropic action with the help of genomic experiments and phenotipic correlations analysis.

## Methods
Simple bash-script was written in order to download, unpack and extract desirable (p-value less then e-08) data from UK biobank 
https://docs.google.com/spreadsheets/d/1b3oGI2lUt57BcuHttWaZotQcI0-mBRPyZihz87Ms_No/edit#gid=1209628142
Yet another bash-script for extracted data merging was written and successfully executed. 
Big table with all extracted data was analysed with the help of phyton. To parse this tsv-file and unify strings with identical SNP phyton script was used.
All scripts are presented in repository and they are correctly working. 
Unfortunately, even archivated file was too big for adding it to the current git repository, for this reason data was uploaded to google drive
(https://drive.google.com/drive/folders/1bfQJ6X6sSNmHh0QfLi-7j9l2oh5e3Npa).	


