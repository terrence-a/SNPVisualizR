#' An S4 class to represent a vcf file's variant data.
#'
#' @title vcfObj
#'
#' @description An S4 object which stores the vcf entries for usee in the
#' functions as a part of this package.
#'
#' @slot species The VCF file's corresponding species.
#' @slot contigInfo A vector containing objects with the contig info.
#' @slot variantData A data table containing the vcf entries.
#'
#' @export
#' @import data.table

library(data.table)

setClass("vcfObj",
         slots = c(
           species = "character",
           contigInfo = "vector",
           variantData = "data.table"
          ),
         prototype = list(
           species = "",
           contigInfo = character(),
           variantData = data.table(
             ch = character(),
             pos = numeric(),
             ref_a = character(),
             alt_a = character())
         )
         )

