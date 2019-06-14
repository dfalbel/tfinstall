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
}

if (Sys.getenv("TRAVIS") == "true" || Sys.getenv("APPVEYOR") == "True")
  install_tensorflow(version = version, method = method, restart_session = FALSE)
