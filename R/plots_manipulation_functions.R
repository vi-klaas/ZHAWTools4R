## ******************************************************************************
#' title: plots_manipulation_functions.R
#' author: Vanessa Klaas
#' date: 2021-01-19
#'
#' functions for manipulating plots
## ******************************************************************************


## ******************************************************************************
#' extract_plots_from_list
#' @description Takes a list (potentially containing sublists) and extracts all of the ggplot2 'plot-type' objects from that list into a simple list of 'plot-type' objects.
#'
#' @param x A list object, potentially containing sublists.
#'
#' @return Returns a 'flat', single-level list of all the ggplot2 'plot-type' objects from within `x`, reaching recursively into sub-lists as needed. If there are no 'plot-type' objects, returns an empty list.
#'
#' @note Whether an object is a ggplot2 'plot-type' object is defined here as an object with classes 'gg', 'gTree', or 'gtable'. https://gist.github.com/bschneidr/3f9862b8856f87d2b8f8a24878f76cc9
#'
#' @export
#'
#' @example
#' library(ggplot2)
#'
#' # Create a list of lists, containing multiple plots
#' generic_plot <- ggplot(mtcars) + geom_point(aes(x = wt, y = mpg))
#'
#' summary_plots <- list()
#' summary_plots$Demographics$Socioeconomic$Income <- generic_plot
#' summary_plots$Demographics$Socioeconomic$Education <- generic_plot
#' summary_plots$Demographics$Age <- generic_plot
#' summary_plots$Product_Usage$Purchase_Frequency <- generic_plot
#'
#' # Call the extraction function
#' extract_plots_from_list(summary_plots)
#'
extract_plots_from_list <- function(x) {

  if (!is.list(x)) {
    stop("`x` must be a list.")
  }

  if (length(x) < 1) {
    return(x)
  }

  more_lists <- sapply(x, function(object_to_check) {
    'list' %in% class(object_to_check) & !(any(c('gg', "gTree", "gtable") %in% class(object_to_check)))
  })

  result <- c(x[!more_lists],
              unlist(x[more_lists],
                     recursive = FALSE))

  if (sum(more_lists)) {

    Recall(result)

  } else {

    is_plot_obj <- sapply(result, function(result_object) {
      any(c('gg', "gTree", "gtable") %in% class(result_object))
    })

    result <- result[is_plot_obj]
    return(result)
  }
}


## ******************************************************************************
#' grid_arrange_shared_legend
#'
#' @param ... plots to put together
#' @param ncol number of columns
#' @param nrow number or rows
#' @param position position of legend
#'
#' @import ggplot2
#' @importFrom grid unit.c grid.draw grid.newpage
#'
#' @return plot with subplots and shared legend
#'
#' @export
grid_arrange_shared_legend <- function(..., ncol = length(list(...)), nrow = 1, position = c("bottom", "right")) {
  plots <- list(...)
  position <- match.arg(position)
  g <- ggplot2::ggplotGrob(plots[[1]] +
                    ggplot2::theme(legend.position = position))$grobs
  legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
  lheight <- sum(legend$height)
  lwidth <- sum(legend$width)
  gl <- lapply(plots, function(x) x +
                 ggplot2::theme(legend.position = "none"))
  gl <- c(gl, ncol = ncol, nrow = nrow)

  combined <- switch(position,
                     "bottom" = gridExtra::arrangeGrob(do.call(gridExtra::arrangeGrob, gl),
                                                       legend,ncol = 1,
                                                       heights = unit.c(unit(1, "npc") - lheight, lheight)),
                     "right" = gridExtra::arrangeGrob(do.call(gridExtra::arrangeGrob, gl),
                                                      legend, ncol = 2,
                                                      widths = unit.c(unit(1, "npc") - lwidth, lwidth)))

  grid.newpage()
  grid.draw(combined)

  # return gtable invisibly
  invisible(combined)
}
