library(shiny)
data <- mtcars

ui <- fluidPage(
  title = "some dashboard",
  column(4,
         p('select number of rows to be shown'),
         numericInput("x", "value", 5),
         br(),
         actionButton("button", "show the number of rows")
  ),
  column(8, tableOutput("table"))
)
server <- function(input, output){
  
  observeEvent(input$button, {
    cat("Show", input$x, "rows\n")#ths is priting in the console
  })
  df <- eventReactive(input$button, {
    head(data, input$x)
  })
  output$table <- renderTable({
    df()
    })
}

shinyApp(ui, server)