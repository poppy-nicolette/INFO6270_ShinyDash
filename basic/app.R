

library(shiny)

ui <- fluidPage(
  dateInput("order_1", "What date do you want to order donuts?"),
  dateRangeInput("delivery_1","Between what dates do you want the donuts delivered?")
  
)#close fluidPage

server <- function(input, output){
}

# Run the application 
shinyApp(ui = ui, server = server)
