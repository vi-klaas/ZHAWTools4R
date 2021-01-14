#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


#' Pipe
#'
#' Put description here
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
#' @param lhs,rhs specify what lhs and rhs are
#' @examples
#' # some examples if you want to highlight the usage in the package
NULL

#' rename_cols
#'
#' @param lookup_table a lookup table
#' @param key name of key column
#' @param raw name of raw column
#'
#' @return lookup table with renamed columns
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
rename_cols <- function(lookup_table, key="key", raw="raw") {
  names(lookup_table)[names(lookup_table)==key] <- "key"
  names(lookup_table)[names(lookup_table)==raw] <- "raw"
  return(lookup_table)
}


#' create_lookup_vector
#'
#' @param lookup_table a lookup table
#' @param pattern name of raw/pattern column
#' @param replacement name of key/replacement column
#'
#' @return named vector to use with str_replace_all
#'
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
create_lookup_vector <- function(lookup_table, pattern="raw", replacement="key") {
  res <- lookup_table %>%
    rename_cols(key=replacement, raw=pattern) %>%
    dplyr::arrange(-stringr::str_length(.data$raw))
  res <- stats::setNames(res %>% dplyr::pull(.data$key), res %>% dplyr::pull(.data$raw))
  return(res)
}

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

#' normalize_text
#'
#' @param x a vector of values
#' @param lookup_table a lookup table
#' @param pattern name of raw/pattern column
#' @param replacement name of key/replacement column
#'
#' @return vector of normalized text values
#'
#' @import dplyr
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



