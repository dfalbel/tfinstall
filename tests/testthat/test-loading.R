library(tensorflow)

test_that("can load tensorflow", {
  x <- tensorflow::tf$constant(10)

  testthat::expect_s3_class(x, "tensorflow.tensor")
})
