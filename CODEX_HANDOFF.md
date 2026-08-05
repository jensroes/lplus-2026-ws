# Codex Handoff

Continue work in `/home/jensroes/GitRepositories/lplus-2026-ws`.

## Project Context

This project contains materials for a 2-hour conference workshop on data preprocessing in RStudio/tidyverse.

The main slide deck is `slides.Rmd`.

The participant-facing folder is `workshop_module/`. Only `workshop_module/` should contain participant materials:

- `lplus-2026-ws.Rproj`
- `README.md`
- `data/chinese_ldt.csv`
- `data/chinese_ldt.xlsx`
- `data/chinese_ldt.sav`
- `exercises/*.R`

Archived old materials are in `zzz/`, and `zzz/` is listed in `.gitignore`.

## Preferences

- Use `.by` instead of `group_by` / `ungroup`.
- Function names in prose should be written like `select`, not `select()`.
- Pivoting is optional backup material.
- Do not call the LDT dataset "Sandy"; call it `chinese_ldt`.
- Keep slides clean: avoid custom text boxes except the overview pipeline.
- Keep the overview pipeline boxes.
- Exercises should be beginner-friendly and avoid lots of typing of variable names.
- Slide examples should usually be `eval=FALSE` to avoid crowded R output.
- `na.rm = TRUE` was removed unless really needed.
- Function names in code blocks should appear blue; see `assets/code-highlight.js` and `slides.css`.

## Current Structure

- `slides.Rmd`, `slides.css`, and `assets/` are for the presenter/root deck.
- `workshop_module/` is what participants download and use.
- `README.md` explains the repository layout.
- `.gitignore` includes `.Rhistory`, `.RData`, `.Rproj.user/`, and `zzz/`.

## Important Current Content

- Intro slide includes Jens Roeser's research/teaching bio.
- There is a placeholder GitHub download slide.
- GitHub user is `jensroes`; repo has not yet been created.
- Likely repo name: `lplus-2026-ws`.
- Slide 33 recommended reading uses two columns and APA references for R4DS and Andrews.
- Slide 34 is a two-column function overview table titled "Apply This Workflow To Your Own Data".
- The slide deck uses actual Chinese lexical decision task data and real stimulus images from `assets/ldt`.
- The active participant data are only in `workshop_module/data`.
- The exercise scripts are only in `workshop_module/exercises`.

## Known Limitation

Pandoc was unavailable in the previous Codex environment, so `slides.html` may be stale. Render `slides.Rmd` locally in RStudio/Pandoc before sharing.

## Likely Next Tasks

- Create the GitHub repo and push the project.
- Finalize the GitHub download slide once the repo URL exists.
- Render slides and check slide spacing visually.
