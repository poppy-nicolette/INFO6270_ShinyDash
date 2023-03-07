# Example of a shiny application with a sidebar layout and a selectInput control widget
library(shiny)

# Define UI
ui <- fluidPage(
  # Sidebar Layout
  sidebarLayout(
    # Sidebar Layout Elements (i.e. the panels)
    sidebarPanel = sidebarPanel(
      #Control Widget
      selectInput(
        inputId = "input_1",
        label = "Short description of control widget",
        choices = c(
          "Egg 'n' Cheese" = "4.25",
          "Cheese Toast" = "3.50",
          "Avocado Smash" = "6.95"
        )#close choices
      )#close selectInput
    ),#cllose sidebarPanel
    
    mainPanel = mainPanel(textOutput("output_1"))
  
    )#close sidebarLayout
  )#close fluidPage

# Server function
server <- function(input, output) {
  
  output$output_1 <- renderText({
    paste("Your selection costs: $", input$input_1, sep="")
  })#close renderText
}

# Run the application
shinyApp(ui = ui, server = server)