relaxexample <- list(
  startnodes = read.csv("startnodes.csv", header = TRUE)$x,
  endnodes   = read.csv("endnodes.csv",   header = TRUE)$x,
  arccosts = read.csv("arccosts.csv", header = TRUE)$x,
  arccapacity = read.csv("arccapacity.csv", header = TRUE)$x,
  nodedemand = read.csv("nodedemand.csv", header = TRUE)$x)

usethis::use_data(relaxexample, overwrite=TRUE)
