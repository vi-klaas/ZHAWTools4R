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
#' @param camid campaign id
#' @param rootdir root directory for plots
#' @param suffix file extension
#' @param postfix postfix for filename
#'
#' @return filename with complete path
#' @export
PlotFileName <- function(prefix, camid, rootdir="plots/", suffix="png", postfix="") {
  fname <- paste0(rootdir, prefix, camid, postfix, ".", suffix)
  return(fname)
}


## ******************************************************************************
#' save Plot
#' @param prefix prefix of filename
#' @param camid campaign ID
#' @param g the ggplot object to save
#' @param size the plot size, possible options are: a4', 'a4.hor', 'a4.hor.half', 'col.1' and more
#' @param rootdir the directory in which the file shall be saved, default plots/
#' @param suffix file extensions / format
#' @param postfix string inserted after the camid, default png
#' @param dpi resolution, default=300
#' @import ggplot2
#' @return None
#' @export
SavePlot <- function(prefix, camid, g, size, rootdir="plots/", suffix="png", postfix="", dpi=300) {
  fname <- PlotFileName(prefix, camid, rootdir, suffix, postfix)

  switch(size,
         'ppt.hor'= {ggplot2::ggsave(fname, g, dpi=dpi, width=13, height=6.5, units="in", device=suffix)},
         'a4'= {ggplot2::ggsave(fname, g, dpi=dpi, width=19, height=28, units="cm", device=suffix)},
         'a4.hor'= {ggplot2::ggsave(fname, g, dpi=dpi, width=28, height=19, units="cm", device=suffix)},
         'a4.hor.half'= {ggplot2::ggsave(fname, g, dpi=dpi, width=16, height=18, units="cm", device=suffix)},
         'a4.hor.quadratic' = {ggplot2::ggsave(fname, g, dpi=dpi, width=19, height=19, units="cm", device=suffix)},
         'a5.third'= {ggplot2::ggsave(fname, g, dpi=dpi, width=10.8 *(14/5), height=5*(14/5), units="cm", device=suffix)},
         'a5.third2'= {ggplot2::ggsave(fname, g, dpi=dpi, width=10.8 *(14/5), height=10*(14/5), units="cm", device=suffix)},
         'a5.quad'= {ggplot2::ggsave(fname, g, dpi=dpi, width=7 *(14/5), height=5*(14/5), units="cm", device=suffix)},
         'a5.quad2'= {ggplot2::ggsave(fname, g, dpi=dpi, width=5 *(14/5), height=5*(14/5), units="cm", device=suffix)},
         'a5.quad3'= {ggplot2::ggsave(fname, g, dpi=dpi, width=7.5 *(14/5), height=5*(14/5), units="cm", device=suffix)},
         'a5.por'= {ggplot2::ggsave(fname, g, dpi=dpi, width=10.8 *(14/5), height=14*(14/5), units="cm", device=suffix)},
         'a5.hor'= {ggplot2::ggsave(fname, g, dpi=dpi, width=14 *(14/5), height=10.8*(14/5), units="cm", device=suffix)},
         'col.1' = {ggplot2::ggsave(fname, g, dpi=dpi, width=8, height=8, units="cm", device=suffix)},
         'a3'= {ggplot2::ggsave(fname, g, dpi=dpi, width=29, height=42, units="cm", device=suffix)},
         'a3.hor'= {ggplot2::ggsave(fname, g, dpi=dpi, width=42, height=29, units="cm", device=suffix)},
         'a2.hor'= {ggplot2::ggsave(fname, g, dpi=dpi, width=59, height=42, units="cm", device=suffix)},
         'jmir.hor' = {ggplot2::ggsave(fname, g, dpi=dpi, width=15, height=7, units="cm", device=suffix)},
         'jmir.hor.high' = {ggplot2::ggsave(fname, g, dpi=dpi, width=15, height=10, units="cm", device=suffix)},
         'jmir.hor.integrated' = {ggplot2::ggsave(fname, g, dpi=dpi, width=15, height=20, units="cm", device=suffix)},
         {ggplot2::ggsave(fname, g, dpi=dpi, device=suffix)}
  )
  return(fname)
}


