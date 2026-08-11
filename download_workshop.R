repo_zip <- "https://github.com/jensroes/lplus-2026-ws/archive/refs/heads/main.zip"
workshop_folder <- "lplus-2026-dataprocessing-ws"

if (dir.exists(workshop_folder)) {
  stop(
    "The folder '", workshop_folder, "' already exists. ",
    "Rename or remove it before running this download script again.",
    call. = FALSE
  )
}

tmp_dir <- tempfile("lplus-2026-ws-")
dir.create(tmp_dir)

zip_file <- file.path(tmp_dir, "lplus-2026-ws.zip")
download.file(repo_zip, zip_file, mode = "wb")
unzip(zip_file, exdir = tmp_dir)

repo_folder <- file.path(tmp_dir, "lplus-2026-ws-main")

file.rename(
  file.path(repo_folder, workshop_folder),
  workshop_folder
)

file.copy(
  file.path(repo_folder, "slides.html"),
  file.path(workshop_folder, "slides.html"),
  overwrite = TRUE
)

unlink(tmp_dir, recursive = TRUE)

message("Downloaded workshop materials.")
message("Open ", workshop_folder, "/slides.html and ", workshop_folder, "/", workshop_folder, ".Rproj")
