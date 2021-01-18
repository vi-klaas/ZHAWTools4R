## ******************************************************************************
#' title: functions_labeling.R
#' author: Vanessa Klaas
#' date: 2021-01-18
#'
#' functions for labeling for plots
## ******************************************************************************



## ******************************************************************************
#' relabel_values
#'
#' @param x vector of strings to relabel
#' @param lookup_table df containing keys and labels
#' @param pattern name of key column
#' @param replacement name of label column
#'
#' @import stringr
#'
#' @return vector with relabeled values
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
relabel_values <- function(x, lookup_table, pattern="key", replacement="label") {
  lookup_vector <- create_lookup_vector(lookup_table, pattern=pattern, replacement=replacement)
  res <- x %>%
    stringr::str_replace_all(lookup_vector)
  return(res)
}
