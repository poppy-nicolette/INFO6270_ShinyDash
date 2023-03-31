library(shiny)

ui <- fluidPage(
  fluidRow(
    column(9,
           "Some text here",

    ),
    column(3,
           "main"
    )
  )
)

server <- function(input, output) {}

shinyApp(ui, server)