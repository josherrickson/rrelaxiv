test_that("Basic test of RELAX-IV", {
  data(relaxexample)
  results <- RELAX_IV(relaxexample$startnodes,
                      relaxexample$endnodes,
                      relaxexample$arccosts,
                      relaxexample$arccapacity,
                      relaxexample$nodedemand)

  expect_true(is.numeric(results))
  expect_true(all(results) >= 0)
  expect_equal(length(results),
               length(relaxexample$startnodes))
})

test_that("Basic test of .RELAX-IV", {
  data(relaxexample)
  re <- relaxexample
  results <- .RELAX_IV(
    n1 = as.integer(length(unique(c(re$startnodes, re$endnodes)))),
    na1 = as.integer(length(re$startnodes)),
    startn1 = as.integer(re$startnodes),
    endn1 = as.integer(re$endnodes),
    c1 = as.integer(re$arccosts),
    u1 = as.integer(re$arccapacity),
    b1 = as.integer(re$nodedemand),
    rc1 = as.integer(re$arccosts), # No reduced costs for now
    crash1 = as.integer(0),
    large1 = as.integer(.Machine$integer.max / 4))


  expect_true(is.numeric(results$x1))
  expect_true(all(results$x1) >= 0)
  expect_equal(length(results$x1),
               length(relaxexample$startnodes))
})
