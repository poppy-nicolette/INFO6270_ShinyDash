#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

ui <- fluidPage(
  textOutput("text"),
  verbatimTextOutput("code")
)
server <- function(input, output, session) {
  output$text <- renderText({ 
    "Let's see some basic stats on values from 1 to 100" 
  })
  output$code <- renderPrint({ 
    summary(1:100) 
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
