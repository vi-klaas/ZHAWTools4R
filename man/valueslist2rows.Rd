% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions_split_values_list.R
\name{valueslist2rows}
\alias{valueslist2rows}
\title{title: functions_split_values_list.R
author: Vanessa Klaas
date: 2021-01-28}
\usage{
valueslist2rows(
  df,
  cname,
  sep = ",",
  cname_new = cname,
  ignore_duplicates = TRUE,
  dont_create_empty_fields = TRUE
)
}
\arguments{
\item{df}{dataframe or tibble}

\item{cname}{column name containing the list of values}

\item{sep}{separator for list elements, default ","}

\item{cname_new}{name of the new column, default cname}

\item{ignore_duplicates}{if TRUE, ignore duplicated list elements}

\item{dont_create_empty_fields}{if TRUE, don't create rows with new empty string}
}
\value{
transformed data frame
}
\description{
functions to split a list of values in new rows or new columns
valueslist2rows
}
\examples{
# some examples if you want to highlight the usage in the packag
}
