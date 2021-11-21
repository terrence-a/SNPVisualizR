#'Function which plots the variants by their position on the chromosome.
#'
#' @name plotPosition
#'
#' @param vcfInput A VCFObj S4 object which contains variant entries.
#' @param faInput Optional; a S4 object which contains the fa sequences.
#' @param sections number of sections to include in the position plot ()
#' @param colorBy color variants by filter, showing percent variants'
#' postion colored by filter
#' @param divideBy group variant entries and show position by group
#'
#' @examples
#' # First, load vcf data into variable.
#' getwd()
#' vcfData <- loadVCF(
#'   system.file("extdata", 'text000.vcf', package = "SNPVisualizR)
#' )
#' plotPosition(vcfData)
#'
#' @references
#'
#' @export
#' @import ggplot2
#'
#'

#TODO Further options (color, seperations) Filter by chromosome by default.

#For Roxygen global functions.
plotPosition <- post <- ch <- NULL

library(ggplot2)

plotPosition <- function(vcfInput, faInput,
                         sections=300,
                         colorBy="chrom",
                         divideBy="chrom"){
  if(colorBy == "chrom"){
    ggplot(vcfInput@variantData, aes(fill=ch, x=pos)) + geom_histogram(bins=300, size=1)
  }
}
