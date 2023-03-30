#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI
ui <- fluidPage(
  # Sidebar Layout
  sidebarLayout(
    # Sidebar Layout Elements
    sidebarPanel = sidebarPanel(
      p("This is the sidebar area. You can have text and widgets here like buttons or sliders."),
      style = "height:600px;
                background-color:#4d3a7d;
                color:#ffffff;
                text-align:center;"
      ),#close sidebarPanel
    mainPanel = mainPanel(style = "height:600px;
                                    background-color:#33ccff;
                                    color:#ffffff;
                                    text-align:center;",
      p("This is the main panel text."),
    ) #close mainPanel
  )#close sidebarLayout
  )#close fluidPage
# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
