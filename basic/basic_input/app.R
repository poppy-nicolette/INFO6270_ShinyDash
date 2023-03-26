library(shiny)
flavors <- c("chocolate", "plain", "raspberry", "maple", "unicorn", "creme-filled", "sprinkles", "chef's choice")
ui <- fluidPage(
  textInput("input_1", "What's your favorite donut?"),
  passwordInput("pword_1", "If a donut was your password, what would it be?"),
  textAreaInput("bio", "Please describe yourself as a donut", rows = 3),
  selectInput("flavor_1", "What flavor of donut would you like?", flavors, multiple=TRUE),
  
  tags$style("@import url(https://use.fontawesome.com/releases/v6.3.0/css/all.css);"),
  actionButton(inputId='link_1', label="See our location", 
               icon = icon("book"), 
               onclick ="window.open('https://goo.gl/maps/PrUi3qKEc3WFg9Hz7', '_blank')"),
  textOutput("text")
)

server <- function(input, output){
  output$text <- renderText({input$input_1})
}

# Run the application 
shinyApp(ui = ui, server = server)


