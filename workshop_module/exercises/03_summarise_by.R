# Exercise 3: `summarise` with `.by`

# Replace the --- placeholders, then run each line.

library(tidyverse)

chinese_ldt <- read_csv("data/chinese_ldt.csv")

# Select a smaller data frame for this exercise.
chinese_ldt_small <- select(
  chinese_ldt,
  ppt_id, stimulus, script, lexicality, word_eng, response, rt, correct
)

# Remove missing reaction times.
chinese_ldt_small <- filter(chinese_ldt_small, !is.na(rt))

# 1. Calculate overall mean RT, SD RT, accuracy, and number of observations.
summarise(
  chinese_ldt_small,
  mean_rt = mean(---),
  sd_rt = sd(---),
  accuracy = mean(---),
  n = n()
)

# 2. Calculate the same summary by lexicality.
summarise(
  chinese_ldt_small,
  mean_rt = mean(---),
  sd_rt = sd(---),
  accuracy = mean(---),
  n = n(),
  .by = ---
)

# 3. Calculate mean RT and accuracy by script.
summarise(
  chinese_ldt_small,
  mean_rt = mean(---),
  accuracy = mean(---),
  n = n(),
  .by = ---
)

# 4. Calculate mean RT and accuracy by script and lexicality.
summarise(
  chinese_ldt_small,
  mean_rt = mean(---),
  accuracy = mean(---),
  n = n(),
  .by = c(---, ---)
)

# 5. Create a participant-level summary.
ppt_summary <- summarise(
  chinese_ldt_small,
  mean_rt = mean(---),
  accuracy = mean(---),
  n = n(),
  .by = ---
)

ppt_summary
