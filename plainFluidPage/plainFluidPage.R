library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  title="We're here!",
  
  titlePanel(p("A basic fluidpage with sidebarLayout",
               style = "height:50px;
                background-color:#ff66cc;
                color:#ffffff;
                text-align:center;")
  ),#close titlePanel
  sidebarLayout(
    
    
    sidebarPanel(
      style="background-color:#6600cc;
              color:#ffffff;
              text-align:center",
      h1("Sidebar"),
      p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"),
      
      br(),
      br(),
      
      # Input: Simple integer interval ----
      sliderInput("integer", "Integer:",
                  min = 0, max = 1000,
                  value = 500),
      br(),
      br(),
      # Input: Select a file ----
      fileInput("file1", "Choose CSV File",
                multiple = FALSE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
     
       # Input: Select separator ----
      radioButtons("sep", "Separator",
                   choices = c(Comma = ",",
                               Semicolon = ";",
                               Tab = "\t"),
                   selected = ","),
      
      ),#close sidebarPanel
    
   ###****************** HERE'S MY MAINPAneL ************** 
    mainPanel(
      style="height: 400px;
              background-color:#6600cc;
              color:#ffffff;
              text-align:center",
    )#close mainPanel
  )#close sidebarLayout
)#close fluidPage
# Define server logic required to draw a histogram
server <- function(input, output) {
  
}#close function

# Run the application 
shinyApp(ui, server)
