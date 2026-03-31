# ==============================================================================
# Script 07: Working with Dates and lubridate
# ==============================================================================
#
# Description:
# This script teaches you how to effectively handle dates and times in R using 
# the lubridate package. You'll learn to parse, manipulate, extract components 
# from, and perform calculations with dates — essential skills for any real-world 
# data analysis project.
#
# Prerequisites:
# - Script 01: R Fundamentals
# - Script 02: Data Structures Deep Dive
# - Script 03: Control Flow and Functions
# - Script 04: Data Import and Export (basic readr functions)
#
# Packages used:
# - tidyverse (includes readr, dplyr, tibble)
# - lubridate
#
# Learning Objectives:
# - Parse dates and times from various string formats using lubridate functions
# - Extract components (year, month, day, weekday, hour, etc.) from date objects
# - Perform arithmetic operations with dates (adding/subtracting days, months, years)
# - Create and work with intervals, periods, and durations
# - Handle time zones appropriately
# - Apply date operations within dplyr pipelines
#
# ==============================================================================

# 1. Setup and Package Loading -----------------------------------------------

# renv::restore()   # Uncomment to ensure correct package versions

library(tidyverse)
library(lubridate)

# Set options for cleaner tibble output
options(tibble.print_min = 6, tibble.width = Inf)

cat("✅ Script 07 - Working with Dates and lubridate is ready!\n\n")


# 2. Understanding R's Built-in Date Handling -------------------------------

# Base R Date class
today_base <- Sys.Date()
now_base   <- Sys.time()

cat("Base R today():", today_base, "\n")
cat("Base R now():", now_base, "\n\n")


# 3. Parsing Dates with lubridate -------------------------------------------

# Common parsing functions (the "y" "m" "d" order trick)
ymd("2025-03-31")          # Year-Month-Day
mdy("March 31, 2025")
dmy("31-03-2025")
ymd_hms("2025-03-31 14:30:00")

# Handling messy real-world dates
dates_messy <- c("2025-03-31", "31/03/2025", "March 31st 2025", "2025/03/31")

# Try parsing with different functions


# 4. Extracting Date Components ---------------------------------------------

# Use functions like year(), month(), day(), wday(), hour(), etc.


# 5. Date Arithmetic -------------------------------------------------------

# Adding / subtracting time periods
today() + days(30)
today() + months(3)
today() + years(1)

# Difference between dates


# 6. Working with Dates in dplyr Pipelines -------------------------------

# Example: Using mutate() with date functions


# 7. Intervals, Periods, and Durations -------------------------------------



# 8. Exercises --------------------------------------------------------------

# Exercise 1:
# Create a vector of 10 different date strings in various formats and parse them all correctly using lubridate.

# Exercise 2:
# Using the built-in `flights` dataset (or any dataset with a date column), 
# extract the month and weekday from the date column and create a summary table.

# Exercise 3:
# Calculate how many days are left until December 31, 2026 from today.


# 9. Key Takeaways ----------------------------------------------------------

# - lubridate makes date parsing intuitive with ymd(), mdy(), dmy(), etc.
# - Always prefer lubridate over base R for date manipulation in tidy workflows
# - Use year(), month(), day(), wday() to extract components easily
# - Date arithmetic with days(), months(), years() is very readable
# - Combine date functions seamlessly inside dplyr::mutate()

# Next Script: Script 08 - [Topic you choose next, e.g. Advanced Data Wrangling with dplyr]


# ==============================================================================
# End of Script 07
# ==============================================================================