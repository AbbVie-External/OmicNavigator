% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/upset.R
\name{getResultsIntersection}
\alias{getResultsIntersection}
\title{getResultsIntersection}
\usage{
getResultsIntersection(
  study,
  modelID,
  anchor,
  mustTests,
  notTests,
  sigValue,
  operator,
  column
)
}
\arguments{
\item{study}{An OmicNavigator study. Either an object of class \code{onStudy},
or the name of an installed study package.}

\item{modelID}{Filter by modelID}

\item{anchor}{The primary test to filter from.}

\item{mustTests}{The tests whose significant values must be included. (The intersection)}

\item{notTests}{The tests whose significant values will be removed. (The difference)}

\item{sigValue}{The significance levels for each column.}

\item{operator}{The operators for each column.}

\item{column}{The columns to be thresheld.}
}
\description{
getResultsIntersection
}
