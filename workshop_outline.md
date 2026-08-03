# Data Preprocessing with RStudio and the Tidyverse: 2-hour plan

## Teaching priorities

- Keep the session hands-on: short explanation, live example, participant task.
- Use one main dataset throughout so each new verb builds on previous work.
- Treat pivoting as backup material if there is spare time.
- Use `.by` for grouped summaries instead of teaching `group_by` and `ungroup`.

## Live session

### 0-10 min: Setup and framing

- Open the RStudio project.
- Load `tidyverse`.
- Explain that preprocessing means getting data into a shape suitable for analysis.
- Introduce the shared tidyverse pattern:

```r
verb(data, instructions)
```

### 10-30 min: Reading and inspecting data

Core functions: `read_csv`, `read_excel`, `read_sav`, `glimpse`, `names`, `count`.

Use the same example data in three formats:

- `workshop_module/data/chinese_ldt.csv`
- `workshop_module/data/chinese_ldt.xlsx`
- `workshop_module/data/chinese_ldt.sav`

Also demonstrate RStudio's Import Dataset workflow and show how to copy the generated code into a script.

### 30-50 min: Selecting and filtering

Core functions: `select`, `filter`.

Supporting syntax: `starts_with`, `contains`, `==`, `!=`, `<`, `>`, `<=`, `>=`, `%in%`, `is.na`, `!is.na`.

### 50-65 min: Creating variables

Core function: `mutate`.

Examples:

```r
mutate(chinese_ldt, rt_sec = rt / 1000)
mutate(chinese_ldt, correct = response == correct_response)
```

Keep `case_when` for homework or optional extension only.

### 65-90 min: Descriptive summaries with `.by`

Core function: `summarise`.

Examples:

```r
summarise(
  chinese_ldt,
  mean_rt = mean(rt, na.rm = TRUE),
  sd_rt = sd(rt, na.rm = TRUE),
  accuracy = mean(correct, na.rm = TRUE),
  n = n()
)
```

```r
summarise(
  chinese_ldt,
  mean_rt = mean(rt, na.rm = TRUE),
  sd_rt = sd(rt, na.rm = TRUE),
  accuracy = mean(correct, na.rm = TRUE),
  n = n(),
  .by = lexicality
)
```

Use `.by = c(lexicality, response)` for a two-variable grouped summary.

### 90-120 min: Integrated live exercise

Participants complete a short script that:

- reads `data/chinese_ldt.csv` from inside the workshop module;
- inspects the data;
- selects `ppt_id`, `stimulus`, `lexicality`, `rt`, `response`, `correct_response`, and `correct`;
- filters missing or implausible RTs;
- creates `rt_sec` and `log_rt`;
- summarises RT and accuracy by `lexicality` using `.by`;
- summarises RT and accuracy by `lexicality` and `response`.

## Optional Backup / Homework

Assign `workshop_module/exercises/05_optional_pivoting_backup.R` only if useful.

Core functions: `pivot_longer`, `pivot_wider`.

Minimal backup demo:

```r
chinese_ldt_summary <- summarise(
  chinese_ldt,
  mean_rt = mean(rt, na.rm = TRUE),
  accuracy = mean(correct, na.rm = TRUE),
  n = n(),
  .by = c(ppt_id, lexicality)
)

pivot_wider(
  chinese_ldt_summary,
  names_from = lexicality,
  values_from = c(mean_rt, accuracy, n)
)
```

Optional extension topics for a follow-up workshop:

- `case_when`
- joins
- `across`
- full pipe-based preprocessing workflows
