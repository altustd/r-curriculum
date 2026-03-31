# ==============================================================================
# Script 08: Advanced Data Wrangling with dplyr and tidyr
# ==============================================================================
#
# Description:
# This script builds on basic dplyr/tidyr skills to teach more powerful and 
# efficient data manipulation techniques. You'll learn how to reshape data, 
# combine multiple tables, perform complex grouped summaries, and write clean, 
# readable wrangling pipelines.
#
# Prerequisites:
# - Script 05: Data Wrangling with dplyr and tidyr (basics)
# - Script 06: ggplot2 Visualization
# - Script 07: Working with Dates and lubridate
#
# Packages used:
# - tidyverse (dplyr, tidyr, readr, tibble)
#
# Learning Objectives:
# - Master grouped operations with group_by() + summarise() + across()
# - Perform different types of joins (left, inner, right, full, anti, semi)
# - Reshape data using pivot_longer() and pivot_wider()
# - Use case_when(), if_else(), and across() for conditional mutations
# - Filter and slice data with complex conditions
# - Build efficient, readable multi-step dplyr pipelines
#
# ==============================================================================

# 1. Setup and Package Loading -----------------------------------------------

# renv::restore()   # Uncomment if needed

library(tidyverse)

# For better printing
options(tibble.print_min = 8, tibble.width = Inf)

cat("✅ Script 08 - Advanced Data Wrangling with dplyr and tidyr is ready!\n\n")


# 2. Load Sample Data --------------------------------------------------------

# We'll use built-in datasets + create some example tables for joins

data("storms")        # Built-in dataset with storm information
data("starwars")      # Another fun dataset for examples

# Create example tables for demonstrating joins
customers <- tibble(
  customer_id = 1:5,
  name = c("Alice", "Bob", "Charlie", "Diana", "Eve"),
  city = c("New York", "Boston", "Chicago", "New York", "Miami")
)

orders <- tibble(
  order_id = 101:107,
  customer_id = c(1, 2, 1, 3, 4, 2, 5),
  amount = c(150.75, 89.99, 245.00, 67.50, 320.00, 44.99, 189.50),
  order_date = ymd(c("2025-01-15", "2025-02-01", "2025-02-10", 
                     "2025-03-05", "2025-03-20", "2025-04-01", "2025-04-10"))
)

cat("Sample datasets loaded: storms, starwars, customers, orders\n\n")


# 3. Grouped Operations & Summaries ------------------------------------------

# Basic group_by + summarise


# Using across() for multiple columns


# 4. Joins ------------------------------------------------------------------

# left_join(), inner_join(), right_join(), full_join()


# Anti and semi joins for filtering


# 5. Reshaping Data (Pivoting) ----------------------------------------------

# pivot_longer() - from wide to long


# pivot_wider() - from long to wide


# 6. Advanced mutate() Techniques -------------------------------------------

# case_when() for complex conditional logic


# Using across() with mutate


# 7. Filtering & Slicing ----------------------------------------------------

# Complex filtering with %in%, between(), near(), etc.


# 8. Exercises --------------------------------------------------------------

# Exercise 1:
# Using the `storms` dataset, calculate the average wind speed and number of storms 
# by month and year. Sort by strongest storms.

# Exercise 2:
# Join the `customers` and `orders` tables. Then calculate total spending per customer 
# and their city. Show only customers who placed at least one order.

# Exercise 3:
# Take the `starwars` dataset and reshape it so that hair_color, skin_color, 
# and eye_color become rows (long format). Then create a summary of counts.

# Exercise 4 (Challenge):
# Build a pipeline that finds the top 5 customers by total order amount, 
# including their name and city.


# 9. Key Takeaways ----------------------------------------------------------

# - group_by() + summarise() + across() is extremely powerful for summaries
# - Always think about the "shape" of your data — use pivot_longer/pivot_wider when needed
# - left_join() is usually the safest and most commonly used join
# - case_when() makes complex if-else logic much cleaner
# - Well-structured dplyr pipelines are readable and easy to maintain

# Next Script: Script 09 - [Suggested: Exploratory Data Analysis (EDA) or 
#                           String Manipulation with stringr]

# ==============================================================================
# End of Script 08
# ==============================================================================