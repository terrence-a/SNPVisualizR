#'A function which calculated the Ti/Tv ratio for a sample of vcf entries
#'given a vcfObj.
#'
#' @name calculateTiTv
#'
#' @param vcfObj A VcfObj S4 object (produced by loadVCF)
#' @return a summary table of counts and ratios.
#'
#' @export calculateTiTv
#'
#' @description A function which calculates the Transition/Transversion ratio
#' for a sample of vcf entries given a vcfObj
#'
#' @examples
#' vcfData <- loadVCF(system.file("extdata", "text000.vcf", package="SNPVisualizR"))
#' calculateTiTv(vcfData)
#'
#' @references
#' Wang, Jing et al. “Genome measures used for quality control are dependent on
#' gene function and ancestry.” Bioinformatics (Oxford, England) vol. 31,3
#' (2015): 318-23. doi:10.1093/bioinformatics/btu668

calculateTiTv <- ref_a <- alt_a <- vcfObj <- NULL

calculateTiTv <- function(vcfObj){
  ti <- vcfObj@variantData[
    (ref_a == "A" & alt_a == "G") |
    (ref_a == "G" & alt_a == "A") |
    (ref_a == "T" & alt_a == "C") |
    (ref_a == "C" & alt_a == "T") ]

  tv <- vcfObj@variantData[
      (ref_a == "A" & alt_a == "C") | (ref_a == "C" & alt_a == "A" )|
      (ref_a == "T" & alt_a == "A") | (ref_a == "A" & alt_a == "T" )|
      (ref_a == "G" & alt_a == "C") | (ref_a == "C" & alt_a == "G" )|
      (ref_a == "T" & alt_a == "G") | (ref_a == "G" & alt_a == "T" )
      ]
  return(nrow(ti)/nrow(tv))
}
