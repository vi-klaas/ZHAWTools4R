## ******************************************************************************
#' title: functions_split_values_list.R
#' author: Vanessa Klaas
#' date: 2021-01-28
#'
#' functions to split a list of values in new rows or new columns
## ******************************************************************************

#' valueslist2rows
#'
#' @param df dataframe or tibble
#' @param cname column name containing the list of values
#' @param sep separator for list elements, default ","
#' @param cname_new name of the new column, default cname
#' @param ignore_duplicates if TRUE, ignore duplicated list elements
#' @param dont_create_empty_fields if TRUE, don't create rows with new empty string
#'
#' @import dplyr
#' @import tidyr
#' @import stringr
#' @importFrom rlang .data
#'
#' @return transformed data frame
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the packag
valueslist2rows <- function(df, cname, sep = ",",
                            cname_new = cname,
                            ignore_duplicates=TRUE,
                            dont_create_empty_fields=TRUE) {
  # create vector with elements based on separator
  values <- df %>%
    dplyr::pull(.data[[cname]]) %>%
    paste(collapse = sep)
  values <- stringr::str_split(values, stringr::fixed(sep))[[1]] %>%
    stringr::str_trim()

  # add helper columns with the number of columns that shall be added
  df <- df %>%
    dplyr::mutate(
      aux_no_elements = stringr::str_count(.data[[cname]], fixed(sep))+1,
      aux_original_empty = .data[[cname]] == ""
    ) %>%
    tidyr::uncount(.data$aux_no_elements)
  df[[cname_new]] <- values

  if (dont_create_empty_fields){
    df <- df %>% dplyr::filter(.data[[cname_new]] != "" | .data$aux_original_empty)
  }

  if (ignore_duplicates) {
    df <- df %>% dplyr::distinct()
  }

  # remove helper columns
  helper_names <- c("aux_no_elements", "aux_original_empty")
  df <- df %>% dplyr::select(-all_of(helper_names))

  return(df)
}
