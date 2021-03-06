add_ud_var <- function(x, jx, userdefined = NULL, out_class = NULL, result = FALSE){
  if (is.null(userdefined)) {
    x$user_defined = rjd3toolkit::user_defined(x, NULL)
  } else {
    if (result) {
      res = jx
    } else {
      if (is.null(out_class)) {
        res = jx$getResult()
      } else {
        res = .jcall(jx, out_class, "getResult")
      }
    }
    res = rjd3toolkit::jd3Object(res, result = TRUE)
    x$user_defined = rjd3toolkit::user_defined(res, userdefined = userdefined)
  }
  x
}

#' Retrieve the user-defined variable names
#'
#' Function to retrieve the names of the additional output variables that can be defined in `x13()`, `regarima()` and `x11()` functions.
#'
#'@param x a character.
#'
#' @examples
#' userdefined_variables_x13("x13")
#' userdefined_variables_x13("regarima")
#' userdefined_variables_x13("x11")
#' @export
userdefined_variables_x13 <- function(x = c("X-13","RegArima","X-11")){
  x <- match.arg(gsub("-", "", tolower(x)),
                 choices = c("x13", "regarima", "x11"))

  # library(rjd3x13)
  # jts<-rjd3toolkit::ts_r2jd(rjd3toolkit::ABS$X0.2.09.10.M)
  # jrslt<- rJava::.jcall("demetra/x13/r/X13", "Ljdplus/x13/X13Results;", "process", jts, "RSA3")
  # rjd3toolkit::dictionary(rjd3toolkit::jd3Object(jrslt, result = TRUE)) |>
  #   sort() |>
  #   dput()

  sa_x13 = c("adjust", "arima.bd", "arima.bp", "arima.bphi(*)", "arima.bq",
             "arima.btheta(*)", "arima.d", "arima.p", "arima.phi(*)", "arima.q",
             "arima.theta(*)", "cal", "cal_b(?)", "cal_f(?)", "decomposition.b1",
             "decomposition.b10", "decomposition.b11", "decomposition.b13",
             "decomposition.b17", "decomposition.b2", "decomposition.b20",
             "decomposition.b3", "decomposition.b4", "decomposition.b5", "decomposition.b6",
             "decomposition.b7", "decomposition.b8", "decomposition.b9", "decomposition.c1",
             "decomposition.c10", "decomposition.c11", "decomposition.c13",
             "decomposition.c17", "decomposition.c2", "decomposition.C20",
             "decomposition.c4", "decomposition.c5", "decomposition.c6", "decomposition.c7",
             "decomposition.c9", "decomposition.d1", "decomposition.d10",
             "decomposition.d10a", "decomposition.d11", "decomposition.d11a",
             "decomposition.d12", "decomposition.d12a", "decomposition.d13",
             "decomposition.d2", "decomposition.d4", "decomposition.d5", "decomposition.d6",
             "decomposition.d7", "decomposition.d8", "decomposition.d9", "decomposition.d9-global-msr",
             "decomposition.d9-msr", "decomposition.d9-msr-table", "decomposition.i_cmp",
             "decomposition.s_cmp", "decomposition.sa_cmp", "decomposition.seasonal-filters",
             "decomposition.t_cmp", "decomposition.trend-filter", "decomposition.x11-all",
             "decomposition.y_cmp", "decomposition.y_cmp_b", "decomposition.y_cmp_f",
             "det", "det_b(?)", "det_f(?)", "det_i", "det_i_b(?)", "det_i_f(?)",
             "det_s", "det_s_b(?)", "det_s_f(?)", "det_t", "det_t_b(?)", "det_t_f(?)",
             "diagnostics.fcast-insample-mean", "diagnostics.fcast-outsample-mean",
             "diagnostics.fcast-outsample-variance", "diagnostics.seas-i-combined",
             "diagnostics.seas-i-combined3", "diagnostics.seas-i-evolutive",
             "diagnostics.seas-i-f", "diagnostics.seas-i-friedman", "diagnostics.seas-i-kw",
             "diagnostics.seas-i-periodogram", "diagnostics.seas-i-qs", "diagnostics.seas-i-spectralpeaks",
             "diagnostics.seas-i-stable", "diagnostics.seas-lin-combined",
             "diagnostics.seas-lin-evolutive", "diagnostics.seas-lin-f", "diagnostics.seas-lin-friedman",
             "diagnostics.seas-lin-kw", "diagnostics.seas-lin-periodogram",
             "diagnostics.seas-lin-qs", "diagnostics.seas-lin-spectralpeaks",
             "diagnostics.seas-lin-stable", "diagnostics.seas-res-combined",
             "diagnostics.seas-res-combined3", "diagnostics.seas-res-evolutive",
             "diagnostics.seas-res-f", "diagnostics.seas-res-friedman", "diagnostics.seas-res-kw",
             "diagnostics.seas-res-periodogram", "diagnostics.seas-res-qs",
             "diagnostics.seas-res-spectralpeaks", "diagnostics.seas-res-stable",
             "diagnostics.seas-sa-ac1", "diagnostics.seas-sa-combined", "diagnostics.seas-sa-combined3",
             "diagnostics.seas-sa-evolutive", "diagnostics.seas-sa-f", "diagnostics.seas-sa-friedman",
             "diagnostics.seas-sa-kw", "diagnostics.seas-sa-periodogram",
             "diagnostics.seas-sa-qs", "diagnostics.seas-sa-spectralpeaks",
             "diagnostics.seas-sa-stable", "diagnostics.seas-si-combined",
             "diagnostics.seas-si-combined3", "diagnostics.seas-si-evolutive",
             "diagnostics.seas-si-stable", "diagnostics.td-i-all", "diagnostics.td-i-last",
             "diagnostics.td-res-all", "diagnostics.td-res-last", "diagnostics.td-sa-all",
             "diagnostics.td-sa-last", "ee", "ee_b(?)", "ee_f(?)", "finals.d11",
             "finals.d11a", "finals.d12", "finals.d12a", "finals.d13", "finals.d16",
             "finals.d16a", "finals.d18", "finals.d18a", "finals.e1", "finals.e11",
             "finals.e2", "finals.e3", "i", "l", "likelihood.adjustedll",
             "likelihood.aic", "likelihood.aicc", "likelihood.bic", "likelihood.bic2",
             "likelihood.bicc", "likelihood.df", "likelihood.hannanquinn",
             "likelihood.ll", "likelihood.neffectiveobs", "likelihood.nobs",
             "likelihood.nparams", "likelihood.ssqerr", "log", "m-statistics.m1",
             "m-statistics.m10", "m-statistics.m11", "m-statistics.m2", "m-statistics.m3",
             "m-statistics.m4", "m-statistics.m5", "m-statistics.m6", "m-statistics.m7",
             "m-statistics.m8", "m-statistics.m9", "m-statistics.q", "m-statistics.q-m2",
             "mhe", "mhe_b(?)", "mhe_f(?)", "omhe", "omhe_b(?)", "omhe_f(?)",
             "out", "out_b(?)", "out_f(?)", "out_i", "out_i_b(?)", "out_i_f(?)",
             "out_s", "out_s_b(?)", "out_s_f(?)", "out_t", "out_t_b(?)", "out_t_f(?)",
             "period", "preadjustment.a1", "preadjustment.a1a", "preadjustment.a1b",
             "preadjustment.a6", "preadjustment.a7", "preadjustment.a8", "preadjustment.a8i",
             "preadjustment.a8s", "preadjustment.a8t", "preadjustment.a9",
             "preadjustment.a9sa", "preadjustment.a9ser", "preadjustment.a9u",
             "reg_i", "reg_i_b(?)", "reg_i_f(?)", "reg_s", "reg_s_b(?)", "reg_s_f(?)",
             "reg_sa", "reg_sa_b(?)", "reg_sa_f(?)", "reg_t", "reg_t_b(?)",
             "reg_t_f(?)", "reg_u", "reg_u_b(?)", "reg_u_f(?)", "reg_y", "reg_y_b(?)",
             "reg_y_f(?)", "regression.description", "regression.details.coefficients",
             "regression.details.covar", "regression.details.covar-ml", "regression.easter",
             "regression.espan.end", "regression.espan.missing", "regression.espan.n",
             "regression.espan.start", "regression.leaster", "regression.lp",
             "regression.mean", "regression.missing(*)", "regression.ml.parameters",
             "regression.ml.pcorr", "regression.ml.pcovar", "regression.ml.pcovar-ml",
             "regression.ml.pscore", "regression.mu", "regression.nao", "regression.nlp",
             "regression.nls", "regression.nmh", "regression.nout", "regression.nso",
             "regression.ntc", "regression.ntd", "regression.nusers", "regression.out(*)",
             "regression.outlier(*)", "regression.td(*)", "regression.type",
             "regression.user(*)", "residuals.bp", "residuals.bp2", "residuals.doornikhansen",
             "residuals.kurtosis", "residuals.lb", "residuals.lb2", "residuals.lruns",
             "residuals.ludruns", "residuals.mean", "residuals.nruns", "residuals.nudruns",
             "residuals.res", "residuals.seasbp", "residuals.seaslb", "residuals.ser",
             "residuals.skewness", "residuals.tsres", "residuals.type", "s",
             "s_f", "sa", "sa_f", "span.end", "span.missing", "span.n", "span.start",
             "t", "t_f", "tde", "tde_b(?)", "tde_f(?)", "variancedecomposition.cycle",
             "variancedecomposition.irregular", "variancedecomposition.others",
             "variancedecomposition.seasonality", "variancedecomposition.tdh",
             "variancedecomposition.total", "y", "y_b(?)", "y_eb(?)", "y_ef(?)",
             "y_f(?)", "yc", "ycal")

  # jts<-rjd3toolkit::ts_r2jd(rjd3toolkit::ABS$X0.2.09.10.M)
  # jrslt<- rJava::.jcall("demetra/x13/r/RegArima", "Ljdplus/regsarima/regular/RegSarimaModel;", "process", jts, "RG3")
  # rjd3toolkit::dictionary(rjd3toolkit::jd3Object(jrslt, result = TRUE)) |>
  #   sort() |>
  #   dput()

  sa_regarima = c("adjust", "arima.bd", "arima.bp", "arima.bphi(*)", "arima.bq",
                  "arima.btheta(*)", "arima.d", "arima.p", "arima.phi(*)", "arima.q",
                  "arima.theta(*)", "cal", "cal_b(?)", "cal_f(?)", "det", "det_b(?)",
                  "det_f(?)", "det_i", "det_i_b(?)", "det_i_f(?)", "det_s", "det_s_b(?)",
                  "det_s_f(?)", "det_t", "det_t_b(?)", "det_t_f(?)", "ee", "ee_b(?)",
                  "ee_f(?)", "l", "likelihood.adjustedll", "likelihood.aic", "likelihood.aicc",
                  "likelihood.bic", "likelihood.bic2", "likelihood.bicc", "likelihood.df",
                  "likelihood.hannanquinn", "likelihood.ll", "likelihood.neffectiveobs",
                  "likelihood.nobs", "likelihood.nparams", "likelihood.ssqerr",
                  "log", "mhe", "mhe_b(?)", "mhe_f(?)", "omhe", "omhe_b(?)", "omhe_f(?)",
                  "out", "out_b(?)", "out_f(?)", "out_i", "out_i_b(?)", "out_i_f(?)",
                  "out_s", "out_s_b(?)", "out_s_f(?)", "out_t", "out_t_b(?)", "out_t_f(?)",
                  "period", "reg_i", "reg_i_b(?)", "reg_i_f(?)", "reg_s", "reg_s_b(?)",
                  "reg_s_f(?)", "reg_sa", "reg_sa_b(?)", "reg_sa_f(?)", "reg_t",
                  "reg_t_b(?)", "reg_t_f(?)", "reg_u", "reg_u_b(?)", "reg_u_f(?)",
                  "reg_y", "reg_y_b(?)", "reg_y_f(?)", "regression.description",
                  "regression.details.coefficients", "regression.details.covar",
                  "regression.details.covar-ml", "regression.easter", "regression.espan.end",
                  "regression.espan.missing", "regression.espan.n", "regression.espan.start",
                  "regression.leaster", "regression.lp", "regression.mean", "regression.missing(*)",
                  "regression.ml.parameters", "regression.ml.pcorr", "regression.ml.pcovar",
                  "regression.ml.pcovar-ml", "regression.ml.pscore", "regression.mu",
                  "regression.nao", "regression.nlp", "regression.nls", "regression.nmh",
                  "regression.nout", "regression.nso", "regression.ntc", "regression.ntd",
                  "regression.nusers", "regression.out(*)", "regression.outlier(*)",
                  "regression.td(*)", "regression.type", "regression.user(*)",
                  "residuals.bp", "residuals.bp2", "residuals.doornikhansen", "residuals.kurtosis",
                  "residuals.lb", "residuals.lb2", "residuals.lruns", "residuals.ludruns",
                  "residuals.mean", "residuals.nruns", "residuals.nudruns", "residuals.res",
                  "residuals.seasbp", "residuals.seaslb", "residuals.ser", "residuals.skewness",
                  "residuals.tsres", "residuals.type", "span.end", "span.missing",
                  "span.n", "span.start", "tde", "tde_b(?)", "tde_f(?)", "y", "y_b(?)",
                  "y_eb(?)", "y_ef(?)", "y_f(?)", "yc", "ycal")

  # jts<-rjd3toolkit::ts_r2jd(rjd3toolkit::ABS$X0.2.09.10.M)
  # jrslt<- rJava::.jcall("demetra/x13/r/X11", "Ljdplus/x11/X11Results;",
  #                       "process", jts,
  #                       rjd3x13::r2jd_spec_x11(rjd3x13::spec_x11_default()))
  # rjd3toolkit::dictionary(rjd3toolkit::jd3Object(jrslt, result = TRUE)) |>
  #   sort() |>
  #   dput()

  sa_x11 = c("b1", "b10", "b11", "b13", "b17", "b2", "b20", "b3", "b4",
             "b5", "b6", "b7", "b8", "b9", "c1", "c10", "c11", "c13", "c17",
             "c2", "C20", "c4", "c5", "c6", "c7", "c9", "d1", "d10", "d10a",
             "d11", "d11a", "d12", "d12a", "d13", "d2", "d4", "d5", "d6",
             "d7", "d8", "d9", "d9-global-msr", "d9-msr", "d9-msr-table",
             "seasonal-filters", "trend-filter", "x11-all")
  switch (x,
          x13 = sa_x13,
          regarima = sa_regarima,
          x11 = sa_x11
  )
}
