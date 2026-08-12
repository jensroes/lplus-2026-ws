# Exercise 4: integrated live exercise

# Replace the --- placeholders, then run each line.

library(tidyverse)

# In a workflow, assign each changed data frame if you want to use it later.

# 1. Read the data.
chinese_ldt <- read_csv("---")

# 2. Inspect the data.
glimpse(---)

# 3. Drop the variables we do not need for this workflow.
chinese_ldt_small <- select(
  chinese_ldt,
  -word_eng, -rt_sec
)

# 4. Keep only rows with non-missing reaction time.
chinese_ldt_small <- filter(chinese_ldt_small, !is.na(---))

# 5. Keep plausible RTs: 300 ms or slower and below 5000 ms.
chinese_ldt_small <- filter(chinese_ldt_small, --- >= ---, --- < ---)

# 6. Create RT in seconds and log RT.
chinese_ldt_small <- mutate(
  chinese_ldt_small,
  rt_sec = --- / 1000,
  log_rt = log(---)
)

# 7. Summarise RT and accuracy by script and lexicality.
lexicality_summary <- summarise(
  chinese_ldt_small,
  mean_rt = mean(---),
  median_rt = median(---),
  accuracy = mean(---),
  n = n(),
  .by = c(---, ---)
)

lexicality_summary

# 8. Summarise RT and accuracy by script, lexicality, and response.
condition_summary <- summarise(
  chinese_ldt_small,
  mean_rt = mean(---),
  accuracy = mean(---),
  n = n(),
  .by = c(---, ---, ---)
)

condition_summary
