# ==============================================================================
# 02_R_Data_Structures_Deep_Dive.R
# R Curriculum
#
# Topic: Deep Dive into R Data Structures
# 
# This script builds directly on Script 01 (Fundamentals).
# We explore the main data structures in R using simple, general examples.
# ==============================================================================

# --------------------------- Setup --------------------------------------------
# Run this if needed:
# renv::restore()

library(tidyverse)   # We'll use it lightly for comparison later

cat("=== Script 02: Data Structures Deep Dive ===\n\n")

# ==============================================================================
# 1. Atomic Vectors (The Building Blocks of R)
# ==============================================================================

# Numeric vector - Student exam scores (out of 100)
exam_scores <- c(85, 92, 78, 95, 88, 76, 91, 82)
print("Student exam scores:")
print(exam_scores)

# Character vector - Department names
departments <- c("Marketing", "Sales", "HR", "Finance", "IT", "Operations", "R&D")
print("\nDepartments:")
print(departments)

# Logical vector - Did the student pass the course?
passed <- c(TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE)
print("\nPassed the course?:")
print(passed)

# Basic properties and operations
cat("\nVector properties and operations:\n")
cat("Type of exam_scores:", typeof(exam_scores), "\n")
cat("Length of departments:", length(departments), "\n")
cat("Mean exam score:", mean(exam_scores), "\n")
cat("Number of students who passed:", sum(passed), "\n")
cat("Any failures?", any(!passed), "\n")

# ==============================================================================
# 2. Factors (For Categorical Data)
# ==============================================================================

# Convert departments to factor
dept_factor <- factor(departments)

print("\nDepartments as factor:")
print(dept_factor)
cat("Factor levels:", levels(dept_factor), "\n")

# Ordered factor - Customer satisfaction rating
satisfaction <- c("Low", "Medium", "High", "Medium", "Low", "High", "Medium", "High")
satisfaction_factor <- factor(satisfaction, 
                              levels = c("Low", "Medium", "High"), 
                              ordered = TRUE)

print("\nCustomer satisfaction as ordered factor:")
print(satisfaction_factor)

# ==============================================================================
# 3. Matrices (2D Homogeneous Data)
# ==============================================================================

# Sales matrix: rows = products, columns = quarters
sales_matrix <- matrix(
  c(1200, 1350, 1480, 1620,   # Product A
    980,  1050, 1120, 1250,   # Product B
    750,  820,  910,  980),   # Product C
  nrow = 3, 
  byrow = TRUE,
  dimnames = list(
    c("Product_A", "Product_B", "Product_C"),
    c("Q1", "Q2", "Q3", "Q4")
  )
)

print("\nQuarterly Sales Matrix:")
print(sales_matrix)

cat("\nAverage sales per quarter:\n")
print(colMeans(sales_matrix))

cat("\nAverage sales per product:\n")
print(rowMeans(sales_matrix))

# ==============================================================================
# 4. Lists (Heterogeneous Containers)
# ==============================================================================

# A list representing a student record
student_record <- list(
  student_id = "STU-2025001",
  name = "Alex Rivera",
  age = 22,
  courses = c("Statistics", "Programming", "Economics", "Data Visualization"),
  grades = c(88, 94, 79, 91),
  graduated = FALSE,
  enrollment_date = as.Date("2024-09-01")
)

print("\nStudent record as list:")
str(student_record)

# Accessing elements
cat("\nAccessing list elements:\n")
cat("Student name:", student_record$name, "\n")
cat("Number of courses:", length(student_record$courses), "\n")
cat("Average grade:", mean(student_record$grades), "\n")

# ==============================================================================
# 5. Data Frames (Most Important for Data Analysis)
# ==============================================================================

# Create a data frame of student information
students_df <- data.frame(
  student_id = paste0("STU-", sprintf("%04d", 1:8)),
  exam_score = exam_scores,
  department = departments,
  dept_factor = dept_factor,
  passed = passed,
  satisfaction = satisfaction_factor,
  stringsAsFactors = FALSE
)

print("\nStudent Information Data Frame:")
print(students_df)

cat("\nSummary of the dataset:\n")
summary(students_df)

cat("\nStructure of the data frame:\n")
str(students_df)

# ==============================================================================
# 6. Exercises
# ==============================================================================

cat("\n=== Exercises ===\n")
cat("Practice these exercises below the script:\n\n")

# Exercise 1:
# Create a numeric vector called `monthly_temperatures` with 12 values 
# representing average monthly temperatures in a city.

# Exercise 2:
# Create a character vector called `product_categories` with at least 6 categories.
# Then convert it into a factor.

# Exercise 3:
# Create a matrix that shows monthly expenses for 4 different departments 
# across 6 months.

# Exercise 4:
# Create a list called `employee_profile` that contains:
#   - employee name, age, position, skills (as vector), and salary.

# Exercise 5:
# Add a new column called `letter_grade` to `students_df` that assigns:
#   A (90+), B (80-89), C (70-79), D (60-69), F (below 60).

# Exercise 6 (Challenge):
# Create a data frame with information about 10 books including title, author,
# publication year, pages, and genre. Then display its summary.

# ==============================================================================
# End of Script 02
# ==============================================================================

cat("\n=== End of Script 02 ===\n")
cat("Great job! Next up: Script 03 - Control Flow and Functions\n") 