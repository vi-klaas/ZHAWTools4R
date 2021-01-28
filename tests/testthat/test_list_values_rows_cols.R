## ******************************************************************************
#' title: test_list_values_rows_cols.R
#' author: Vanessa Klaas
#' date: 2021-01-28
#'
#' test cases for creation of cols and rows
## ******************************************************************************


testthat::test_that("create rows", {
  input <- tribble(
    ~col1, ~col2,
    1, "a, b, c",
    2, "f, f",
    3, "g,",
    4, "f",
    5, ",h",
    6, "",
    7, "i"
  )

  sep <- ","
  cname <- "col2"
  cname_new <- "col2_new"


  exp1 <- tribble(
    ~col1, ~col2,
    1,"a",
    1,"b",
    1,"c",
    2,"f",
    3,"g",
    4,"f",
    5,"h",
    6,"",
    7,"i"
  )

  exp2 <- tribble(
    ~col1, ~col2, ~col2_new,
    1, "a, b, c","a",
    1, "a, b, c","b",
    1, "a, b, c","c",
    2, "f, f","f",
    3,"g,","g",
    4,"f","f",
    5,",h","h",
    6,"","",
    7,"i","i"
  )


  exp3 <- tribble(
    ~col1, ~col2,
    1,"a",
    1,"b",
    1,"c",
    2,"f",
    2,"f",
    3,"g",
    4,"f",
    5,"h",
    6,"",
    7,"i"
  )

  exp4 <- tribble(
    ~col1, ~col2,
    1,"a",
    1,"b",
    1,"c",
    2,"f",
    3,"g",
    3,"",
    4,"f",
    5,"",
    5,"h",
    6,"",
    7,"i"
  )

  res1 <- valueslist2rows(input, cname)
  res2 <- valueslist2rows(input, cname, cname_new = cname_new)
  res3 <- valueslist2rows(input, cname, ignore_duplicates = FALSE)
  res4 <- valueslist2rows(input, cname, dont_create_empty_fields = FALSE)

  expect_equal(res1, exp1)
  expect_equal(res2, exp2)
  expect_equal(res3, exp3)
  expect_equal(res4, exp4)
})
