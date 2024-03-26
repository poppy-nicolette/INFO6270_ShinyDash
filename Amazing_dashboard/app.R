library(shiny)
library(ggplot2)
library(dplyr)
library(knitr)
library(kableExtra)



# cleaning ----------------------------------------------------------------



data <- mpg
tibble(
  Variable = colnames(mpg),
  Type = c("Nominal",
           "Nominal",
           "Continuous",
           "Discrete",
           "Discrete",
           "Nominal",
           "Nominal",
           "Continuous",
           "Continuous",
           "Nominal",
           "Nominal"),
  Description = c("Manufacturer name",
                  "Model name",
                  "Engine displacement, in litres",
                  "Year of manufacture",
                  "Number of cylinders",
                  "Type of transmission",
                  "Type of drive train",
                  "City miles per gallon",
                  "Highway miles per gallon",
                  "Fuel type",
                  "Type of car")
)

#####* ui ----------------------------------------------------------------------
ui <- fluidPage(
  title = "Donut you know?",
  titlePanel(title = span(
    img(src = "donutsTogether.png", height = 35), "The Hole Truth"
  )),#source: https://community.rstudio.com/t/insert-an-image-in-the-title-on-shiny/97262

    sidebarLayout(
      sidebarPanel("Choices",
                   style = "height:800px;
                  background-color:#ff66cc;
                  color:#ffffff;
                  text-align:left;",
        #options for recalculate some vallues
        radioButtons("smooth_choice", "Do you want smoothing?", c("with smoothing", "without smoothing")),
        #radio buttons for inputs
        p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Duis ut diam quam nulla porttitor massa id neque aliquam. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer. Morbi tristique senectus et netus et. Elementum tempus egestas sed sed risus. Netus et malesuada fames ac. At augue eget arcu dictum varius duis. Sed viverra tellus in hac habitasse platea dictumst. Mollis aliquam ut porttitor leo a. Orci ac auctor augue mauris augue neque gravida in. In cursus turpis massa tincidunt dui ut. Amet aliquam id diam maecenas ultricies mi eget mauris. Amet purus gravida quis blandit turpis cursus in hac habitasse. Ridiculus mus mauris vitae ultricies leo integer. Mattis enim ut tellus elementum sagittis. In nibh mauris cursus mattis molestie a iaculis at erat. Vitae suscipit tellus mauris a diam maecenas.")
      ), #close sidebarPanel
      mainPanel(
        tabsetPanel(type="tabs",
          tabPanel("Home page",
    
        fluidRow(
          column(3,
                   tableOutput("table")
                 ),#close column
          column(4,
        plotOutput("plot1")
            ),#close column
        column(4,
               plotOutput("plot2" )
               )#close column
        ),#close fluidRow
        
        fluidRow(
          column(12,
                 )#close column
        ),#cllose fluidRow
        fluidRow(
          plotOutput("scatter")
        )#close fluidRow
        ),#close tabPanel
        
        tabPanel("Second tab",
                 h2("Lorem ipsum"),
                 p(" dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Orci sagittis eu volutpat odio facilisis mauris sit. Eget egestas purus viverra accumsan in. Lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Enim ut sem viverra aliquet eget sit amet tellus cras. Ullamcorper sit amet risus nullam eget felis eget nunc lobortis. Pretium nibh ipsum consequat nisl vel pretium lectus quam. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque. Amet luctus venenatis lectus magna fringilla urna porttitor. At lectus urna duis convallis. Mattis aliquam faucibus purus in massa. Felis imperdiet proin fermentum leo vel orci porta. Urna nec tincidunt praesent semper feugiat. Aliquet bibendum enim facilisis gravida neque. Sit amet volutpat consequat mauris nunc congue nisi. Sed tempus urna et pharetra pharetra massa massa ultricies mi. Lacinia at quis risus sed vulputate odio ut enim. Iaculis nunc sed augue lacus viverra vitae congue. Tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium.")       
        )#close tabPanel
        )#close tabsetPanel
        )#close mainPanel
      
      )#close sidebarLayout
      
)#close fluidPage

# server ------------------------------------------------------------------

server <- function(input, output) {
  
  #plot sine
  #x <- seq(0,8*pi,length.out=100)
  #y <- sin(x)
  #output$plot1 <- renderPlot(
  #plot(x,y,type="l"), res=96)
  
  #output plot2
  output$plot2 <- renderPlot({
    ggplot(mpg) +
      aes(manufacturer) +
      geom_bar() +
      theme(axis.text.x = element_text(angle = 45))
    })
  
  # A basic scatterplot with color depending on Species

  output$scatter <- renderPlot({
    data <- mpg
    ggplot(data, aes(x=hwy, y=cty, color=class)) + 
    geom_point(size=6)
    })#close renderplot
  
  output$table <- function() ({
    data %>%
      group_by(manufacturer) %>% 
      summarize(freq = n()) %>% 
      kbl() %>% 
      kable_classic()
      
  })
  
}#close server function

# app ---------------------------------------------------------------------


shinyApp(ui, server)
