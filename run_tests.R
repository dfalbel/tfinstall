reticulate::use_condaenv(condaenv = "r-reticulate", conda =  "C:\\Miniconda36-x64\\Scripts\\conda.exe", required = TRUE)
testthat::test_dir("tests/testthat/", reporter = c("progress", "fail"))
