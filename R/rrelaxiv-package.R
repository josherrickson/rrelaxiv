#' @useDynLib rRELAXIV, .registration=TRUE
NULL
#> NULL

.onAttach <- function(lib, pkg) {
packageStartupMessage("The rRELAXIV package has an academic license. Enter relaxinfo() for more information.")
}
