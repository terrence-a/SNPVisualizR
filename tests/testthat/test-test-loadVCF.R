library(SNPVisualizR)

test_that("basic file loading (vcf)", {
  b <- loadVCF("text000.vcf")
  expect_true(length(b) > 0)
  expect_equals(length(b@variantData), 4)
  expect_equals(b@variantData[1,1])

})

test_that("plot created with no error") {
  b <- loadVCF("text000.vcf")

  expect_true(!is.null(plotPosition(b)))
}

test_that("calculateTiTv returns expected (manually calculated) value.") {
  b <- loadVCF("text000.vcf")

  expect_equal(calculateTiTv(b), 1.804094)
  # This isn't a very promising Ti/Tv, but it's the one we've got.
}

test_that("basic file loading (fa)", {
  b <- loadFA("test01.fa")

  expect_true(length(m@sequenceData) > 0)
  expect_true(length(m@sequenceData$seq[1]) > 0)
})
