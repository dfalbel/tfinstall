library(tfinstall)

version <- Sys.getenv("TENSORFLOW_VERSION")
method <- Sys.getenv("INSTALL_METHOD")

cat("Available config ---------------\n")
print(reticulate::py_discover_config())

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

cat("After installations -----------------\n")
print(reticulate::py_discover_config())

if (Sys.getenv("TRAVIS") == "true" || Sys.getenv("APPVEYOR") == "True")
  install_tensorflow(version = version, method = method, restart_session = FALSE)



