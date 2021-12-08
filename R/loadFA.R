#' Loads the contents of the fasta file and returns a S4 object containing the
#' sequence information as a data frame
#'
#' @name loadFA
#'
#' @param filepath A string path to the vcf file you would like to load. Please
#' ensure that your file meets {specification something}
#'
#' @return an faObj containing the sequence data.
#'
#' @export loadFA
#' @import methods
#' @import data.table
#' @import seqinr
#'
#' @examples
#' #fafile contains the relative path the file.
#' fafile <- system.file("extdata", "test01.fa", package="SNPVisualizR")
#' faObj <- loadFA(fafile)

filepath <- name <- NULL



loadFA <- function(filepath) {
    faObject <- new("faObj")
    fafile <- filepath
    fileContents <- seqinr::read.fasta(file = fafile, as.string=TRUE)
    #The number of annotations in the file.

    for(ite in 1:length(fileContents)){
      #
      newFaSeq <- data.table(
        chrName = attr(fileContents[[ite]], "name"),
        seq = toString(fileContents[[ite]])
      )
      faObject@sequenceData <- rbindlist(list(faObject@sequenceData, newFaSeq))
    }
    return(faObject)

}

