#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
# UI demonstrating column layouts
ui <- fluidPage(
  title = "Hello Shiny!",
  fluidRow(
    column(width = 4,
           "4"
    ),
    column(width = 3, offset = 2,
           "3 offset 2"
    )
  )
)

shinyApp(ui, server = function(input, output) { })
