library(plotly)
library(shiny)

mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("some plotly data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            p("some info here")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotlyOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlotly({
      plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c('#BF382A', '#0C4B8E'))%>% 
      add_markers()%>% 
      layout(scene = list(xaxis = list(title = 'Weight'),
                                         yaxis = list(title = 'Gross horsepower'),
                                         zaxis = list(title = '1/4 mile time')))

    })
}

# Run the application 
shinyApp(ui = ui, server = server)
