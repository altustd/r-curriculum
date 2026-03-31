# r-curriculum

[![Quarto](https://img.shields.io/badge/Quarto-1.5+-blue)](https://quarto.org)
[![R](https://img.shields.io/badge/R-4.2+-blue)](https://www.r-project.org/)

A **progressive, hands-on curriculum** for learning R programming using the modern tidyverse approach.

## About This Project

This repository contains a series of well-commented R scripts that take you from basic R syntax all the way to data visualization, real-world data handling, and dates.

Each script includes:
- Clear explanations
- Practical examples
- Exercises to reinforce learning
- Consistent coding style

## Curriculum

| #  | Script | Topic |
|----|--------|-------|
| 01 | [R Fundamentals](scripts/script-01-r-fundamentals.R) | Basic syntax and operations |
| 02 | [Data Structures](scripts/script-02-data-structures-deep-dive.R) | Vectors, lists, tibbles |
| 03 | [Control Flow & Functions](scripts/script-03-control-flow-and-functions.R) | Loops, conditionals, functions |
| 04 | [Data Import & Export](scripts/script-04-data-import-and-export.R) | CSV, Excel, RDS |
| 05 | [Data Wrangling](scripts/script-05-data-wrangling-with-dplyr-and-tidyr.R) | dplyr + tidyr |
| 06 | [Data Visualization](scripts/script-06-ggplot2-visualization.R) | ggplot2 mastery |
| 07 | [Advanced Import + Dates](scripts/script-07-data-import-export-and-dates.R) | readr, readxl, **lubridate** |

## Getting Started

```bash
# Clone the repository
git clone https://github.com/altustd/r-curriculum.git
cd r-curriculum

# Restore the project environment (installs all packages)
renv::restore()
