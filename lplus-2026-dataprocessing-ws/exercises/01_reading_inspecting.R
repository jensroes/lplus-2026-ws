# Exercise 1: reading and inspecting data

# Replace the --- placeholders, then run each line.
# Before you start, open the provided .Rproj file in RStudio.
# The paths below assume that the project folder is the working directory.

library(tidyverse)
library(readxl)
library(haven)

# 1. Check where R is currently looking for files.
getwd()

# 2. Check that the data file exists from the current working directory.
file.exists("data/chinese_ldt.csv")

# If this returns FALSE, open the .Rproj file and try again.

# 3. Read the CSV file.
chinese_ldt_csv <- read_csv("---")

# 4. Inspect the data.
glimpse(---)

# 5. Show the variable names.
names(---)

# 6. Count the categories in lexicality.
count(---, ---)

# 7. Count the combinations of script and lexicality.
count(---, ---, ---)

# 8. Read the same data from Excel.
chinese_ldt_excel <- read_excel("---")

# 9. Read the same data from SPSS.
chinese_ldt_sav <- read_sav("---")

# 10. Check that the imported datasets have the same dimensions.
dim(chinese_ldt_csv)
dim(chinese_ldt_excel)
dim(chinese_ldt_sav)

# 11. Use RStudio's Import Dataset menu with data/chinese_ldt.xlsx.
# Paste the generated code below.
