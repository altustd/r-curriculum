# R Programming Curriculum: From Fundamentals to Advanced

A complete, progressive **R programming learning path** with hands-on scripts and real-world data analysis examples.

**Author:** Troy Altus  
**Status:** In Progress (March 2026)

---

## Overview

This repository is a **structured self-paced R curriculum** designed to take you from beginner to advanced R programmer. 

Each script builds upon the previous one and follows a consistent naming convention:

`XX_R_Topic_Name.R`

All scripts are heavily commented, include exercises, and use practical examples drawn from real data analysis (offshore platform aging study).

---

## Curriculum Structure

### Phase 1: Fundamentals & Base R
- [`01_R_Fundamentals.R`](scripts/01_R_Fundamentals.R) — Basic syntax, assignment, vectors, matrices, lists, data frames, factors, missing values, basic functions, and plotting
- [`02_R_Data_Structures_Deep_Dive.R`](scripts/02_R_Data_Structures_Deep_Dive.R) — Advanced subsetting, coercion rules, recycling, attributes, and working with complex structures
- [`03_R_Control_Flow_and_Functions.R`](scripts/03_R_Control_Flow_and_Functions.R) — Conditionals, loops, apply family, writing clean and robust functions

### Phase 2: Data Wrangling
- [`04_R_Data_Import_Export.R`](scripts/04_R_Data_Import_Export.R) — Reading and writing CSV, Excel, JSON, fixed-width files, and databases
- [`05_R_Dplyr_Tidyr_Data_Wrangling.R`](scripts/05_R_Dplyr_Tidyr_Data_Wrangling.R) — Modern tidy data manipulation with `dplyr` and `tidyr`
- [`06_R_DataTable_Advanced_Wrangling.R`](scripts/06_R_DataTable_Advanced_Wrangling.R) — High-performance data processing with `data.table`, `stringr`, and `lubridate`

### Phase 3: Visualization & EDA
- [`07_R_GGPlot2_Visualization.R`](scripts/07_R_GGPlot2_Visualization.R) — Publication-quality graphics using `ggplot2`
- [`08_R_Exploratory_Data_Analysis.R`](scripts/08_R_Exploratory_Data_Analysis.R) — Summary statistics, `skimr`, correlation analysis, and EDA best practices

### Phase 4: Statistical Modeling
- [`09_R_Statistical_Modeling.R`](scripts/09_R_Statistical_Modeling.R) — Linear models, ANOVA, GLM, diagnostics, and predictions
- [`10_R_Advanced_Statistics.R`](scripts/10_R_Advanced_Statistics.R) — Hypothesis testing, mixed-effects models, and model comparison

### Phase 5: Programming & Reproducibility
- [`11_R_Functional_Programming_Purrr.R`](scripts/11_R_Functional_Programming_Purrr.R) — Functional programming with `purrr`
- [`12_R_RMarkdown_Quarto_Reporting.R`](scripts/12_R_RMarkdown_Quarto_Reporting.R) — Reproducible reports and automated documentation

### Phase 6: Advanced & Production
- [`13_R_Shiny_Web_Applications.R`](scripts/13_R_Shiny_Web_Applications.R) — Building interactive web dashboards with Shiny
- [`14_R_Machine_Learning_Tidymodels.R`](scripts/14_R_Machine_Learning_Tidymodels.R) — Predictive modeling using `tidymodels`
- [`15_R_Package_Development_Performance.R`](scripts/15_R_Package_Development_Performance.R) — R package development, performance tuning, parallel computing, and Rcpp

---

## Repository Structure
offshore-aging-gom/
├── data/
│   ├── raw/                    # Downloaded BOEM zip files
│   └── processed/              # Cleaned GeoJSON and analysis files
├── scripts/
│   ├── 01_R_Fundamentals.R
│   ├── 02_R_Data_Structures_Deep_Dive.R
│   ├── ...
│   └── 15_R_Package_Development_Performance.R
├── notebooks/
│   └── offshore-report.ipynb   # Main Python analysis (exploratory)
├── outputs/
│   ├── figures/                # Saved plots and visualizations
│   ├── reports/                # Generated HTML/PDF reports
│   └── maps/                   # Interactive map exports
├── README.md
├── .gitignore
└── LICENSE
