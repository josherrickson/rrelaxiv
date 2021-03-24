#' @useDynLib rrelaxiv, .registration=TRUE
NULL
# > NULL

.onAttach <- function(lib, pkg) {
  packageStartupMessage(paste("The rrelaxiv package has an academic license.
                               Enter relaxinfo() for more information."))
}
