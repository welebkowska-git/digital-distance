# Digital Distance – Replication Code
This repository contains the replication code for the paper:

“The Trade Effects of Digital Distance: Evidence from a Structural Gravity Model”
Katarzyna Śledziewska, Weronika Łebkowska (University of Warsaw, Faculty of Economic Sciences)

The repository includes all scripts necessary to reproduce the construction of key variables and the econometric analysis. Due to size and licensing considerations, the final dataset is hosted separately on Zenodo.

## Repository structure
├── data_preparation/
│   └── digital_distance_pca.ipnyb
├── gravity_models/
│   └── Digital_Dist.do
├── README.md

Python script used to:
- clean and harmonize raw country-level indicators,
- construct bilateral digital distance measures,
- build composite indices of digital infrastructure and digital readiness using PCA,
- generate the final panel dataset used in the econometric analysis.

The script outputs a Stata-compatible .dta file.

Stata do-file used to:
- estimate structural gravity models using PPML,
- implement exporter-year, importer-year, and country-pair fixed effects,
- run baseline specifications and robustness checks,
- produce the main regression results reported in the paper.

## Data sources and documentation

All underlying data sources used in this study are publicly available online from international databases (e.g. UNCTAD). Due to size and harmonization requirements, the raw source data are not duplicated in this repository. The final processed dataset used in the econometric analysis is archived on Zenodo.

A detailed description of all variables, data sources, and construction steps is provided in the paper. The repository is intended to enable full replication of the results using the documented data and code.

## Data availability

The final dataset and replication files are publicly available on Zenodo:
Śledziewska, K., & Łebkowska, W. (2025). Digital Distance - Data [Data set]. Zenodo. https://doi.org/10.5281/zenodo.17250402

## Software requirements

To fully reproduce the results, the following software is required:
- Python ≥ 3.9 (e.g. pandas, numpy, scikit-learn)
- Stata ≥ 16 (ppmlhdfe package)

### Contact
For questions regarding the code or data, please contact:
Weronika Łebkowska
University of Warsaw
