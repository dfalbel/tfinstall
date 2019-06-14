library(tfinstall)

version <- Sys.getenv("TENSORFLOW_VERSION")
method <- Sys.getenv("INSTALL_METHOD")

if (method=="conda") {
  try_python_conda()
} else {
  try_python_virtualenv()
}
