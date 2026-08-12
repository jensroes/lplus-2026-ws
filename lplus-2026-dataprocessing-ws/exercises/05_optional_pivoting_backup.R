# Optional backup: pivoting summaries

# Use this only if there is spare time, or as homework.
# Replace the --- placeholders, run each line, and inspect the output.

library(tidyverse)

chinese_ldt <- read_csv("data/chinese_ldt.csv")

# 1. Create a participant-by-lexicality summary.
chinese_ldt_summary <- summarise(
  chinese_ldt,
  mean_rt = mean(---),
  n = n(),
  .by = c(---, ---)
)

chinese_ldt_summary

# 2. Use `pivot_wider` so words and nonwords are in separate columns.
chinese_ldt_wide <- pivot_wider(
  chinese_ldt_summary,
  names_from = ---,
  values_from = ---
)

chinese_ldt_wide

# 3. Use `pivot_longer` to make the participant summary longer again.
chinese_ldt_long <- pivot_longer(
  chinese_ldt_wide,
  cols = c(---, ---),
  names_to = "---",
  values_to = "---"
)

chinese_ldt_long

# 4. Use the long summary to calculate average participant-level RT values
# by lexicality.
summarise(
  chinese_ldt_long,
  average_rt = mean(---),
  n = n(),
  .by = ---
)
