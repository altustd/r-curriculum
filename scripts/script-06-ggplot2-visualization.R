# ==============================================================================
# Script 06: Data Visualization with ggplot2
# 
# Purpose: Learn how to create elegant, publication-quality plots using ggplot2.
# This script builds directly on Script 05 (dplyr and tidyr).
#
# Key concepts: Grammar of Graphics, geoms, aesthetics, faceting, themes, and saving plots.
# ==============================================================================

library(ggplot2)
library(dplyr)

# Set a clean theme for all plots in this script
theme_set(theme_minimal(base_size = 12))

# ------------------------------------------------------------------------------
# 1. Prepare example data
# ------------------------------------------------------------------------------
data <- mtcars %>%
  mutate(
    cyl = factor(cyl),                    # Make cylinders categorical
    transmission = factor(am, labels = c("Automatic", "Manual"))
  )

glimpse(data)

# ------------------------------------------------------------------------------
# 2. Basic Scatter Plot
# ------------------------------------------------------------------------------
ggplot(data, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3.5, alpha = 0.85) +
  labs(
    title = "Fuel Efficiency vs. Car Weight",
    subtitle = "mtcars dataset",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon (mpg)",
    color = "Cylinders"
  )

# ------------------------------------------------------------------------------
# 3. Scatter Plot with Trend Lines
# ------------------------------------------------------------------------------
ggplot(data, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 1) +
  labs(title = "Fuel Efficiency vs Weight with Linear Trends")

# ------------------------------------------------------------------------------
# 4. Bar Plot with Summary Statistics
# ------------------------------------------------------------------------------
avg_mpg_by_cyl <- data %>%
  group_by(cyl) %>%
  summarise(
    mean_mpg = mean(mpg),
    sd_mpg = sd(mpg),
    .groups = "drop"
  )

ggplot(avg_mpg_by_cyl, aes(x = cyl, y = mean_mpg, fill = cyl)) +
  geom_col(width = 0.7) +
  geom_errorbar(aes(ymin = mean_mpg - sd_mpg, ymax = mean_mpg + sd_mpg),
                width = 0.3) +
  labs(title = "Average MPG by Number of Cylinders",
       y = "Mean Miles per Gallon") +
  theme(legend.position = "none")

# ------------------------------------------------------------------------------
# 5. Boxplot with Individual Points
# ------------------------------------------------------------------------------
ggplot(data, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot(alpha = 0.75) +
  geom_jitter(width = 0.2, size = 2, alpha = 0.6) +
  labs(title = "MPG Distribution by Cylinder Count") +
  theme(legend.position = "none")

# ------------------------------------------------------------------------------
# 6. Faceting - Small Multiples
# ------------------------------------------------------------------------------
ggplot(data, aes(x = wt, y = mpg)) +
  geom_point(size = 3, color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ cyl, ncol = 3) +
  labs(title = "Fuel Efficiency by Weight — Faceted by Cylinders")

# ------------------------------------------------------------------------------
# 7. Fully Customized Plot + Saving
# ------------------------------------------------------------------------------
final_plot <- ggplot(data, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 4, alpha = 0.85) +
  geom_smooth(method = "loess", se = FALSE, linewidth = 1.1) +
  scale_color_brewer(palette = "Set2") +
  labs(
    title = "Relationship Between Car Weight and Fuel Efficiency",
    subtitle = "Colored by number of cylinders",
    caption = "Source: mtcars dataset • r-curriculum Project",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5))

# Save the plot
ggsave("outputs/mpg_vs_weight.png", final_plot, width = 10, height = 7, dpi = 300, bg = "white")

print(final_plot)

# ==============================================================================
# Exercises (Practice these!)
# 
# 1. Create a scatter plot of `hp` vs `mpg`, colored by `transmission`. Add a trend line.
# 2. Make a bar plot showing count of cars by `cyl` and `transmission` (use dplyr first).
# 3. Create a faceted histogram of `disp` (engine displacement), faceted by `cyl`.
# 4. Build your own customized boxplot of `mpg` by `cyl` and save it as PNG and PDF.
#
# Tip: Always do data wrangling with dplyr before feeding data into ggplot().
# ==============================================================================

cat("\n✅ Script 06 - ggplot2 visualization completed successfully!\n")
cat("Next recommended: Script 07 - Advanced Data Import/Export and lubridate\n")
