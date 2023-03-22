library(shiny)

ui <- fluidPage(
  fluidRow(
    column(3,
           "sidebar",

    ),
    column(9,
           "main"
    )
  )
)

server <- function(input, output) {}

shinyApp(ui, server)