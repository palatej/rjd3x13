% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/x13.R
\name{regarima}
\alias{regarima}
\alias{fast.regarima}
\title{RegARIMA model, pre-adjustment in X13}
\usage{
regarima(
  ts,
  spec = c("rg4", "rg0", "rg1", "rg2c", "rg3", "rg5c"),
  context = NULL,
  userdefined = NULL
)

fast.regarima(
  ts,
  spec = c("rg4", "rg0", "rg1", "rg2c", "rg3", "rg5c"),
  context = NULL,
  userdefined = NULL
)
}
\arguments{
\item{ts}{a univariate time series.}

\item{spec}{the model specification. Can be either the name of a predefined specification or a user-defined specification.}

\item{context}{the dictionnary of variables.}

\item{userdefined}{a vector containing the additional output variables.}
}
\value{
the \code{regarima()} function returns a list with the results (\code{"JD3_REGARIMA_RSLTS"} object), the estimation specification and the result specification, while \code{fast.regarima()} is a faster function that only returns the results.
}
\description{
RegARIMA model, pre-adjustment in X13
}
\examples{
y = rjd3toolkit::ABS$X0.2.09.10.M
sp = spec_regarima_default("rg5c")
sp = add_outlier(sp,
                 type = c("AO"), c("2015-01-01", "2010-01-01"))
fast.regarima(y, spec = sp)
sp = set_transform(
  set_tradingdays(
    set_easter(sp, enabled = FALSE),
    option = "workingdays"
  ),
  fun = "None"
)
fast.regarima(y, spec = sp)
sp = set_outlier(sp, outliers.type = c("AO"))
fast.regarima(y, spec = sp)
}
