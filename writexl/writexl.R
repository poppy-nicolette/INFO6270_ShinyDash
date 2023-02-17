#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(writexl)


ui <- fluidPage(
    downloadButton("downloadData", "Download")
  )
  
server <- function(input, output) {
    # Our dataset
    data <- mtcars
    
    output$downloadData <- downloadHandler(
      filename = function() {
        #paste("data-", Sys.Date(), ".csv", sep="")
        paste("data-", Sys.Date(), ".xlsx")
      },
      content = function(file) {
        #write.csv(data, file)
        writexl::write_xlsx(data, file)
      }
    )
  }
  
shinyApp(ui, server)

