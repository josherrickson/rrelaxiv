##' RELAX-IV Algorithm
##'
##' @param n1 Number of nodes
##' @param na1 Number of arcs
##' @param startn1 Starting nodes
##' @param endn1 Ending nodes
##' @param c1 Costs vector
##' @param u1 Capacities
##' @param b1 Demands
##' @param x1 ? All 0's? Vector for exporting?
##' @param crash1 Set crash equal to 1 to activate an auction/shortest
##'   path subroutine for getting the initial price-flow pair. this is
##'   recommended for difficult problems where the default
##'   initialization yields long solution times.
##' @param large1 A very large integer to represent infinity
##' @param feasible1 ???
##' @return ????
##' @author Josh Errickson
relaxiv <- function(n1,
                    na1,
                    startn1,
                    endn1,
                    c1,
                    u1,
                    b1,
                    x1,
                    crash1,
                    large1,
                    feasible1) {
  .Fortran("relaxalg",
           n1,
           na1,
           startn1,
           endn1,
           c1,
           u1,
           b1,
           x1,
           crash1,
           large1,
           feasible1,
           NAOK = FALSE,
           DUP = TRUE,
           PACKAGE = "optmatch")
}
