#' @importFrom RProtoBuf readProtoFiles2
#' @importFrom stats is.ts start
#' @include utils.R


.onLoad <- function(libname, pkgname) {

  if (! requireNamespace("rjd3sa", quietly = T)) stop("Loading rjd3 libraries failed")

    result <- .jpackage(pkgname, lib.loc=libname)
  if (!result) stop("Loading java packages failed")

  proto.dir <- system.file("proto", package = pkgname)
  readProtoFiles2(protoPath = proto.dir)
}

