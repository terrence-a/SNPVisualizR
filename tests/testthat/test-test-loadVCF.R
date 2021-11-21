library(SNPVisualizR)

test_that("basic file loading (vcf)", {
  b <- loadVCF("text000.vcf")
  expect_true(length(b) > 0)
  expect_equal(length(b@variantData), 4)
  expect_equal(as.numeric(b@variantData[1,1]), 3)

})

test_that("plot created with no error", {
  b <- loadVCF("text000.vcf")

  expect_true(!is.null(plotPosition(b)))

})

test_that("calculateTiTv returns expected (manually calculated) value.", {
  b <- loadVCF("text000.vcf")
  expected <- 617/342
  expect_equal(calculateTiTv(b), expected)
  # This isn't a very promising Ti/Tv, but it's the one we've got.
})

test_that("basic file loading (fa)", {
  b <- loadFA("test01.fa")

  expect_true(length(b@sequenceData) > 0)
  expect_true(length(b@sequenceData$seq[1]) > 0)
})
