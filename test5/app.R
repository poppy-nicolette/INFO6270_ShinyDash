#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shinythemes)
library(shiny)

ui = fluidPage(
  shinythemes::themeSelector()
)#close fluidPage

server = function(input, output) {}

shinyApp(ui, server)



