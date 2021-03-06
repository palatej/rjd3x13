% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/x13.R
\name{refresh}
\alias{refresh}
\alias{regarima.refresh}
\alias{x13.refresh}
\title{Refresh Policy}
\usage{
regarima.refresh(
  spec,
  refspec = NULL,
  policy = c("FreeParameters", "Complete", "Outliers_StochasticComponent", "Outliers",
    "FixedParameters", "FixedAutoRegressiveParameters", "Fixed"),
  period = 0,
  start = NULL,
  end = NULL
)

x13.refresh(
  spec,
  refspec = NULL,
  policy = c("FreeParameters", "Complete", "Outliers_StochasticComponent", "Outliers",
    "FixedParameters", "FixedAutoRegressiveParameters", "Fixed", "Current"),
  period = 0,
  start = NULL,
  end = NULL
)
}
\arguments{
\item{spec}{the current specification}

\item{refspec}{the reference specification (used to defined the set of models considered).
By default this is the \code{"RG4"} or \code{"RSA4"} specification.}

\item{policy}{the refresh policy}

\item{period, start, end}{to specify the frozen domain when \code{policy} equals to \code{"Outliers"} or \code{"Outliers_StochasticComponent"}.}
}
\value{
a new specification.
}
\description{
Refresh Policy
}
\examples{
y = rjd3toolkit::ABS$X0.2.08.10.M
y_anc = window(y,end = 2009)
mod_anc = regarima(y_anc, spec_regarima_default())
res_spec = mod_anc$result_spec
mod_anc
# ARIMA parameters fixed
fast.regarima(y,
              regarima.refresh(res_spec,
                               mod_anc$estimation_spec,
                               policy = "FixedParameters"))
# Outlier detection
fast.regarima(y,
              regarima.refresh(res_spec,
                               policy = "Outliers"))

}
