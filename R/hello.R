#' @importFrom tensorflow install_tensorflow
#' @export
tensorflow::install_tensorflow

#' @export
install_anaconda_linux <- function() {
  download.file(url = "https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh", destfile = "~/anaconda.sh")
  system("bash ~/anaconda.sh -b")
}

#' @export
install_anaconda_mac <- function() {
  download.file(url = "https://repo.anaconda.com/archive/Anaconda3-2019.03-MacOSX-x86_64.sh", destfile = "~/anaconda.sh")
  system("chmod +x ~/anaconda.sh")
  cat("Installing conda: .... \n")
  system("bash ~/anaconda.sh -b")
}

#' @export
try_python_conda <- function() {
  python <- reticulate::conda_python("r-tensorflow")
  system(paste(python, "py_install_test.py"))
}

#' @export
try_python_virtualenv <- function() {
  python <- reticulate::virtualenv_python("r-tensorflow")
  system(paste(python, "py_install_test.py"))
}
