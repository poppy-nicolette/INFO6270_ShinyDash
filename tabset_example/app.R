

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Tabset panel"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
      p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A diam sollicitudin tempor id. Maecenas sed enim ut sem viverra aliquet eget sit amet. Morbi tincidunt ornare massa eget. Maecenas sed enim ut sem. Parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Mattis pellentesque id nibh tortor id aliquet lectus proin. Rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui. Ut ornare lectus sit amet est. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Id consectetur purus ut faucibus pulvinar elementum integer enim neque. Et malesuada fames ac turpis egestas maecenas. Amet volutpat consequat mauris nunc congue nisi. Sagittis vitae et leo duis. Scelerisque felis imperdiet proin fermentum leo vel orci porta. Tellus molestie nunc non blandit massa enim. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Nisl nunc mi ipsum faucibus vitae. Quis blandit turpis cursus in hac habitasse platea. A iaculis at erat pellentesque adipiscing.")
        ),#close sidebarPanel

        # Show a plot of the generated distribution
        mainPanel(
          # Output: Tabset w/ plot, summary, and table ----
          tabsetPanel(type = "tabs",
                      tabPanel("Some Data", p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A diam sollicitudin tempor id. Maecenas sed enim ut sem viverra aliquet eget sit amet. Morbi tincidunt ornare massa eget. Maecenas sed enim ut sem. Parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Mattis pellentesque id nibh tortor id aliquet lectus proin. Rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui. Ut ornare lectus sit amet est. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Id consectetur purus ut faucibus pulvinar elementum integer enim neque. Et malesuada fames ac turpis egestas maecenas. Amet volutpat consequat mauris nunc congue nisi. Sagittis vitae et leo duis. Scelerisque felis imperdiet proin fermentum leo vel orci porta. Tellus molestie nunc non blandit massa enim. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Nisl nunc mi ipsum faucibus vitae. Quis blandit turpis cursus in hac habitasse platea. A iaculis at erat pellentesque adipiscing.")),
                      tabPanel("A summary", p("Orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Augue mauris augue neque gravida. Eget est lorem ipsum dolor sit amet consectetur adipiscing. Sollicitudin tempor id eu nisl nunc mi. Quam elementum pulvinar etiam non. Erat nam at lectus urna duis convallis convallis. Sit amet justo donec enim diam vulputate. Ac feugiat sed lectus vestibulum. Id semper risus in hendrerit gravida rutrum quisque non. Id velit ut tortor pretium viverra suspendisse. Massa sapien faucibus et molestie ac feugiat. Nibh praesent tristique magna sit amet purus gravida. Elementum nisi quis eleifend quam. Lacinia quis vel eros donec ac odio. Commodo ullamcorper a lacus vestibulum.")),
                      tabPanel("A table", p("Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Pharetra convallis posuere morbi leo urna. Integer malesuada nunc vel risus. Morbi tempus iaculis urna id volutpat lacus laoreet non curabitur. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Congue nisi vitae suscipit tellus mauris. Amet aliquam id diam maecenas ultricies mi eget mauris pharetra. Nec nam aliquam sem et tortor. Nunc sed blandit libero volutpat sed. Risus nullam eget felis eget. Habitant morbi tristique senectus et. Enim neque volutpat ac tincidunt vitae semper quis."))
          )
        )#close mainPanel
    )#close sidebar Layout
)#close fluidPage

# Define server logic required to draw a histogram
server <- function(input, output) {
  
}
# Run the application 
shinyApp(ui = ui, server = server)
