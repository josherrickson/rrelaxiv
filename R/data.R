##' An example of a small network flow input.
##' @title Sample data set for RELAX-IV solver
##' @source A graph consisting of 32 nodes, based upon \code{nuclearplants} data
##'   set in the \code{optmatch} package.
##' @format A list containing 5 elements. This 32 node graph contains 274
##'   edges/arcs. This information is encoded in the first four elements of the
##'   list.
##' \itemize{
##'   \item \code{startnodes} and \code{endnodes} contains the start and end
##'     node for each edge/arc.
##'   \item \code{arccosts} and \code{arcapacity} contain the cost and
##'     capacity of each edge/arc.
##'   \item \code{nodedemand} contains the demand for each of the 32 nodes.
##' }
##' @keywords datasets
"relaxexample"
