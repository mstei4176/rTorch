library(testthat)

skip_on_cran()

source("tensor_functions.R")



# reshape tensor ---------------------------------------------------------------
context("reshape tensor")

test_that("reshape() 1D to 2D", {
    a <-  torch$arange(4.)
    expect_equal(tensor_dim_(a), 1)   # 1D
    expect_equal(tensor_dim_(torch$reshape(a, c(2L, 2L))), 2)  # 2D
})

test_that("reshape()", {
    b <- torch$tensor(list(list(0, 1), list(2, 3)))
    expect_equal(tensor_dim_(b), 2)   # 2D
    expect_error(torch$reshape(b, list(-1L,0L)))
    expect_error(torch$reshape(b, c(-1L,0L)))
    expect_error(torch$reshape(b, c(-1L,)))
})
