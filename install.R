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

if (Sys.getenv("TRAVIS") == "true" && R.Version()$os=="linux-gnu") {
  install_tensorflow(version = version, method = method, restart_session = FALSE)
} else if (Sys.getenv("APPVEYOR") == "True") {
  install_tensorflow(version = version, method = method, restart_session = FALSE,
                     conda = "C:\\Miniconda36-x64\\Scripts\\conda.exe")
}


