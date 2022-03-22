##' RELAX-IV Algorithm
##'
##' This provides an interface to the RELAX_IV minimum cost flow solver. It
##' provides input santization and returns the flow solution.
##' @param startnodes A vector of starting nodes.
##' @param endnodes A vector of ending nodes.
##' @param arccosts A vector of arc costs.
##' @param arccapacity A vector of arc capacities.
##' @param supply A vector of supplies.
##' @return The flow solution.
##' @export
##' @seealso \code{\link{.RELAX_IV}} for a more advanced interface and set of returned
##'   results.
##' @examples
##' data(relaxexample)
##' RELAX_IV(relaxexample$startnodes,
##'          relaxexample$endnodes,
##'          relaxexample$arccosts,
##'          relaxexample$arccapacity,
##'          relaxexample$nodedemand)
RELAX_IV <- function(startnodes,
                     endnodes,
                     arccosts,
                     arccapacity,
                     supply) {
  if (length(startnodes) != length(endnodes) ||
    length(startnodes) != length(arccosts) ||
    length(startnodes) != length(arccapacity)) {
    stop(paste(
      "Each of startnodes, endnodes, arccosts and arccapcity must be",
      "the same length"
    ))
  }
  if (length(supply) != length(unique(c(startnodes, endnodes)))) {
    stop(paste(
      "Each node must have a supply (length of supply must equal",
      "length of unique nodes in startnodes or endnodes)"
    ))
  }

  out <- .Fortran("relaxalg",
    n1 = as.integer(length(unique(c(startnodes, endnodes)))),
    na1 = as.integer(length(startnodes)),
    startn1 = as.integer(startnodes),
    endn1 = as.integer(endnodes),
    c1 = as.integer(arccosts),
    u1 = as.integer(arccapacity),
    b1 = as.integer(supply),
    x1 = integer(length(startnodes)),
    rc1 = as.integer(arccosts), # all dual prices = 0, so reduced
                                # cost is set equal to cost
    crash1 = as.integer(0),
    large1 = as.integer(.Machine$integer.max / 4),
    feasible1 = integer(1),
    NAOK = FALSE,
    DUP = TRUE,
    PACKAGE = "rrelaxiv"
  )

  return(out$x1)
}

##' Lower-level access to the RELAX-IV algorithm
##'
##' \code{.RELAX_IV} provides low-level access to the FORTRAN; taking the exact
##' input as the FORTRAN code. It does NOT do any input checking.
##' @param n1 Number of nodes
##' @param na1 Number of arcs
##' @param startn1 Starting nodes
##' @param endn1 Ending nodes
##' @param c1 Costs vector
##' @param u1 Capacities
##' @param b1 Demands
##' @param rc1 Reduced Costs
##' @param crash1 Set crash equal to 1 to activate an auction/shortest path
##'   subroutine for getting the initial price-flow pair. this is recommended
##'   for difficult problems where the default initialization yields long
##'   solution times.
##' @param large1 A very large integer to represent infinity
##' @return A list containing all parameters, as well as `x1` which contains the
##'   solution, and `feasible1` which contains a flag for feasibility.
##' @export
##' @seealso \code{\link{RELAX_IV}} for a more user-friendly interface.
.RELAX_IV <- function(n1,
                      na1,
                      startn1,
                      endn1,
                      c1,
                      u1,
                      b1,
                      rc1,
                      crash1,
                      large1) {
  .Fortran("relaxalg",
    n1 = n1,
    na1 = na1,
    startn1 = startn1,
    endn1 = endn1,
    c1 = c1,
    u1 = u1,
    b1 = b1,
    x1 = integer(length(startn1)),
    rc1 = rc1,
    crash1 = crash1,
    large1 = large1,
    feasible1 = integer(1),
    NAOK = FALSE,
    DUP = TRUE,
    PACKAGE = "rrelaxiv"
  )
}
