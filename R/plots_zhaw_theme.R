## ******************************************************************************
#' title: plots_zhaw_theme.R
#' author: Vanessa Klaas
#' date: 2021-01-18
#'
#' definitions for ZHAW theme
## ******************************************************************************


## ******************************************************************************
#' init_fonts
#'
#' @return TRUE
#' @import extrafont
#' @export
init_fonts <- function() {
  extrafont::loadfonts()
  return(TRUE)
}


## ******************************************************************************
#' colors
#' @name mycolors
#' @docType data
#' @export
mycolors <-
  # black, red, blue, green, violet, orange, brown,
  c('#000000', '#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00', '#b15928',
    ## grey, red, blue, green, violet, orange, yellow
    '##A9A9A9', '#fb9a99','#a6cee3','#b2df8a','#cab2d6','#fdbf6f','#ffff99')



## ******************************************************************************
#' kXLab.long x-axis with long labels, 45 degree
#' @name kXLab.long
#' @import ggplot2
#' @export
#'
#' @description
#' usage: theme(axis.text.x = kXLab.long) +
kXLab.long <- ggplot2::element_text(angle=45, hjust=1.1, vjust=1.1)


## ******************************************************************************
#' kMinor.blank x and y axis minor blank
#' @name kMinor.blank
#' @import ggplot2
#' @export
kMinor.blank <- ggplot2::theme(panel.grid.minor = ggplot2::element_blank())


## ******************************************************************************
#' kX.empty x-axis empty
#' @name kXLab.long
#' @import ggplot2
#' @export
kX.empty <- ggplot2::theme(axis.title.x=ggplot2::element_blank(),
                  axis.text.x=ggplot2::element_blank(),
                  axis.ticks.x=ggplot2::element_blank())


## ******************************************************************************
#' facets.default, facet labeling size 12 and face bold
#' @name facets.default
#' @import ggplot2
#' @export
facets.default <- ggplot2::theme(strip.text.x = ggplot2::element_text(size=12, face="bold"),
                        strip.text.y = ggplot2::element_text(size=12, face="bold"))


## ******************************************************************************
## ******************************* THEME ****************************************
## ******************************************************************************


## ******************************************************************************
#' theme_zhaw
#'
#' @param base_size font size
#' @param base_family font family
#' @param panel.grid.major.x.blank if TRUE, no major x gridlines
#' @param panel.grid.minor.y.blank if TRUE, no minor y gridlines
#'
#' @import ggplot2
#'
#' @return zhaw theme
#' @export
theme_zhaw <- function(base_size = 9,
                        base_family = "Lato",
                        panel.grid.major.x.blank=FALSE,
                        panel.grid.minor.y.blank=FALSE) {
  theme_replacement <-
    ggplot2::theme(
      plot.title = ggplot2::element_text(size=18, hjust=0),
      plot.caption = ggplot2::element_text(hjust=0),
      panel.grid.minor.x = ggplot2::element_blank(),
      strip.text.x = ggplot2::element_text(size=15, hjust=0),
      complete = TRUE
    )

  res <- ggplot2::theme_minimal(base_size = base_size,
                       base_family = base_family) %+replace%
    theme_replacement

  if (panel.grid.major.x.blank){
    res <- res %+replace%
      ggplot2::theme(
        panel.grid.major.x = ggplot2::element_blank(),
        complete = TRUE)
  }

  if (panel.grid.minor.y.blank) {
    res <- res %+replace%
      ggplot2::theme(
        panel.grid.minor.y = ggplot2::element_blank(),
        complete = TRUE)
  }

  return(res)
}

