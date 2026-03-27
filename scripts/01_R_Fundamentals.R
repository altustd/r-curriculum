# =============================================================================
# SCRIPT 1: R Fundamentals - Getting Started
# Goal: Master the absolute basics that EVERYTHING else in R builds upon
# Run this entire script line-by-line in RStudio
# =============================================================================

# 1. Check your R version and environment -------------------------------------
print(R.version.string)          # e.g. "R version 4.3.2 (2023-10-31)"
sessionInfo()                    # shows loaded packages, platform, etc.

# 2. Basic arithmetic and assignment --------------------------------------------
a <- 5 + 3          # assignment with <- (traditional R style)
b <- 10 / 2
result <- a * b
print(result)       # 40

# Vectorized operations (R's superpower)
vec1 <- c(1, 2, 3, 4, 5)           # numeric vector
vec2 <- c(10, 20, 30, 40, 50)
vec_sum <- vec1 + vec2              # element-wise addition
print(vec_sum)

# 3. All major data types & structures ---------------------------------------
# Atomic vectors
numeric_vec   <- c(1.2, 3.4, 5.6)
character_vec <- c("apple", "banana", "cherry")
logical_vec   <- c(TRUE, FALSE, TRUE)
integer_vec   <- 1:10                       # special integer sequence
factor_vec    <- factor(c("low", "med", "high", "med"))

# Matrix
mat <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
print(mat)

# Array (3-dimensional example)
arr <- array(1:24, dim = c(2, 3, 4))
print(arr)

# List (can hold mixed types)
my_list <- list(
  name = "Troy",
  age = 35,
  scores = c(95, 87, 92),
  active = TRUE
)
print(my_list)

# Data frame (the most important structure for data analysis)
df <- data.frame(
  id       = 1:5,
  name     = c("Alice", "Bob", "Charlie", "Dana", "Eve"),
  age      = c(25, 30, 35, 28, 40),
  salary   = c(55000, 62000, 78000, 45000, 91000),
  employed = c(TRUE, TRUE, FALSE, TRUE, TRUE)
)
print(df)

# 4. Subsetting / indexing ----------------------------------------------------
# Vectors
vec1[3]                  # 3rd element
vec1[c(1, 3, 5)]         # multiple elements
vec1[vec1 > 3]           # logical subsetting

# Data frames
df$name                  # column by name
df[, "age"]              # column by name (vector)
df[3, ]                  # entire 3rd row
df[df$age > 30, ]        # rows where age > 30
df[1:3, c("name", "salary")]

# Lists
my_list$scores           # by name
my_list[[3]]             # by position (extracts the element itself)

# 5. Missing values (NA) ------------------------------------------------------
x <- c(1, 2, NA, 4, 5)
mean(x)                  # returns NA
mean(x, na.rm = TRUE)    # 3

is.na(x)                 # detects NAs
x[is.na(x)] <- 999       # replace NAs (example)

# 6. Basic functions you write yourself ---------------------------------------
add_numbers <- function(x, y) {
  return(x + y)
}
add_numbers(7, 11)       # 18

# Function with default argument and vector support
summarize_vec <- function(vec, na.rm = TRUE) {
  list(
    mean   = mean(vec, na.rm = na.rm),
    median = median(vec, na.rm = na.rm),
    min    = min(vec, na.rm = na.rm),
    max    = max(vec, na.rm = na.rm),
    length = length(vec)
  )
}
summarize_vec(c(10, 20, NA, 40))

# 7. Getting help -------------------------------------------------------------
?mean                    # opens documentation for mean()
help("data.frame")       # same thing
example(mean)            # runs built-in examples

# 8. First quick visualization ------------------------------------------------
plot(vec1, vec2, 
     main = "Simple Scatter Plot", 
     xlab = "Vector 1", 
     ylab = "Vector 2",
     col = "blue", pch = 19)

hist(df$salary, 
     main = "Salary Distribution", 
     col = "lightgreen", 
     breaks = 5)

# =============================================================================
# End of Script 1
# Congratulations! You now understand the core building blocks of R.
# Next script (02_Data_Structures_Deep_Dive.R) will go much deeper into 
# coercion, recycling rules, attributes, and more advanced subsetting.
# =============================================================================

cat("\n=== Script 1 completed successfully! ===\n")
cat("You have now seen vectors, matrices, lists, data frames, functions, and basic plotting.\n")
cat("Save this script and keep it as your reference.\n")