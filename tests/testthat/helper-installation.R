library(tfinstall)

version <- Sys.getenv("TENSORFLOW_VERSION")

if (Sys.getenv("TRAVIS") == "true")
  install_tensorflow(version = version, restart_session = FALSE)
