library(testthat)


if (Sys.getenv("APPVEYOR") == "True") {
  reticulate::use_condaenv(
    condaenv = "r-reticulate",
    conda =  "C:\\Miniconda36-x64\\Scripts\\conda.exe",
    required = TRUE)
}


library(tfinstall)
test_check("tfinstall")
