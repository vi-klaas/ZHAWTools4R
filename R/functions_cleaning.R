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
#' @return
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
#' @param key name of key column
#' @param raw name of raw column
#'
#' @return
#'
#'
#' @import stats
#' @import dplyr
#' @import stringr
#'
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
create_lookup_vector <- function(lookup_table, key="key", raw="raw") {
  res <- lookup_table %>%
    rename_cols(key, raw) %>%
    dplyr::arrange(-stringr::str_length(raw))
  res <- stats::setNames(res %>% dplyr::pull(key), res %>% dplyr::pull(raw))
  return(res)
}


#' normalize_text
#'
#' @param x a vector of values
#' @param lookup_table a lookup table
#' @param key name of key column
#' @param raw name of raw column
#'
#' @return
#'
#' @import dplyr
#' @import stringr
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
normalize_text <- function(x, lookup_table, key="key", raw="raw") {
  lookup_vector <- create_lookup_vector(lookup_table, key, raw)
  res <- x %>%
    stringr::str_to_lower() %>%
    stringr::str_trim() %>%
    stringr::str_replace_all("\\s+", " ")  %>%
    stringr::str_replace_all(lookup_vector)
  return(res)
}



