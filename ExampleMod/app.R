library(shiny)

# Define UI for displaying current time ----

ui <- fluidPage(

  title = "The time is near...",
  
  h2(textOutput("currentTime")),
  h3("This is the current time in Halifax, Nova Scotia."),
  p("Do you know where your priorities are?")
  
)#close fluidPage

# Define server logic to show current time, update every second ----
server <- function(input, output, session) {
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    paste("The current time is", Sys.time())
  })
}
# Create Shiny app ----

shinyApp(ui, server)
