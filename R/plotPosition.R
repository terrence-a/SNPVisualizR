#'Function which plots the variants by their position on the chromosome.
#'
#' @name plotPosition
#'
#' @param vcfInput A VCFObj S4 object which contains variant entries.
#' @param sections number of sections to include in the position plot
#' (wrapper parameter for ggplot2's "bins")
#' @param color color variants by filter, showing percent variants'
#' postion colored by filter. TRUE or FALSE
#' @param separate group variant entries and show position by group TRUE or FALSE
#'
#' @examples
#' # First, load vcf data into variable.
#' vcfData <- loadVCF(
#'   system.file("extdata", 'text000.vcf', package = "SNPVisualizR")
#' )
#' plotPosition(vcfData, color=TRUE, separate=TRUE)
#'
#' @export
#' @import ggplot2
#'
#'

#TODO Further options (color, seperations) Filter by chromosome by default.

#For Roxygen global functions.
plotPosition <- pos <- ch <- NULL

library(ggplot2)

plotPosition <- function(vcfInput,
                         sections=300,
                         color= TRUE,
                         separate = FALSE){

  if(color & separate){
    return(ggplot(vcfInput@variantData, aes(fill=ch, x=pos)) +
             geom_histogram(bins=sections, size=1) + facet_wrap(~ch))
  }

  #default.
  if(color){
    return(ggplot(vcfInput@variantData, aes(fill=ch, x=pos)) +
      geom_histogram(bins=sections, size=1))

  }

  if(separate){
    return(ggplot(vcfInput@variantData, aes(x=pos)) +
      geom_histogram(bins=sections, size=1) +
      facet_wrap(~ch))
  }



}
