library("shiny")
ui <- fluidPage(
  h1("Some text about donuts"),
  h2("Yeah! Phil is buying donuts!"),
      mainPanel(
        img(src='Donut.jpg', align = "center")
      )
      
    )#close fluidPage

server <- function(input, output) {

}#close server
shinyApp(ui, server)