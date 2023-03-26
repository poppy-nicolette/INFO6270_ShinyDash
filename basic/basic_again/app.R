library(shiny)
library(bslib)

ui <- fluidPage(
  theme = bs_theme( 
    bg = "#175d8d", 
    fg = "#d5fbfc", 
    primary = "	#e3fffc", 
    base_font = font_google("Open Sans"),
    code_font = font_google("Roboto Mono")
  ),
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose a CSV  format File", accept = ".csv"),
      checkboxInput("header", "Header", TRUE)
    ),
    mainPanel(
      tableOutput("contents")
    ) #close mainPanel
  )#close sidebarLayout
)#close fluidPage

server <- function(input, output) {
  output$contents <- renderTable({
    file <- input$file1
    ext <- tools::file_ext(file$datapath)
    
    req(file)
    validate(need(ext == "csv", "Please upload a csv format file"))
    
    read.csv(file$datapath, header = input$header)
  })#close renderTable
}#close function

shinyApp(ui, server)