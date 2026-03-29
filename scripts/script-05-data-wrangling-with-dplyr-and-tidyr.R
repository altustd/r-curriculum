# ==============================================================================
# 05_R_dplyr_and_tidyr_Data_Wrangling.R
# R Curriculum
#
# Topic: Data Wrangling with dplyr and tidyr
# Builds on Script 04 (Data Import/Export)
# Uses general examples: employee/sales/survey data
# ==============================================================================

# --------------------------- Setup --------------------------------------------
# renv::restore()   # Uncomment if needed

library(tidyverse)   # Loads dplyr, tidyr, readr, etc.

cat("=== Script 05: Data Wrangling with dplyr and tidyr ===\n\n")

# ==============================================================================
# 1. Load Sample Data
# ==============================================================================

# Create a sample messy dataset for demonstration
employee_data <- tibble(
  employee_id = c(101, 102, 103, 104, 105, 106),
  full_name   = c("Alice Smith", "Bob Johnson", "Carol Williams", "David Brown", 
                  "Eve Davis", "Frank Wilson"),
  department  = c("Marketing", "Sales", "HR", "IT", "Sales", "Marketing"),
  salary      = c(75000, 82000, 68000, 95000, 88000, 72000),
  hire_date   = as.Date(c("2022-03-15", "2021-06-01", "2023-01-10", 
                          "2020-11-20", "2022-09-05", "2023-04-12")),
  performance = c("Good", "Excellent", "Average", "Excellent", "Good", "Poor"),
  bonus_pct   = c(0.10, 0.15, 0.05, 0.20, 0.12, 0.08)
)

cat("Original employee dataset:\n")
print(employee_data)

# ==============================================================================
# 2. Core dplyr Verbs
# ==============================================================================

cat("\n=== dplyr Basics ===\n")

# filter() - Select rows
high_earners <- employee_data %>% 
  filter(salary > 80000)

cat("Employees earning > $80,000:\n")
print(high_earners)

# select() - Choose columns
basic_info <- employee_data %>% 
  select(employee_id, full_name, department, salary)

# mutate() - Create new columns
employee_data <- employee_data %>% 
  mutate(
    years_with_company = as.numeric(today() - hire_date) / 365,
    bonus_amount = salary * bonus_pct,
    salary_category = case_when(
      salary >= 90000 ~ "High",
      salary >= 70000 ~ "Medium",
      TRUE            ~ "Low"
    )
  )

cat("\nData with new columns (years, bonus, category):\n")
print(employee_data %>% select(full_name, salary, years_with_company, bonus_amount, salary_category))

# arrange() - Sort data
sorted_by_salary <- employee_data %>% 
  arrange(desc(salary))

# summarise