#' Launches the corresponding SNPVisualizR shiny app.
#'
#' Function which launches the SNPVisualizR
#'
#'
#' @return Nothing; only runs shiny app.
#'
#'
#' @examples
#' \dontrun{
#'     runSNPVisualizR
#' }
runSNPVisualizR <- function(){
  drect <- system.file("shiny-scripts", package="SNPVisualizR")
  shiny::runApp(drect)
}
