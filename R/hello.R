#' @importFrom tensorflow install_tensorflow
#' @export
tensorflow::install_tensorflow

#' @export
install_anaconda_linux <- function() {
  download.file("https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh", "~/anaconda.sh")
  system("bash ~/anaconda.sh -b -p $HOME/anaconda")
}

#' @export
install_anaconda_mac <- function() {
  download.file("https://repo.anaconda.com/archive/Anaconda3-2019.03-MacOSX-x86_64.pkg", "~/anaconda.sh")
  system("bash ~/anaconda.sh -b -p $HOME/anaconda")
}
