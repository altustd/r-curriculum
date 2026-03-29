# ==============================================================================
# Script 07: Data Import, Export, and Working with Dates
# 
# This script builds on Script 04 (basic import/export) and Script 05 (dplyr).
# It covers real-world data handling and introduces the powerful lubridate package.
#
# Key packages: readr, readxl, writexl, lubridate
# ==============================================================================

library(readr)      # Fast, consistent reading of CSV, TSV, etc.
library(readxl)     # Reading Excel files (.xls, .xlsx)
library(writexl)    # Writing Excel files
library(lubridate)  # Making dates and times easy in R
library(dplyr)

# ------------------------------------------------------------------------------
# 1. Reading Different File Formats
# ------------------------------------------------------------------------------

# CSV with readr (recommended over base read.csv)
df_csv <- read_csv("data/sample_data.csv", show_col_types = FALSE)

# You can also read from URL directly
# df_url <- read_csv("https://raw.githubusercontent.com/.../data.csv")

# Excel files
df_excel <- read_excel("data/sample_data.xlsx", sheet = 1)

# Specific options
df_excel <- read_excel("data/sample_data.xlsx", 
                       sheet = "Sales", 
                       skip = 1,           # Skip header rows if needed
                       col_types = c("text", "date", "numeric", "numeric"))

# RDS files (best for saving R objects - preserves data types)
df_rds <- read_rds("data/my_data.rds")

# ------------------------------------------------------------------------------
# 2. Writing / Exporting Data
# ------------------------------------------------------------------------------

# Write CSV
write_csv(df_csv, "outputs/clean_data.csv")

# Write Excel (much better than base write.csv for Excel users)
write_xlsx(df_csv, "outputs/clean_data.xlsx")

# Save as RDS (recommended for R users)
write_rds(df_csv, "outputs/clean_data.rds", compress = "gz")

# ------------------------------------------------------------------------------
# 3. Working with Dates using lubridate (Highly Recommended)
# ------------------------------------------------------------------------------

# Example messy date column
dates_example <- tibble(
  date_str = c("2025-03-15", "15/03/2025", "March 15, 2025", "2025/03/15"),
  value = c(100, 150, 200, 175)
)

# lubridate makes parsing dates much easier
dates_example <- dates_example %>%
  mutate(
    date1 = ymd(date_str),           # Year-Month-Day
    date2 = dmy(date_str),           # Day-Month-Year
    date3 = mdy(date_str),           # Month-Day-Year
    best_date = parse_date_time(date_str, orders = c("ymd", "dmy", "mdy", "Ymd"))
  )

glimpse(dates_example)

# Extract useful components
dates_example <- dates_example %>%
  mutate(
    year = year(best_date),
    month = month(best_date, label = TRUE),     # Jan, Feb, etc.
    day = day(best_date),
    weekday = wday(best_date, label = TRUE),
    quarter = quarter(best_date),
    is_weekend = wday(best_date) %in% c(1, 7)
  )

# Common date operations
today()                    # Current date
now()                      # Current date + time

# Arithmetic with dates
dates_example %>%
  mutate(
    days_since = today() - best_date,
    one_month_later = best_date + months(1),
    one_year_ago = best_date - years(1)
  )

# ------------------------------------------------------------------------------
# 4. Real-World Data Cleaning Pipeline Example
# ------------------------------------------------------------------------------

cleaned_data <- df_csv %>%
  mutate(
    # Fix dates
    transaction_date = parse_date_time(transaction_date, orders = c("ymd", "dmy", "mdy")),
    # Clean numeric columns
    amount = parse_number(amount),
    # Create useful derived columns
    year = year(transaction_date),
    month = month(transaction_date, label = TRUE)
  ) %>%
  filter(!is.na(transaction_date)) %>%
  select(id, transaction_date, year, month, customer, amount, everything())

# ------------------------------------------------------------------------------
# Exercises
# ==============================================================================
# 
# 1. Create a small tibble with messy date formats and parse them using lubridate functions.
#
# 2. Read any CSV or Excel file you have, then:
#    - Check the structure with glimpse()
#    - Fix any date columns
#    - Export it as both .csv and .xlsx
#
# 3. Using the cleaned_data pipeline above, add a column for "quarter" and 
#    calculate total amount per quarter using group_by() + summarise().
#
# 4. (Stretch) Create a new column called "days_since_purchase" and then 
#    filter for transactions that happened in the last 30 days.
#
# Tip: Always use readr::read_csv() and lubridate for new projects — they are much more reliable.
# ==============================================================================

cat("\n✅ Script 07 completed!\n")
cat("Key takeaway: Use readr + readxl for import, writexl for export, and lubridate for dates.\n")
cat("Next: Script 08 - Functional Programming with purrr\n")
