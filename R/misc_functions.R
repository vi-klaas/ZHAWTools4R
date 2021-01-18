## ******************************************************************************
#' title: misc_functions.R
#' author: Vanessa Klaas
#' date: 2021-01-18
#'
#' little helper functions
## ******************************************************************************


## ******************************************************************************
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


## ******************************************************************************
#' inline operator for string concatenation based on paste0
#'
#' @param x string1
#' @param y string2
#'
#' @return paste0(x, y)
#' @export
"%+%" <- function (x,y) {
  paste0(x,y)
}


## ******************************************************************************
#' negation for in
#'
#' @param x element
#' @param y vector
#'
#' @return true if x not in y
#' @export
'%ni%' <- function(x, y) {
  '%op%' <- Negate('%in%')
  return(x %op% y)
}


## ******************************************************************************
#' assign list elements that are returned by a function to variable names
#' usage: fun_return[result1, result2, result3] <-
#'           function_with_list_of_3_return_values(...)
#'
#'
#' @return assigns a list of return values to single variables
#' @export
fun_return <- structure(NA, class = "result")
"[<-.result" <- function(x,...,value) {
  args <- as.list(match.call())
  args <- args[-c(1:2,length(args))]
  length(value) <- length(args)

  for(i in seq(along = args)) {
    a <- args[[i]]

    if(!missing(a)) {
      eval.parent(substitute(a <- v, list(a = a, v = value[[i]])))
    }
  }
  x
}


## ******************************************************************************
#' chr2param
#'
#' @param value value to transform
#'
#' @return transformed value
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
chr2param <- function(value) {
  if(class(value) != "character") {
    return(value)
  }
  if (is.na(value)) {
    return(NA)
  }
  return(switch(
    value,
    "NULL" = NULL,
    "0" = 0,
    "auto" = "auto",
    "TRUE" = TRUE,
    "FALSE" = FALSE,
    value
  ))
}
