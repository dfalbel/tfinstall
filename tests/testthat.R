library(testthat)


if (Sys.getenv("APPVEYOR") == "True") {
  reticulate::use_condaenv("r-reticulate", "C:\\Miniconda36-x64\\condabin\\conda.bat")
}


library(tfinstall)
test_check("tfinstall")
