#' loadVCF loads a vcf file's contents into a VCF object for use with the other
#' functions within this package.
#'
#' @param filepath A string path to the vcf file you would like to load. Please
#' ensure that your file meets the 1000Genomes VCF v4.0 file specification.
#' @param fileSizeLimit number of lines to process (useful with very
#' large files) (1E06 by default).
#' @param annotated A logical stating whether or not your vcf file has been
#' annotated.
#' @return a vcfObj with the corresponding species name, contig data and
#' variant data
#'
#' @export
#' @importFrom methods new
#' @importFrom data.table data.table


loadVCF <- function(filepath, fileSizeLimit = 100000, annotated=FALSE){
  vcfObject <- new("vcfObj")
  con <- file(filepath, "r")
  x <- 0
  bp <- FALSE
  while(TRUE){
    currline <- readLines(con, n=1)
    if(length(currline) == 0 || x > fileSizeLimit){break}
    x <- x + 1

    #TODO contig Parsing and Proper Chromosome Naming.
    #if(grep("##contig=",currline)){
      #grab contig data and put it into the thingy.
     # vcfObject@contigInfo <- append(vcfObject@contigInfo, "example contig")
    #}

    if(bp){
      #put the variant information into the file.
      chop <- strsplit(currline, "\t") #tab delimitation.

      chr <- chop[[1]][1]
      posi <- strtoi(chop[[1]][2])
      refAl <- chop[[1]][4]
      altAl <- chop[[1]][5]
      variEntry <- data.table(
        ch=chr,
        pos=strtoi(posi),
        ref_a = refAl,
        alt_a = altAl
      )
      #variEntry@id <- chop[[1]][3]
      #variEntry@ref_a <- chop[[1]][4]
      #variEntry@alt_a <- chop[[1]][5]
      #variEntry@qual <- chop[[1]][6]
      #variEntry@filter <- chop[[1]][7]

      vcfObject@variantData <- rbindlist(list(vcfObject@variantData, variEntry))
    }
    #checking for the #chrom header line to start parsing vcf files.
    if(tolower(substr(currline, 1, 6)) == "#chrom"){
      bp = TRUE
    }
  }
  close(con)
  return(vcfObject)
}


