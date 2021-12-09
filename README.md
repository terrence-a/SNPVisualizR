
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SNPVisualizR

<!-- badges: start -->
<!-- badges: end -->

## Description

SNPVisualizR is an R package for analysis, and integration of genetic
variation data for use in R. SNPVisualizR allows users to load variant
information from vcf files. SNPVisualizR seeks to provide an easy-to-use
interface to work with variant information within R. R Version

## Installation

To download the package:

``` r
# install.packages("devtools")
devtools::install_github("terrence-a/SNPVisualizR")
library("SNPVisualizR")
```

To run the shinyApp:

``` r
SNPVisualizR::runSNPVisualizR()
```

## Overview

``` r
ls("package:SNPVisualizR")
```

SNPVisualizR’s main functions `plotPosition` and `calculateTiTV` rely on
S4 objects created in R with the `loadvcf` and `loadfa` functions. This
is a basic example which shows you have to create an object (assuming
the file exists) And display a stacked percentage plot of the snp
frequencies per position.

``` r
library(SNPVisualizR)

vcfData <- loadVCF("path/to/file")
plotPosition(vcfData)
```

The above example creates an S4 Object with the attributes “species” and
“variantInformation”. Each attribute contains the corresponding
information based of the contents of the given .vcf file. Refer to
package vignettes for more details.

``` r
browseVignettes("TestingPackage")
```

## Contributions

The author of this package is Terrence Amponsah. The loadVCF and loadFA
functions are used to load and create R object based on the
corresponding VCF and FASTA file, respectively. The *LoadFA* function
makes use of the `seqinr` package’s `read.fasta` function. The
*plotPosition* function uses the `ggplot2` package to create the
graphics.

## References

R Core Team (2021) R: A language and environment for statistical
computing. R Foundation for Statistical Computing, Vienna Austria.
<https://www.R-project.org>

Wickham, H. and Bryan, J. (2019). *R Packages* (2nd Edition). Newton,
Massachusetts: O’Reilly Media. <https://r-pkgs.org/>

Wickham H (2016). ggplot2: Elegant Graphics for Data Analysis.
Springer-Verlag New York. ISBN 978-3-319-24277-4,
<https://ggplot2.tidyverse.org>.

Charif D, Lobry J (2007). “SeqinR 1.0-2: a contributed package to the R
project for statistical computing devoted to biological sequences
retrieval and analysis.” In Bastolla U, Porto M, Roman H, Vendruscolo M
(eds.), *Structural approaches to sequence evolution: Molecules,
networks, populations, series Biological and Medical Physics, Biomedical
Engineering*, 207-232. Springer Verlag, New York. ISBN :
978-3-540-35305-8.

Wang, Jing et al. “Genome measures used for quality control are
dependent on gene function and ancestry.” *Bioinformatics* (Oxford,
England) vol. 31,3 (2015): 318-23. <doi:10.1093/bioinformatics/btu668>
\#\# Acknowledgements

This package was developed as part of an assessment for 2021 BCB410H:
Applied Bioinformatics, University of Toronto, Toronto, CANADA

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.
