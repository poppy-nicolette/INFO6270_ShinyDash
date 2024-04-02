### documentation----
#
#This script creates a shiny app so that you can 
#enter a list of DOIs and return the full metadata
# Refereces----
# DataTables https://datatables.net/reference/option/
#DataTAbles for R: https://rstudio.github.io/DT/
# rcrossref: https://ciakovx.github.io/rcrossref.html


library(shiny)
library(rcrossref) #https://www.rdocumentation.org/packages/rcrossref/versions/1.2.0
library(htmltools) #for http requests
library(magrittr)
library(purrr)
library(shinythemes)
library(DT) 
library(tidyr)
library(dplyr)

#set the CSS to adjust the colors
css <- HTML(" body {
    background-color: #ecf5ff;
}")


ui <- fluidPage(
  theme = shinytheme('cosmo'),
    tags$head(HTML("<title>🍩DOI fetcher</title>")),
    tags$head(tags$style(css)),
  fluidRow(
    column(3,offset = .5,
  textInput("doiInput", "DOI, just the DOI"),
  
  checkboxInput("data_references", "Just references", FALSE),
  checkboxInput("data_author", "Just authors", FALSE),
  checkboxInput("data_licenses", "Just license information", FALSE),
  
  actionButton("submitButton", "Press me!"),
  ),
  column(8, 
         h2("Crossref API Fetcherator"),
         p("This simple app fetches works information for a given DOI using the rcrossref library from Crossref.org.
           Enter a single DOI with no handle, such as the https://doi.org/ thingy. For example, 10.1007/s11192-012-0662-4"),
         br(),
         h5("Author: Poppy Riddle  Source: https://github.com/poppy-nicolette/INFO6270_ShinyDash/tree/main/Crossref_API/Crossref_API"))),
  fluidRow(
  tags$hr(style = "border-top: 1.5px solid #000000;"),

  DT::dataTableOutput("apiOutput2")
  )#close fluidRow
)

server <- function(input, output) {
  #get all data ----
   observeEvent(input$submitButton, {
     cr_result <- cr_works(dois = input$doiInput) %>% 
       pluck("data")
     output$apiOutput2 <- DT::renderDT(cr_result)
     
# just authors ----
    if(input$data_author == TRUE) {
      authors <- cr_result %>%
        dplyr::select(author, doi, issn) %>%
        tidyr::unnest(author, .drop = TRUE)
      output$apiOutput2 <- DT::renderDT(authors)
    }
  #just references ----   
     if(input$data_references == TRUE) {
       references <- cr_result %>%
         dplyr::select(reference, doi)%>%
         tidyr::unnest(reference)
       output$apiOutput2 <- DT::renderDT(server=FALSE, {
         datatable(references, extensions="Buttons",
                                         options=list(
                                           paging=TRUE, 
                                           scrollX=TRUE,
                                           dom='Bfrtip',
                                           buttons=c('copy','csv','excel','pdf')
                                         ))})
     }
     #just licenses ----
     if(input$data_licenses == TRUE) {
       licenses <- cr_result %>%
         dplyr::select(license, doi)%>%
         tidyr::unnest(license, .drop = FALSE)
       output$apiOutput2 <- DT::renderDT(server=FALSE, {
         datatable(licenses, extensions="Buttons",
                 options=list(
                   paging=TRUE, 
                   scrollX=TRUE,
                   dom='Bfrtip',
                   buttons=c('copy','csv','excel','pdf')
                 ))})
     }

   })#close observeEvent

}#close server
shinyApp(ui, server)

