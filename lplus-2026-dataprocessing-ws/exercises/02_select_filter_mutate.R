# Exercise 2: `select`, `filter`, `mutate`

# Replace the --- placeholders, then run each line.

library(tidyverse)

chinese_ldt <- read_csv("data/chinese_ldt.csv")

# Tidyverse functions return a new data frame.
# To use the changed data later, assign the result with <-.

# 1. Drop the variables we do not need for the live exercises.
chinese_ldt_small <- select(chinese_ldt, -word_eng, -rt_sec)

# Inspect the new data.
glimpse(---)

# 2. Select participant ID, stimulus, and all variables containing "response".
# This line prints a result, but does not save it.
select(chinese_ldt, ---, ---, contains("---"))

# 3. Keep trials with reaction times longer than 2000 ms.
# This line also prints a result, but does not save it.
filter(chinese_ldt_small, --- > ---)

# 4. Keep word trials only.
filter(chinese_ldt_small, --- == "---")

# 5. Keep Chinese-script trials only.
filter(chinese_ldt_small, --- == "---")

# 6. Keep rows where reaction time is not missing.
chinese_ldt_small <- filter(chinese_ldt_small, !is.na(---))

# 7. Create a reaction time variable in seconds.
chinese_ldt_small <- mutate(
  chinese_ldt_small,
  rt_sec = --- / 1000
)

# Inspect the new variable.
glimpse(chinese_ldt_small)

# 8. Create a log-transformed reaction time.
chinese_ldt_small <- mutate(
  chinese_ldt_small,
  log_rt = log(---)
)

# 9. Create a variable that identifies trials slower than the average trial.
chinese_ldt_small <- mutate(
  chinese_ldt_small,
  slow_trial = rt > mean(---)
)

# Check your result.
chinese_ldt_small
