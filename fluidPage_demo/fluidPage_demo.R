library(shiny)

#CSS style on W3
#color picker
# lorem ipsum

ui <- fluidPage(
  title = "Playing with fluidRows!",
  fluidRow(
    column(width = 4,
           "width of 4 and a height of 200px", 
           style = "height:200px;
                    background-color:#4d3a7d;
                    color:#ffffff;
                    text-align:center;"
    ),
    column(width = 3, offset = 2,
           "3 width with an offset 2 and a height of 100px", 
           style = "height:100px;
                    background-color:#33ccff;
                    color:#ffffff;
                    text-align:center;"
    )#close column
  ),#close fluidRow
  fluidRow(
    column(width = 3, offset = 0,
           "width of 2 and a height of 400px", 
           style = "height:400px;
                    background-color:#ff3399;
                    color:#ffffff;
                    text-align:center;"
    ),
    column(h1("What's all this then?"),
            width = 8, offset = 1,
           "8 offset 1 and height 300px", 
           style = "height:300px;
                    background-color:#006699;
                    color:#ffffff;
                    text-align:center;",
           p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit. Facilisis mauris sit amet massa vitae tortor condimentum. Ornare suspendisse sed nisi lacus. Velit aliquet sagittis id consectetur purus. Ut pharetra sit amet aliquam. Tincidunt id aliquet risus feugiat in ante metus dictum. Id semper risus in hendrerit gravida rutrum. Sapien pellentesque habitant morbi tristique senectus et netus et malesuada. Sed libero enim sed faucibus. Nisl pretium fusce id velit ut. Id consectetur purus ut faucibus pulvinar. Enim diam vulputate ut pharetra. Ut ornare lectus sit amet est placerat in egestas erat. Nullam eget felis eget nunc.")
    )#close column
  )#close fluidRow
)

server <- function(input, output){

}

shinyApp(ui, server)
