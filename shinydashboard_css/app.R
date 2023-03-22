library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "This is Times New Roman"),
  dashboardSidebar(),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    )#close tags head
  )#close dashboardBody
)#close dashboardPage

server <- function(input, output) { }

shinyApp(ui, server)