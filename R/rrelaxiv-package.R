#' @useDynLib rRELAXIV, .registration=TRUE
NULL
# > NULL

.onAttach <- function(lib, pkg) {
  packageStartupMessage(paste("The rRELAXIV package has an academic license.
                               Enter relaxinfo() for more information."))
}
