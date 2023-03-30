

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  h1("a plain fluidPage", 
     style="text-align:center;"),
  h2(" a story steeped in tragedy", 
     style="text-align:center;"),
  br(),
  p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac felis donec et odio pellentesque diam volutpat commodo. Amet consectetur adipiscing elit ut aliquam purus. Risus quis varius quam quisque id diam vel quam elementum. Sodales ut etiam sit amet nisl purus. Et netus et malesuada fames ac. Id venenatis a condimentum vitae sapien pellentesque. Vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Lectus nulla at volutpat diam ut. Maecenas ultricies mi eget mauris pharetra et ultrices neque. Ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum. Pretium fusce id velit ut tortor pretium viverra. Amet aliquam id diam maecenas ultricies mi eget mauris.")

)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
