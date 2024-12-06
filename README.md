# DSC 291 Final Project - Group 3

This repository contains the analysis and code for evaluating the genetic architecture of hearing loss using LD Score Regression (LDSC). The project focuses on understanding how variations in phenotypic definitions affect heritability estimates, genomic inflation, and signal attenuation. By analyzing summary statistics from a large meta-analysis (DeAngelis et al., 2023), we explore the genetic contributions to hearing loss across different phenotypic definitions, including self-reported traits and audiometric measures.

## Key Highlights of the Analysis
- **Heritability Estimates**: 
  - SNP-based heritability on the liability scale was estimated at **0.070 ± 0.003**, with moderate genomic inflation (**λGC = 1.307**), consistent with polygenic traits.
  
- **Phenotypic Impact**: 
  - Results emphasize that self-reported phenotypes yield lower heritability estimates due to higher misclassification rates compared to objective measures.

- **Visualization and Validation**: 
  - A Manhattan plot showcases significant loci, including peaks on **chromosomes 5, 11, and 22**, which overlap with biologically relevant regions identified in previous studies.

- **Methodology**: 
  - The analysis utilized LDSC with preprocessing steps for data alignment, SNP filtering, and quality control to ensure robust results.

## Significance
This study highlights the need for standardized phenotypic definitions and rigorous methodologies in genetic research on complex traits like hearing loss. Future directions include:
- Multi-ancestry analyses
- Incorporation of functional genomic data
- Exploration of gene-environment interactions

## Repository Contents
- **Code**: Scripts for preprocessing, LDSC analysis, and visualization. (The script for LDSC is derived from the widely used repository: [ldsc](https://github.com/bulik/ldsc))
- **Data**: The data used for this project is a bit large so it's not included in this repository but here is a link to it "HP.sex.combined.GWAS.tsv.gz": [Zenodo](https://zenodo.org/records/7897038)

