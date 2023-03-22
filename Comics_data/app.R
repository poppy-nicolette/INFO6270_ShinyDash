library(shiny)
library(DT)
library(tidyverse)


path <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/comic-characters/marvel-wikia-data.csv"

# This will read the first sheet of the Excel file
comics_data <- read_csv(path)

comics_data <- select(comics_data, "name", "ID", "ALIGN", "EYE", 
                      "HAIR", "SEX", "GSM", "ALIVE", "APPEARANCES",
                      "FIRST APPEARANCE", "Year" ) %>% 
  rename(Name = name,
         Alignment=ALIGN,
         Eye = EYE, 
         Hair = HAIR,
         Gender = SEX, 
         Gender_or_sexual_identity = GSM,
         Status = ALIVE, 
         Appearances = APPEARANCES,
         First_appearance = 'FIRST APPEARANCE')

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      h2("How to use DataTables from the DT library"),
      br(),
      p("To the right is a dataset displayed as a DataTable"), 
      p("This dataset is from the fivethirtyeight GitHub repository.")
    ),#close sidebarPanel
    mainPanel(
      h2("the dataset"),
      br(),
      DT::dataTableOutput("table_1")#close dataTableOutput
      
    )#close mainPanel
  )#close sidebarLayout
)#close fluidPage

server <- function(input, output) {
  data_to_display <- comics_data
  
  output$table_1 <- renderDataTable(
    data_to_display,
    options = list(
      scrollX = TRUE, 
      scrollY = TRUE,
      autoWidth = TRUE,
      rownames = FALSE)
  ) #close renderDataTable
}#close server

shinyApp(ui, server)