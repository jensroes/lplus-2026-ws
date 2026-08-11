# Optional backup: pivoting summaries

# Use this only if there is spare time, or as homework.
# Replace the --- placeholders, run each line, and inspect the output.

library(tidyverse)

chinese_ldt <- read_csv("data/chinese_ldt.csv")

# Note on the other example dataset used while preparing these materials:
# Blomkvist et al. (2017) contains reaction-time and participant-background data:
# "Reference data on reaction time and aging using the
# Nintendo Wii Balance Board: A cross-sectional study of 354 subjects from 20 to
# 99 years of age", PLoS ONE, 12(12), e0189598.

# 1. Create a participant-by-lexicality summary.
chinese_ldt_summary <- summarise(
  chinese_ldt,
  mean_rt = mean(---),
  accuracy = mean(---),
  n = n(),
  .by = c(---, ---)
)

chinese_ldt_summary

# 2. Use `pivot_wider` so words and nonwords are in separate columns.
chinese_ldt_wide <- pivot_wider(
  chinese_ldt_summary,
  names_from = ---,
  values_from = c(---, ---, ---)
)

chinese_ldt_wide

# 3. Use `pivot_longer` to make the participant summary longer again.
chinese_ldt_long <- pivot_longer(
  chinese_ldt_summary,
  cols = c(---, ---),
  names_to = "measure",
  values_to = "value"
)

chinese_ldt_long

# 4. Use the long summary to calculate average participant-level values
# for mean RT and accuracy by lexicality.
summarise(
  chinese_ldt_long,
  average_value = mean(---),
  n = n(),
  .by = c(---, ---)
)
