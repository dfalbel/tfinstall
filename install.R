library(tfinstall)

version <- Sys.getenv("TENSORFLOW_VERSION")
method <- Sys.getenv("INSTALL_METHOD")

if (method=="conda") {
  if (R.Version()$os=="linux-gnu") {
    install_anaconda_linux()
  } else if (grepl("darwin", R.Version()$os)) {
    install_anaconda_mac()
  }
}

if (method == "virtualenv" && grepl("darwin", R.Version()$os)) {
  install_virtualenv_mac()
} else if (method == "virtualenv" && R.Version()$os=="linux-gnu") {
  install_virtualenv_linux()
}

if (grepl("darwin", R.Version()$os)) {
  Sys.setenv(RETICULATE_PYTHON = "/usr/local/bin/python3")
  Sys.setenv(PIP_USER="y")
}

if (Sys.getenv("TRAVIS") == "true") {
  install_tensorflow(version = version, method = method, restart_session = FALSE)
} else if (Sys.getenv("APPVEYOR") == "True") {

  registry_versions <- reticulate:::py_versions_windows()
  anaconda_registry_versions <- subset(registry_versions,
                                       registry_versions$type == "Anaconda")
  print(registry_versions)
  print(anaconda_registry_versions)
  print(anaconda_registry_versions$install_path)

  conda <- reticulate::conda_binary(file.path(anaconda_registry_versions$install_path[1], "Scripts", "conda.exe"))
  conda_envs <- suppressWarnings(system2(conda, args = c("info",
                                                         "--json"), stdout = TRUE, stderr = FALSE))
  status <- attr(conda_envs, "status")
  if (!is.null(status)) {
    if (getOption("reticulate.conda_diagnostics", default = FALSE)) {
      errmsg <- attr(status, "errmsg")
      warning("Error ", status, " occurred running ", conda,
              " ", errmsg)
    }
    return(data.frame(name = character(), python = character(),
                      stringsAsFactors = FALSE))
  }
  if (length(conda_envs) > 0 && grepl("Anaconda Cloud", conda_envs[[1]],
                                      fixed = TRUE))

  conda_envs <- conda_envs[-1]
  print(conda_envs)
  conda_envs <- jsonlite::fromJSON(conda_envs)$envs
  print(conda_envs)
  conda_envs <- Filter(file.exists, conda_envs)
  print(conda_envs)


  print(reticulate:::python_environment_versions())

  install_tensorflow(version = version, method = method, restart_session = FALSE)
}


