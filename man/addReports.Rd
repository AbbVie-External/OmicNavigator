% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add.R
\name{addReports}
\alias{addReports}
\title{Add reports}
\usage{
addReports(study, reports)
}
\arguments{
\item{study}{An OmicNavigator study created with \code{\link{createStudy}}}

\item{reports}{The analysis report(s) that explain how the study results were
generated. The input object is a list of character vectors (one per model).
Each element should be either a URL or a path to a file on your computer.
If it is a path to a file, this file will be included in the exported study
package. To share a report across multiple models, use the modelID
"default".}
}
\description{
You can include reports of the analyses you performed to generate the
results.
}
