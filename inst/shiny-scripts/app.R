library(shiny)
library(ggplot2)
library(SNPVisualizR)

ui <- fluidPage(

    titlePanel("SNPVisualizR"),

    ## sidebar Layout consists of the sidebar and the other portion of the page.
    ## Usually there's a sidebar on the left with options and upload and then
    ## the displayed output on the right.

        sidebarLayout(
          ## The sidebar layout consists of 2 things usually,
          ## 1. A sidebar panel which contains the items which go in the sidebar.
          sidebarPanel(
            ## In the sidebar panel, you can put all the plots info options etc. that
            ## affect the output that may be in the main panel
            h3("Options"),
            p("This shiny page shows the output of plotPosition() which creates a a position plot for the vcf data oploaded."),
            ## As seen above, html-like elements can be added to the webapp by putting
            ## them in this fomat:
            ## <tag>[contentcontent]</tag> -> tag([contentcontentcontent])

            ## Now for some fun stuffs:
            ## Shiny is a webapp , and thus we have to have controls for things like
            ## server functions and file uploading and such.

            ## FILE INPUT - ui
            ## fileInput() is a function which allows a user to upload a file to the function.
            ## this fileInput below will be used for uploading vcf files.
            fileInput("file1", label = "Upload a vcf file... ", accept=".vcf"),

          ),
          mainPanel(
        tabsetPanel(
          tabPanel("PositionPlot", fluid = TRUE,
          ## 2. The main panel
            ## Usually, the main panel contains the main stuff, so plots that depend
            ## on inputs that might be modified in the sidebar
            h3("Position Plot"),
            p("(colored by chrom.)"),
            plotOutput("positionPlot")

        ),
        tabPanel("Separated Position Plot", fluid = TRUE,
                   h3("Position Plot"),
                   p("(Separated by chrom.)"),
                   plotOutput("positionPlotc")

        ),
        tabPanel("VCF Stats", fluid = TRUE,
                   h3("VCF Stats"),
                   p("Ti/Tv ratio: "), textOutput("VCFStats")
                 )
        )
        )
    )
  )

  ## The server function exists to provide server logic to the shiny app.
  ## You can use this to create "reactive" apps which change "instantly"
  ## depending on inputs that can be changed.
  server <- function(input, output) {

    output$positionPlot <- renderPlot({
      withProgress(message = 'Creating Plot...', {
        file <- input$file1
        ext <- tools::file_ext(file)

        req(file)

        validate(need(ext == "vcf", "Please upload a vcf file"))

        plotOb <- loadVCF(file$datapath)


        plotPosition(plotOb, color=TRUE, separate=FALSE)
    })})
    output$positionPlotc <- renderPlot({
      withProgress(message = "Creating Plot...", {
      file <- input$file1
      ext <- tools::file_ext(file)

      req(file)

      validate(need(ext == "vcf", "Please upload a vcf file"))

      plotOb <- loadVCF(file$datapath)

      plotPosition(plotOb, color=TRUE, separate = TRUE)
    })})
    output$VCFStats <- renderText({
      withProgress(message = "Calculating Ratio", {
        file <- input$file1
        ext <- tools::file_ext(file)

        req(file)

        validate(need(ext == "vcf", "Please upload a vcf file"))

        plotOb <- loadVCF(file$datapath)

        paste("Ti/Tv Ratio:", calculateTiTv(plotOb))
    })})
  }

shinyApp(ui,server)
