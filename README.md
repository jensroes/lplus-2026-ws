# lplus-2026-ws

Workshop materials for the data preprocessing with RStudio and tidyverse session.

## Participant download

Participants need:

- `slides.html`
- `lplus-2026-dataprocessing-ws/`

They can download both by running this in R:

```r
source(url("https://raw.githubusercontent.com/jensroes/lplus-2026-ws/main/download_workshop.R"))
```

The workshop folder contains:

- `lplus-2026-dataprocessing-ws.Rproj`
- `data/`
- `exercises/`
- `README.md`

## Repository structure

- `lplus-2026-dataprocessing-ws/`: self-contained participant-facing workshop folder
- `slides.html`: rendered workshop slides
- `slides.Rmd`: working copy of the slide source, used to render `slides.html`
- `slides.css` and `assets/`: slide styling and assets
- `lplus-2026-dataprocessing-ws/exercises/`: exercise scripts
- `lplus-2026-dataprocessing-ws/data/`: active example data
- `zzz/`: archived old materials and internal notes kept locally, ignored by Git
