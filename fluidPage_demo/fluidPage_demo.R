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
                    background-color:#a5d18d;
                    color:#000000;
                    text-align:left;",
           h1("more text"),
           p(" yet more text on the wonders of donuts")
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
           "width of 2 and a height of 1300px", 
           style = "height:1100px;
                    background-color:#ff3399;
                    color:#ffffff;
                    text-align:center;"
    ),
    column(h1("What's all this then?"),
            width = 8, offset = 1,
           "8 offset 1 and height 1300px", 
           style = "height:1100px;
                    background-color:#006699;
                    color:#ffffff;
                    text-align:center;",
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
                em(span("HTML", style="color:cyan")), 
                "functions."))
    )#close column
  )#close fluidRow
)

server <- function(input, output){

}

shinyApp(ui, server)
