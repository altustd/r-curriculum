# ==============================================================================
# 03_R_Control_Flow_and_Functions.R
# R Curriculum
#
# Topic: Control Flow, Loops, and Functions
# Builds directly on Script 02 (Data Structures)
# Uses general, everyday examples for better learning
# ==============================================================================

# --------------------------- Setup --------------------------------------------
# renv::restore()   # Uncomment if needed

library(tidyverse)   # We'll use it lightly for comparison

cat("=== Script 03: Control Flow, Loops, and Functions ===\n\n")

# ==============================================================================
# 1. Conditional Statements (if, else, ifelse)
# ==============================================================================

# Example: Grade classification
calculate_grade <- function(score) {
  if (score >= 90) {
    return("A")
  } else if (score >= 80) {
    return("B")
  } else if (score >= 70) {
    return("C")
  } else if (score >= 60) {
    return("D")
  } else {
    return("F")
  }
}

scores <- c(95, 82, 74, 65, 58, 91)
grades <- sapply(scores, calculate_grade)

cat("Student scores and grades:\n")
print(data.frame(score = scores, grade = grades))

# Vectorized version using ifelse() - very useful in R
grades_vectorized <- ifelse(scores >= 90, "A",
                     ifelse(scores >= 80, "B",
                     ifelse(scores >= 70, "C",
                     ifelse(scores >= 60, "D", "F"))))

cat("\nUsing ifelse() (vectorized):\n")
print(grades_vectorized)

# ==============================================================================
# 2. For Loops
# ==============================================================================

cat("\n=== For Loops ===\n")

# Example: Calculate compound interest over years
principal <- 1000
rate <- 0.07
years <- 10

balance <- numeric(years + 1)
balance[1] <- principal

for (i in 1:years) {
  balance[i + 1] <- balance[i] * (1 + rate)
}

cat("Compound interest over", years, "years at", rate*100, "%:\n")
print(round(balance, 2))

# Better approach in R: Avoid loops when possible (vectorized)
years_vec <- 0:10
balance_vec <- principal * (1 + rate)^years_vec
cat("\nVectorized version:\n")
print(round(balance_vec, 2))

# ==============================================================================
# 3. While Loops
# ==============================================================================

cat("\n=== While Loops ===\n")

# Example: How many years until investment doubles?
initial <- 5000
target <- 10000
rate <- 0.08
years <- 0
current <- initial

while (current < target) {
  current <- current * (1 + rate)
  years <- years + 1
}

cat("It takes", years, "years for $", initial, "to grow to at least $", target, "at", rate*100, "% interest.\n")

# ==============================================================================
# 4. Functions (The Heart of Good R Programming)
# ==============================================================================

cat("\n=== Writing Functions ===\n")

# Good function example: Calculate summary statistics
summarize_data <- function(x, na.rm = TRUE) {
  if (!is.numeric(x)) {
    stop("Input must be numeric")
  }
  
  list(
    mean = mean(x, na.rm = na.rm),
    median = median(x, na.rm = na.rm),
    sd = sd(x, na.rm = na.rm),
    min = min(x, na.rm = na.rm),
    max = max(x, na.rm = na.rm),
    n = length(x)
  )
}

test_data <- c(23, 45, 67, 12, 89, 34, NA, 56)
result <- summarize_data(test_data)

cat("Summary of test data:\n")
print(result)

# Function with multiple arguments and default values
calculate_future_value <- function(principal, rate, years, compounds_per_year = 12) {
  principal * (1 + rate/compounds_per_year)^(compounds_per_year * years)
}

cat("\nFuture value examples:\n")
cat("Monthly compounding: $", round(calculate_future_value(1000, 0.07, 5), 2), "\n")
cat("Annual compounding:  $", round(calculate_future_value(1000, 0.07, 5, 1), 2), "\n")

# ==============================================================================
# 5. Apply Family (Better than Loops in R)
# ==============================================================================

cat("\n=== Apply Family Functions ===\n")

# Example dataset: Exam scores for multiple students
student_scores <- list(
  Alice = c(85, 92, 88),
  Bob   = c(76, 81, 79),
  Carol = c(95, 90, 97),
  Dave  = c(68, 72, 65)
)

# Using lapply and sapply
averages <- sapply(student_scores, mean)
cat("Average scores per student:\n")
print(averages)

# Using purrr (tidyverse style) - more modern and readable
library(purrr)
averages_purrr <- map_dbl(student_scores, mean)
cat("\nUsing purrr::map_dbl():\n")
print(averages_purrr)

# ==============================================================================
# 6. Exercises
# ==============================================================================

cat("\n=== Exercises ===\n")
cat("Practice these exercises below:\n\n")

# Exercise 1:
# Write a function called `classify_temperature` that takes a temperature in Celsius
# and returns "Cold", "Mild", "Warm", or "Hot" with appropriate thresholds.

# Exercise 2:
# Create a for loop that prints the first 10 Fibonacci numbers.

# Exercise 3:
# Write a function `calculate_monthly_payment` that calculates loan monthly payment
# using the formula: M = P * r * (1+r)^n / ((1+r)^n - 1)
# where P = loan amount, r = monthly interest rate, n = number of months.

# Exercise 4:
# Use lapply() or map() to calculate the standard deviation of each vector in the 
# `student_scores` list.

# Exercise 5 (Challenge):
# Write a function that takes a numeric vector and returns a list containing:
#   - mean, median, sd, min, max, and number of missing values (NAs).

# ==============================================================================
# End of Script 03
# ==============================================================================

cat("\n=== End of Script 03 ===\n")
cat("Next: Script 04 - Data Import and Export\n")