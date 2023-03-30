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
    
    
    mainPanel(
      h1(" h1() creates a level 1 header."),
      h2(" h2() creates a level 2 header, and so on..."),
      p("Use p() to create a new paragraph. "),
      p("You can apply style to a paragraph using style", style = "font-family: 'times'; font-si16pt"),
      strong("Using strong() bolds text."),
      em("Italics can be applied with em(). "),
      br(),
      p("Use br() to apply a line break."),
      br(),
      code("You can create a code box with code()."),
      div("div creates a container that can apply styles within it using 'style = color:magenta'", style = "color:blue"),
      br(),
      p("span is similar to div but can affect smaller sections",
        span("such as words or phrases", style = "color:purple"),
        "within a paragraph or body of text."),
      h3(p("You can also combine ", 
           em(span("HTML", style="color:magenta")), 
           "functions.")),
      # Input: Select separator ----
      radioButtons("sep", "Separator",
                   choices = c(Comma = ",",
                               Semicolon = ";",
                               Tab = "\t"),
                   selected = ","),
    )#close mainPanel
  )#close sidebarLayout
)#close fluidPage
# Define server logic required to draw a histogram
server <- function(input, output) {

}#close function

# Run the application 
shinyApp(ui, server)
