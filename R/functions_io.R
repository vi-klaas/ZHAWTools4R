
#' load_lookup_table
#'
#' @param file_path path to file including file name
#'
#' @return tibble
#' @import readxl
#' @export
#'
#' @examples
#' # some examples if you want to highlight the usage in the package
load_lookup_table <- function(file_path) {
  res <- readxl::read_excel(file_path)
  return(res)
}
