library(plotly)
library(shiny)

mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("mtcars data using plotly"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget mauris pharetra et ultrices neque. Condimentum id venenatis a condimentum vitae sapien pellentesque. Ut diam quam nulla porttitor massa id neque. Sed adipiscing diam donec adipiscing tristique risus nec. Ligula ullamcorper malesuada proin libero nunc consequat interdum. At auctor urna nunc id cursus. Eu ultrices vitae auctor eu augue ut. Tristique nulla aliquet enim tortor at auctor urna nunc id. Vitae purus faucibus ornare suspendisse sed. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Non enim praesent elementum facilisis. Egestas quis ipsum suspendisse ultrices gravida. Tortor at auctor urna nunc id cursus. Risus nullam eget felis eget nunc. Laoreet suspendisse interdum consectetur libero id faucibus.")
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
