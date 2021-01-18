## ******************************************************************************
#' title: test_normalize_strings.R
#' author: Vanessa Klaas
#' date: 2021-01-14
#'
#' test cases for normalizing strings
## ******************************************************************************


testthat::test_that("prepare lookup vector", {
  input <- tribble(
    ~pattern, ~replacement,
    "bundesamt für statistik", "bsf",
    "bsf", "bsf",
    "bevölkerung des bundesamt für statistik", "bsf.bv",
    "sake", "sake"
  )

  input2 <- tribble(
    ~raw1, ~key1,
    "bundesamt für statistik", "bsf",
    "bsf", "bsf",
    "bevölkerung des bundesamt für statistik", "bsf.bv",
    "sake", "sake"
  )

  keys <- c("bsf.bv", "bsf", "sake", "bsf")
  raw_values <- c("bevölkerung des bundesamt für statistik",
                  "bundesamt für statistik",
                  "sake",
                  "bsf")

  exp_result <- setNames(keys, raw_values)

  expect_equal(create_lookup_vector(input), exp_result)
  expect_equal(create_lookup_vector(input2, pattern="raw1", replacement="key1"), exp_result)
})


testthat::test_that("normalize strings", {
  input <- tribble(
    ~raw, ~key,
    "bundesamt für statistik", "bsf",
    "bsf", "bsf",
    "bevölkerung des bundesamt für statistik", "bsf.bv",
    "sake", "sake"
  )

  test_data <- tribble(
    ~raw_values, ~other_values,
    "Bevölkerung   des   Bundesamt für Statistik", 42,
    "Bevölkerung   des   Bundesamt für Statistik, Bundesamt     für Statistik", 43,
    "Bundesamt     für Statistik, SAKE", 2,
    "Bundesamt     für Statistik", 2,
    "BSF", 4,
  )


  keys <- c("bsf.bv", "bsf", "sake", "bsf")
  raw_values <- c("bevölkerung des bundesamt für statistik",
                  "bundesamt für statistik",
                  "sake",
                  "bsf")

  exp_result <- c("bsf.bv", "bsf.bv, bsf", "bsf, sake", "bsf", "bsf")

  expect_equal(normalize_text(test_data$raw_values, input), exp_result)
})
