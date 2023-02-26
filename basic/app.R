library("shiny")
ui <- fluidPage(
      mainPanel(
        img(src='Donut.jpg', align = "center")
      )
    )#close fluidPage

server <- function(input, output) {

}#close server
shinyApp(ui, server)