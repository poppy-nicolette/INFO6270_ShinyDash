library(shiny)
library(DT)
library(tidyverse)


path <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/comic-characters/marvel-wikia-data.csv"

# This will read the first sheet of the Excel file
comics_data <- read_csv(path)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      h2("How to use DataTables from the DT library"),
      br(),
      p("To the right is a dataset displayed as a DataTable"), 
      p("This dataset is from the fivethirtyeight GitHub repository."),
      style="background-color:#6600ff;color:#ffffff;"
    ),#close sidebarPanel
    mainPanel(
      h2("the dataset"),
      br(),
      
      DT::dataTableOutput("table_1"), 
      
      
    )#close mainPanel
  )#close sidebarLayout
)#close fluidPage

server <- function(input, output) {
  data_to_display <- comics_data
  
  output$table_1 <- renderDataTable({
    (data_to_display)
  })
  
}#close server

shinyApp(ui, server)