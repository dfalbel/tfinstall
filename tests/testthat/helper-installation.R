library(tfinstall)

if (Sys.getenv("TRAVIS") == "true")
  install_tensorflow(restart_session = FALSE)
