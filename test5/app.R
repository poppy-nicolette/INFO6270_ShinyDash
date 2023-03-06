library(shiny)

ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(),
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
           "functions."))
    )
  )
)
server <- function(input, output) {
  
}

shinyApp(ui, server)