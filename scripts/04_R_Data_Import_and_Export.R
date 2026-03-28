# ==============================================================================
# 04_R_Data_Import_and_Export.R
# R Curriculum
#
# Topic: Data Import and Export
# Builds on Script 03 (Control Flow & Functions)
# Uses general examples (sales data, survey data, student records)
# ==============================================================================

# --------------------------- Setup --------------------------------------------
# renv::restore()   # Run if needed

library(tidyverse)   # For read_csv, write_csv, etc.
library(readr)       # Modern fast reading functions

cat("=== Script 04: Data Import and Export ===\n\n")

# ==============================================================================
# 1. Reading Data from CSV
# ==============================================================================

# Example: Reading a sales dataset
sales_data <- read_csv("data/raw/sales_data.csv", show_col_types = FALSE)

cat("Sales data loaded successfully!\n")
print(head(sales_data))
cat("\nDimensions:", dim(sales_data), "\n")
cat("Column names:", names(sales_data), "\n")

# Alternative base R way
# sales_data_base <- read.csv("data/raw/sales_data.csv")

# ==============================================================================
# 2. Reading Other Common Formats
# ==============================================================================

# Excel files (requires readxl package)
# library(readxl)
# excel_data <- read_excel("data/raw/report.xlsx", sheet = "Sales")

# JSON files (requires jsonlite)
# library(jsonlite)
# json_data <- fromJSON("data/raw/config.json")

# ==============================================================================
# 3. Writing / Exporting Data
# ==============================================================================

# Create a summary table
sales_summary <- sales_data %>%
  group_by(region) %>%
  summarise(
    total_sales = sum(revenue, na.rm = TRUE),
    avg_order = mean(order_value, na.rm = TRUE),
    num_orders = n()
  )

# Export to CSV
write_csv(sales_summary, "outputs/tables/sales_summary.csv")

cat("\nSummary table exported to outputs/tables/sales_summary.csv\n")

# Export to RDS (R's native format - preserves data types)
saveRDS(sales_data, "outputs/tables/sales_data_full.rds")

# Export as RData (can save multiple objects)
save(sales_summary, sales_data, file = "outputs/tables/sales_export.RData")

# ==============================================================================
# 4. Best Practices for Data Import/Export
# ==============================================================================

cat("\n=== Best Practices ===\n")
cat("- Always use read_csv() from readr instead of read.csv() when possible\n")
cat("- Specify col_types when column types are important\n")
cat("- Use relative paths from project root\n")
cat("- Save processed data in 'data/processed/' and outputs in 'outputs/'\n")
cat("- Use RDS for large datasets to preserve R object structure\n")

# Example with column specification
sales_clean <- read_csv(
  "data/raw/sales_data.csv",
  col_types = cols(
    order_date = col_date(),
    revenue = col_double(),
    region = col_factor()
  ),
  show_col_types = FALSE
)

# ==============================================================================
# 5. Exercises
# ==============================================================================

cat("\n=== Exercises ===\n")

# Exercise 1:
# Create a sample dataset (use tibble or data.frame) with columns: 
# id, name, age, score, department. Then export it as both CSV and RDS.

# Exercise 2:
# Write a function called `safe_read_csv` that reads a CSV file and:
#   - Checks if the file exists
#   - Prints a nice message if successful
#   - Returns NA with a warning if file is missing

# Exercise 3:
# Read the exported `sales_summary.csv` back into R and verify the data is correct.

# Exercise 4 (Challenge):
# Create a function that takes any data frame and exports it to three formats:
# CSV, RDS, and RData with a timestamp in the filename.

# ==============================================================================
# End of Script 04
# ==============================================================================

cat("\n=== End of Script 04 ===\n")
cat("Next: Script 05 - dplyr and tidyr for Data Wrangling\n")