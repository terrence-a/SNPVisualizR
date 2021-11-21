#' An S4 class to represent the contents of a FASTA file.
#'
#' @title faObj
#'
#' @description An S4 object which stores fasta file sequence data for use in the
#' functions as a part of this package.
#'
#' @slot sequenceData A data table containing the sequence data for the fasta
#' sequences.
#'
#'  @import data.table


setClass("faObj",
         slots = c(
            sequenceData = "data.table"
         ),
         prototype = list(
           sequenceData = data.table(chrName = character(), seq = character())
         )
         )
