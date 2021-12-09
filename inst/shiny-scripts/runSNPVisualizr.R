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
        h3("Sidebar Title"),
        p("placeholdertext placeholdertext placeholdertext"),
        ## As seen above, html-like elements can be added to the webapp by putting
        ## them in this fomat:
        ## <tag>[contentcontent]</tag> -> tag([contentcontentcontent])

        ## Now for some fun stuffs:
        ## Shiny is a webapp , and thus we have to have controls for things like
        ## server functions and file uploading and such.

        ## FILE INPUT - ui
        ## fileInput() is a function which allows a user to upload a file to the function.
        ## this fileInput below will be used for uploading vcf files.
        fileInput("file1", label = "Upload a vcf file... ", accept=".vcf")

        #plotOutput("vcfPlot")
      ),
      ## 2. The main panel
      mainPanel(
        ## Usually, the main panel contains the main stuff, so plots that depend
        ## on inputs that might be modified in the sidebar
        h1("Main Panel Title"),
        p("This is text that also goes in the main "),
        plotOutput("positionPlot")
      )
    )
  )

  ## The server function exists to provide server logic to the shiny app.
  ## You can use this to create "reactive" apps which change "instantly"
  ## depending on inputs that can be changed.
  server <- function(input, output) {
    output$positionPlot <- renderPlot({
      file <- input$file1
      ext <- tools::file_ext(file)
      req(file)

      validate(need(ext == "vcf", "Please upload a vcf file"))

      plotOb <- loadVCF(file$datapath)
      plotPosition(plotOb)
    })
  }

shinyApp(ui,server)
