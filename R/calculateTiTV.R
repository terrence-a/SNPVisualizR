#' A function which calculates the Transition/Transversion ration for a sample
#' of vcf entries given a vcfObj
#'
#' @param vcfObj A VcfObj S4 object (produced by loadVCF)
#' @return a summary table of counts and ratios.
#'
#' @export
#'
#' @examples
#' vcfData <- loadVCF("inst/examples/text000.vcf)
#' calculateTiTv(vcfData)
#'
#' @references
#' Wang, Jing et al. “Genome measures used for quality control are dependent on
#' gene function and ancestry.” Bioinformatics (Oxford, England) vol. 31,3
#' (2015): 318-23. doi:10.1093/bioinformatics/btu668

ref_a <- alt_a <- NULL
calculateTiTv <- function(vcfObj){
  #it's just the ratio of A<->G + C<->T changes / the rest.
  #literally could be written in 1 line i think this is the right way to
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
