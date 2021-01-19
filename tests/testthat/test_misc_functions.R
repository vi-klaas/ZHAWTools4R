## ******************************************************************************
#' title: test_misc_functions.R
#' author: Vanessa Klaas
#' date: 2021-01-18
#'
#' test misc functions
## ******************************************************************************

test_that("usage of %+% with two strings", {
  expect_equal("a" %+% "b", "ab")
})

test_that("usage of %+% with string and vector of strings", {
  expect_equal("a" %+% c("b", "c"), c("ab", "ac"))
})
