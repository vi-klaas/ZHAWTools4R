## ******************************************************************************
#' title: test_relabel_values.R
#' author: Vanessa Klaas
#' date: 2021-01-18
#'
#' test cases for relabeling values
## ******************************************************************************


testthat::test_that("relabel values", {
  test_data <- tribble(
    ~raw_values, ~other_values,
    "bsf", 42,
    "bsf.bv", 43,
    "sake", 2,
  )

  lookup_labels <- tribble(
    ~key, ~label,
    "bsf", "Bundesamt für Statistik",
    "bsf.bv", "Bevölkerungsstatistik des Bundesamt für Statistik",
    "sake", "SAKE"
  )

  exp_result <- c("Bundesamt für Statistik",
                  "Bevölkerungsstatistik des Bundesamt für Statistik",
                  "SAKE")

  expect_equal(normalize_text(test_data$raw_values, lookup_labels, pattern="key", replacement="label"), exp_result)
})
