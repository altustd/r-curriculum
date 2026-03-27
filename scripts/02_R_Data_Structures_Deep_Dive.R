# ==============================================================================
# 02_R_Data_Structures_Deep_Dive.R
# R Curriculum - Offshore Platform Aging Study
# 
# Topic: Deep Dive into R Data Structures
# 
# This script builds directly on Script 01.
# We explore the main data structures in R and apply them to offshore platform
# inspection and corrosion data.
# ==============================================================================

# --------------------------- Setup & Reminder ---------------------------------
# Make sure renv is active and packages are restored
# renv::restore()   # Run this if needed

# Load tidyverse for later comparison (we'll mostly use base R in this script)
library(tidyverse)

cat("=== Script 02: Data Structures Deep Dive ===\n\n")

# ==============================================================================
# 1. Atomic Vectors (The Foundation of R)
# ==============================================================================

# Numeric vector - Wall thickness measurements (mm) from different platform members
thickness_mm <- c(12.5, 11.8, 13.2, 10.9, 12.1, 9.8, 14.5)
print("Wall thickness measurements (mm):")
print(thickness_mm)

# Character vector - Marine zones where inspections were done
marine_zones <- c("Atmospheric", "Splash", "Immersion", "Splash", "Atmospheric", "Immersion", "Splash")
print("\nMarine zones:")
print(marine_zones)

# Logical vector - Is the member considered critical?
is_critical <- c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE)
print("\nCritical structural members:")
print(is_critical)

# Check vector properties
cat("\nVector properties:\n")
cat("Type of thickness_mm:", typeof(thickness_mm), "\n")
cat("Length of marine_zones:", length(marine_zones), "\n")
cat("Class of is_critical:", class(is_critical), "\n")

# Common operations on atomic vectors
cat("\nBasic operations:\n")
cat("Mean wall thickness:", mean(thickness_mm), "mm\n")
cat("Number of immersion zone inspections:", sum(marine_zones == "Immersion"), "\n")
cat("Any critical members?", any(is_critical), "\n")

# ==============================================================================
# 2. Factors (Categorical Data)
# ==============================================================================

# Convert marine_zones to factor (very important for statistical modeling later)
zone_factor <- factor(marine_zones, 
                      levels = c("Atmospheric", "Splash", "Immersion"),
                      ordered = FALSE)

print("\nMarine zones as factor:")
print(zone_factor)

cat("\nFactor levels:", levels(zone_factor), "\n")
cat("Number of levels:", nlevels(zone_factor), "\n")

# Ordered factor example - Corrosion severity
severity <- c("Low", "Medium", "High", "Medium", "Low", "High", "Medium")
severity_factor <- factor(severity, 
                          levels = c("Low", "Medium", "High"), 
                          ordered = TRUE)

print("\nCorrosion severity as ordered factor:")
print(severity_factor)

# ==============================================================================
# 3. Matrices (2D Homogeneous Data)
# ==============================================================================

# Create a matrix of corrosion rates (rows = platforms, columns = zones)
corrosion_rates <- matrix(
  c(0.05, 0.25, 0.45,    # Platform A
    0.08, 0.30, 0.52,    # Platform B
    0.03, 0.18, 0.38),   # Platform C
  nrow = 3, 
  byrow = TRUE,
  dimnames = list(
    c("Platform_A", "Platform_B", "Platform_C"),
    c("Atmospheric", "Splash", "Immersion")
  )
)

print("\nCorrosion rate matrix (mm/year):")
print(corrosion_rates)

# Matrix operations
cat("\nAverage corrosion rate per zone:\n")
print(colMeans(corrosion_rates))

cat("\nAverage corrosion rate per platform:\n")
print(rowMeans(corrosion_rates))

# ==============================================================================
# 4. Lists (Heterogeneous Data - Very Flexible)
# ==============================================================================

# A list can hold different types of data together - perfect for inspection reports
platform_inspection <- list(
  platform_id = "Platform_A",
  age_years = 28,
  wall_thickness = thickness_mm,
  marine_zones = zone_factor,
  corrosion_severity = severity_factor,
  notes = "Significant splash zone corrosion observed. Recommend detailed UT scan.",
  last_inspection_date = as.Date("2025-06-15")
)

print("\nFull platform inspection list:")
str(platform_inspection)   # str() is very useful with lists

# Accessing list elements
cat("\nAccessing list elements:\n")
cat("Platform ID:", platform_inspection$platform_id, "\n")
cat("Age:", platform_inspection$age_years, "years\n")
cat("Notes:", platform_inspection$notes, "\n")

# ==============================================================================
# 5. Data Frames (The Most Important Structure for Data Analysis)
# ==============================================================================

# Create a data frame from our vectors - this is how real inspection data is stored
inspection_df <- data.frame(
  member_id = paste0("MEM-", sprintf("%03d", 1:7)),
  thickness_mm = thickness_mm,
  marine_zone = marine_zones,
  zone_factor = zone_factor,
  is_critical = is_critical,
  severity = severity_factor,
  stringsAsFactors = FALSE   # We already made factors manually
)

print("\nOffshore Platform Inspection Data Frame:")
print(inspection_df)

# Basic exploration
cat("\nSummary of the data frame:\n")
summary(inspection_df)

cat("\nStructure of the data frame:\n")
str(inspection_df)

# ==============================================================================
# 6. Exercises
# ==============================================================================

cat("\n=== Exercises ===\n")
cat("Complete these exercises in the space below:\n\n")

# Exercise 1: 
# Create a numeric vector called `anode_life` with 8 values representing 
# remaining life (in years) of sacrificial anodes on different members.

# Exercise 2:
# Convert the `marine_zone` column in `inspection_df` to a factor 
# with proper ordered levels if appropriate.

# Exercise 3:
# Create a list called `platform_summary` that contains:
#   - platform name
#   - number of members inspected
#   - average wall thickness
#   - most common marine zone (use table() or similar)

# Exercise 4:
# Add a new column to `inspection_df` called `remaining_thickness` 
# that calculates current thickness minus expected future corrosion 
# (assume 0.3 mm/year for 5 years).

# Exercise 5 (Challenge):
# Create a 4x3 matrix showing predicted corrosion loss for 4 platforms 
# across 3 zones over the next 10 years.

# ==============================================================================
# End of Script 02
# ==============================================================================

cat("\n=== End of Script 02 ===\n")
cat("Next: Move to Script 03 - Control Flow and Functions\n")