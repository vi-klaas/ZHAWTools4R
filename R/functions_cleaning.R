## ******************************************************************************
#' title: functions_cleaning.R
#' author: Vanessa Klaas
#' date: 2021-01-13
#'
#' clean, normalize, and unify strings
## ******************************************************************************



## ******************************************************************************
#' rename_cols
#'
#' @param lookup_table a lookup table
#' @param pattern name of key column
#' @param replacement name of raw column
#'
#' @return lookup table with renamed columns
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
rename_cols <- function(lookup_table, pattern="key", replacement="raw") {
  names(lookup_table)[names(lookup_table)==pattern] <- "pattern"
  names(lookup_table)[names(lookup_table)==replacement] <- "replacement"
  return(lookup_table)
}


## ******************************************************************************
#' create_lookup_vector
#'
#' @param lookup_table a lookup table
#' @param pattern name of raw/pattern column
#' @param replacement name of key/replacement column
#' @param arrange_by_size if TRUE, sort the vector be length of strings (necessary for string normalization, but not for factor levels)
#'
#' @return named vector to use with str_replace_all
#'
#' @import stats
#' @import dplyr
#' @import stringr
#' @importFrom rlang .data
#'
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
create_lookup_vector <- function (lookup_table, pattern = "pat", replacement = "rep", arrange_by_size=TRUE)
{
  res <- lookup_table %>% rename_cols(replacement = replacement, pattern = pattern)
  if (arrange_by_size){
    res <- res %>% dplyr::arrange(-stringr::str_length(.data$pattern))
  }

  res <- stats::setNames(res %>% dplyr::pull(.data$replacement),
                         res %>% dplyr::pull(.data$pattern))
  return(res)
}


## ******************************************************************************
#' normalize_blanks_tolower
#'
#' @param x string or vector of strings
#'
#' @return normalized string or vector of normalized strings
#'
#' @import stringr
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
normalize_blanks_tolower <- function(x) {
  res <- x %>%
    stringr::str_to_lower() %>%
    stringr::str_trim() %>%
    stringr::str_replace_all("\\s+", " ")
  return(res)
}


## ******************************************************************************
#' normalize_text
#'
#' @param x a vector of values
#' @param lookup_table a lookup table
#' @param pattern name of raw/pattern column
#' @param replacement name of key/replacement column
#'
#' @return vector of normalized text values
#'
#' @import stringr
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
normalize_text <- function(x, lookup_table, pattern="raw", replacement="key") {
  lookup_vector <- create_lookup_vector(lookup_table, pattern=pattern, replacement=replacement)
  res <- x %>%
    normalize_blanks_tolower() %>%
    stringr::str_replace_all(lookup_vector)
  return(res)
}



