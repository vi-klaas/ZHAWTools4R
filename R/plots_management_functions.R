## ******************************************************************************
#' title: plots_management_functions.R
#' author: Vanessa Klaas
#' date: 2021-01-19
#'
#' functions for plots
## ******************************************************************************


## ******************************************************************************
#' PlotFileName
#'
#' @param prefix a prefix
#' @param middle middle
#' @param postfix postfix
#' @param sep separator
#' @param rootdir root directory for plots
#' @param suffix file extension
#'
#' @return filename with complete path
#' @export
PlotFileName <- function(prefix, middle, postfix, sep = "_", rootdir="plots/", suffix="png") {
  fname <- paste0(rootdir, prefix, sep, middle, sep, postfix, ".", suffix)
  return(fname)
}


## ******************************************************************************
#' save Plot
#' @param g the ggplot object to save
#' @param size the plot size, possible options are: a4', 'a4.hor', 'a4.hor.half', 'col.1' and more
#' @param prefix a prefix
#' @param middle middle
#' @param postfix postfix
#' @param sep separator
#' @param rootdir root directory for plots
#' @param suffix file extension
#' @param dpi resolution, default=300
#' @param width custom width
#' @param height custom height
#' @param units custom unit
#' @import ggplot2
#' @return None
#' @export
SavePlot <- function(g, size, prefix, middle, postfix, sep="_", rootdir="plots/", suffix="png", dpi=300, width=NULL, height=NULL, units="cm") {
  fname <- PlotFileName(prefix, middle, postfix, sep, rootdir="plots/", suffix="png")

  switch(size,
         'ppt.lan'= {ggplot2::ggsave(fname, g, dpi=dpi, width=13, height=6.5, units="in", device=suffix)},
         'doc.por'= {ggplot2::ggsave(fname, g, dpi=dpi, width=16, height=10, units="cm", device=suffix)},
         'doc.por.half'= {ggplot2::ggsave(fname, g, dpi=dpi, width=8, height=5, units="cm", device=suffix)},
         'a4'= {ggplot2::ggsave(fname, g, dpi=dpi, width=19, height=28, units="cm", device=suffix)},
         'a4.lan'= {ggplot2::ggsave(fname, g, dpi=dpi, width=28, height=19, units="cm", device=suffix)},
         'a4.lan.half'= {ggplot2::ggsave(fname, g, dpi=dpi, width=16, height=18, units="cm", device=suffix)},
         'a4.lan.quadratic' = {ggplot2::ggsave(fname, g, dpi=dpi, width=19, height=19, units="cm", device=suffix)},
         'a5.third'= {ggplot2::ggsave(fname, g, dpi=dpi, width=10.8 *(14/5), height=5*(14/5), units="cm", device=suffix)},
         'a5.third2'= {ggplot2::ggsave(fname, g, dpi=dpi, width=10.8 *(14/5), height=10*(14/5), units="cm", device=suffix)},
         'a5.quad'= {ggplot2::ggsave(fname, g, dpi=dpi, width=7 *(14/5), height=5*(14/5), units="cm", device=suffix)},
         'a5.quad2'= {ggplot2::ggsave(fname, g, dpi=dpi, width=5 *(14/5), height=5*(14/5), units="cm", device=suffix)},
         'a5.quad3'= {ggplot2::ggsave(fname, g, dpi=dpi, width=7.5 *(14/5), height=5*(14/5), units="cm", device=suffix)},
         'a5.por'= {ggplot2::ggsave(fname, g, dpi=dpi, width=10.8 *(14/5), height=14*(14/5), units="cm", device=suffix)},
         'a5.lan'= {ggplot2::ggsave(fname, g, dpi=dpi, width=14 *(14/5), height=10.8*(14/5), units="cm", device=suffix)},
         'a3'= {ggplot2::ggsave(fname, g, dpi=dpi, width=29, height=42, units="cm", device=suffix)},
         'a3.lan'= {ggplot2::ggsave(fname, g, dpi=dpi, width=42, height=29, units="cm", device=suffix)},
         'a2.lan'= {ggplot2::ggsave(fname, g, dpi=dpi, width=59, height=42, units="cm", device=suffix)},
         'jmir.lan' = {ggplot2::ggsave(fname, g, dpi=dpi, width=15, height=7, units="cm", device=suffix)},
         'jmir.lan.high' = {ggplot2::ggsave(fname, g, dpi=dpi, width=15, height=10, units="cm", device=suffix)},
         'jmir.lan.integrated' = {ggplot2::ggsave(fname, g, dpi=dpi, width=15, height=20, units="cm", device=suffix)},
         {ggplot2::ggsave(fname, g, dpi=dpi, width=width, height=height, units=units, device=suffix)}
  )
  return(fname)
}


