#' An S4 class which represents a variant entry (within a vcf file).
#' See 1000Genome's VCF4.2 definition (samtools github for additional information on 4.2)
#'
#' @slot species The VCF file's corresponding species.
#' @slot contigInfo A list containing objects with the contig info.
#' @slot variantData A list containing variant data (reference|alt)
#' @slot id The ID of the variant's entry.
#' @slot ref_a The Reference Allele
#' @slot alt_a The alternate Allele.
#' @slot qual The quality of the variant
#' @slot filter whether the variant passes any filters that have been
#'
#' @export

setClass("variantEntry",
         slots = c(
           chrom = "character",
           position = "character",
           id = "character",
           ref_a = "character",
           alt_a = "character",
           qual = "character",
           filter = "character"
         )
)

