##' RELAX-IV Algorithm
##'
##' @param startnodes A vector of starting nodes.
##' @param endnodes A vector of ending nodes.
##' @param arccosts A vector of arc costs.
##' @param arccapacity A vector of arc capacities.
##' @param supply A vector of supplies.
##' @return The solution.
##' @export
##' @examples
##' data(relaxexample)
##' RELAX_IV(relaxexample$startnodes,
##'          relaxexample$endnodes,
##'          relaxexample$arccosts,
##'          relaxexample$arccapacity,
##'          relaxexample$supply)
RELAX_IV <- function(startnodes, endnodes, arccosts, arccapacity, supply) {
  stopifnot(length(startnodes) == length(endnodes),
            length(startnodes) == length(arccosts),
            length(startnodes) == length(arccapacity))

  out <- .Fortran("relaxalg",
                  n1 = as.integer(length(unique(c(startnodes, endnodes)))),
                  na1 = as.integer(length(startnodes)),
                  startn1 = as.integer(startnodes),
                  endn1 = as.integer(endnodes),
                  c1 = as.integer(arccosts),
                  u1 = as.integer(arccapacity),
                  b1 = as.integer(supply),
                  x1 = integer(length(startnodes)),
                  crash1 = as.integer(0),
                  large1 = as.integer(.Machine$integer.max/4),
                  feasible1 = integer(1),
                  NAOK = FALSE,
                  DUP = TRUE,
                  PACKAGE = "rRELAXIV")

  if (out$feasible1 == 0) {
    stop("Not feasible")
  } else {
    return(out$x1)
  }
}

##' Lower-level access to the RELAX-IV algorithm
##'
##' `.RELAX_IV` provides low-level access to the FORTRAN; taking the
##' exact input as the FORTRAN code. It does NOT do any input checking.
##' @param n1 Number of nodes
##' @param na1 Number of arcs
##' @param startn1 Starting nodes
##' @param endn1 Ending nodes
##' @param c1 Costs vector
##' @param u1 Capacities
##' @param b1 Demands
##' @param x1 ???
##' @param crash1 Set crash equal to 1 to activate an auction/shortest
##'   path subroutine for getting the initial price-flow pair. this is
##'   recommended for difficult problems where the default
##'   initialization yields long solution times.
##' @param large1 A very large integer to represent infinity
##' @param feasible1 ???
##' @return A list containing all parameters, where `x1` has been updated to contain the solution, and `feasible1` contains a flag for feasibility.
##' @export
.RELAX_IV <- function(n1, na1, startn1, endn1, c1, u1, b1,
                      x1, crash1, large1, feasible1) {
  .Fortran("relaxalg",
           n1, na1, startn1, endn1, c1, u1, b1,
           x1, crash1, large1, feasible1,
           NAOK = FALSE,
           DUP = TRUE,
           PACKAGE = "rRELAXIV")
}
