library (shinydashboard)

logo = tags$a(href="https://thenounproject.com/icon/pony-29745/",
              tags$img(src='pony_tiny.png'),
              "Pony")

header <- dashboardHeader(title = logo, 
                          titleWidth = 100)
                          
sidebar <- dashboardSidebar()

body <- dashboardBody()

ui<- dashboardPage(header, sidebar, body)

server <- function(input, output) {}

shinyApp(ui, server)