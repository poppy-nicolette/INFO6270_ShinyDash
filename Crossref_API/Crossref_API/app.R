### documentation----
#
#This script creates a shiny app so that you can 
#enter a list of DOIs and return the full metadata
# Refereces----
# DataTables https://datatables.net/reference/option/

library(shiny)
library(rcrossref) #https://www.rdocumentation.org/packages/rcrossref/versions/1.2.0
library(htmltools)
library(magrittr)
library(purrr)
library(shinyjs)
library(DT)

ui <- fluidPage(
  textInput("doiInput", "DOI"),
  actionButton("submitButton", "Submit"),
  textOutput("apiOutput1"), 
  DT::dataTableOutput("apiOutput2")
)

server <- function(input, output) {
  observeEvent(input$submitButton, {
    inputDOI <- input$doiInput
    cr_result <- cr_works(dois = inputDOI) %>% 
      pluck("data")
    
    output$apiOutput2 <- DT::renderDT(cr_result)
  })
}

shinyApp(ui, server)
