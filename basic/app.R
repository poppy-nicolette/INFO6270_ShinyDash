

library(shiny)

ui <- fluidPage(
  dataTableOutput("dynamic")
  
)#close fluidPage

server <- function(input, output) {
  output$dynamic <- renderDataTable(mtcars, options=list(pageLength = 6)
  )#close renderDataTable
}#close server
  
shinyApp(ui, server)
