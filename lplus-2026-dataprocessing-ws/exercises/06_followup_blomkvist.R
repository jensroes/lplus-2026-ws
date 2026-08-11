# Follow-up exercise: apply the workflow to a new dataset

# This exercise is for after the live workshop.
# It uses a different dataset, but the workflow is the same:
# read, inspect, select, filter, mutate, summarise.

# Dataset reference:
# Blomkvist, A. W., Eika, F., Rahbek, M. T., Eikhof, K. D., Hansen, M. D.,
# Sondergaard, M., Ryg, J., Andersen, S., Jorgensen, M. G., & Juul-Kristensen, B.
# (2017). Reference data on reaction time and aging using the Nintendo Wii
# Balance Board: A cross-sectional study of 354 subjects from 20 to 99 years of
# age. PLOS ONE, 12(12), e0189598.

# Replace the --- placeholders, then run each line.

library(tidyverse)

# About the data:
# Each row is one participant.
# `sex`, `age`, `meds_cat`, and `smoker` describe participant background.
# `rt_hand_d` and `rt_hand_nd` are hand reaction times for dominant and
# non-dominant sides.
# `rt_foot_d` and `rt_foot_nd` are foot reaction times for dominant and
# non-dominant sides.
# Lower reaction times mean faster responses.

# 1. Read the data from data/blomkvist.csv.
blomkvist <- read_csv("---")

# 2. Inspect the data.
glimpse(---)
names(---)

# 3. Count the categories in the background variables.
count(---, sex)
count(---, smoker)
count(---, meds_cat)

# 4. Select the variables needed for a first analysis.
blomkvist_small <- select(
  blomkvist,
  id, sex, age, meds_cat, smoker, starts_with("rt_")
)

glimpse(blomkvist_small)

# 5. Keep participants aged 18 or older.
blomkvist_small <- filter(blomkvist_small, --- >= ---)

# 6. Create a mean hand reaction-time variable.
blomkvist_small <- mutate(
  blomkvist_small,
  mean_rt_hand = (--- + ---) / 2
)

# 7. Create a mean foot reaction-time variable.
blomkvist_small <- mutate(
  blomkvist_small,
  mean_rt_foot = (--- + ---) / 2
)

# 8. Create an age-group variable.
blomkvist_small <- mutate(
  blomkvist_small,
  age_group = if_else(age < 65, "under_65", "65_plus")
)

# 9. Keep rows where the new reaction-time variables are not missing.
blomkvist_small <- filter(
  blomkvist_small,
  !is.na(---),
  !is.na(---)
)

# 10. Summarise mean hand RT and mean foot RT by age group.
summarise(
  blomkvist_small,
  mean_hand_rt = mean(---),
  mean_foot_rt = mean(---),
  n = n(),
  .by = ---
)

# 11. Summarise mean hand RT by age group and sex.
summarise(
  blomkvist_small,
  mean_hand_rt = mean(---),
  n = n(),
  .by = c(---, ---)
)

# Optional extension: reshape the four raw reaction-time columns.

blomkvist_long <- pivot_longer(
  blomkvist_small,
  cols = starts_with("rt_"),
  names_to = "measure",
  values_to = "rt"
)

blomkvist_long

# Use the long data to calculate one summary per reaction-time measure.
summarise(
  blomkvist_long,
  mean_rt = mean(---),
  n = n(),
  .by = ---
)
