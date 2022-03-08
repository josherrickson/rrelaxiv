test_that("Basic test", {
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
