local({
  repo_zip <- "https://github.com/jensroes/lplus-2026-ws/archive/refs/heads/main.zip"
  workshop_folder <- "lplus-2026-dataprocessing-ws"
  save_location <- normalizePath(getwd(), winslash = "/", mustWork = TRUE)
  workshop_path <- file.path(save_location, workshop_folder)

  if (dir.exists(workshop_path)) {
    stop(
      "The folder '", workshop_folder, "' already exists at:\n",
      workshop_path, "\n\n",
      "Rename or remove it before running this download script again.",
      call. = FALSE
    )
  }

  tmp_dir <- tempfile("lplus-2026-ws-")
  dir.create(tmp_dir)
  on.exit(unlink(tmp_dir, recursive = TRUE), add = TRUE)

  zip_file <- file.path(tmp_dir, "lplus-2026-ws.zip")
  download.file(repo_zip, zip_file, mode = "wb")
  unzip(zip_file, exdir = tmp_dir)

  repo_folder <- file.path(tmp_dir, "lplus-2026-ws-main")

  moved_workshop_folder <- file.rename(
    file.path(repo_folder, workshop_folder),
    workshop_path
  )

  if (!moved_workshop_folder) {
    stop("Could not create the workshop folder at:\n", workshop_path, call. = FALSE)
  }

  copied_slides <- file.copy(
    file.path(repo_folder, "slides.html"),
    file.path(workshop_path, "slides.html"),
    overwrite = TRUE
  )

  if (!copied_slides) {
    stop("Could not copy slides.html into:\n", workshop_path, call. = FALSE)
  }

  message("Thank you for downloading the L+ 2026 data processing workshop materials.")
  message("")
  message("The folder has been saved here:")
  message(workshop_path)
  message("")
  message("To start the workshop, open:")
  message(file.path(workshop_path, paste0(workshop_folder, ".Rproj")))
  message("")
  message("I hope you enjoy the data processing workshop with Jens Roeser.")
  message("")

  invisible(NULL)
})
