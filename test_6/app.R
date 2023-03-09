## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Some dashboard"),
  
  dashboardSidebar(

  ),#close dashboardSidebar
  
  dashboardBody(
    textInput("text_1", "Put yu some text")
  )#close dashboardBody
)

server <- function(input, output) {
 
}

shinyApp(ui, server)