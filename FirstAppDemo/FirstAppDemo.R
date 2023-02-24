
#import our library
library(shiny)

# *********************** Define UI ************************
ui <- fluidPage(

    # Application title
    titlePanel("Amazon Prime delivery times in Atlantic Canada"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins of full dataset:",
                        min = 1,
                        max = 50,
                        value = 30) #sliderInput
        ), #close sidebarPanel

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        ) #close mainPanel
    ) #close sidebarLayout
) #close fluidPage

#********************  Define server ***********************
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins +1 ) #close bins

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'magenta', border = 'white',
             xlab = 'Categories of goods delivered',
             ylab = 'Days',
             main = 'Amazon Prime delivery times in Atlantic Canada (in days)') #close hist
    }) #close output
} #close server function

# Run the application 
shinyApp(ui, server)
