library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  width="350",
  sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                    label = "Search..."),
  sidebarMenu(
    menuItem("Dashboard of stuff", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Some text", icon = icon("th"), tabName = "text",
             #badgeLabel = "new", badgeColor = "green",
             menuSubItem("Sub-item 1", tabName = "subitem1"),
             menuSubItem("Sub-item 2", tabName = "subitem2")
             )
  ),#close sidebarMenu,
  br(),
  br(),
  textInput("text", "Text input:"),
  br(),
  dateRangeInput("daterange", "Date Range:")

)#close dashboardSidebar

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Dashboard tab content"), 
            p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci. Integer feugiat scelerisque varius morbi. Tincidunt id aliquet risus feugiat in ante metus. Auctor urna nunc id cursus metus aliquam. Malesuada pellentesque elit eget gravida. Eu sem integer vitae justo eget magna. Quam quisque id diam vel quam elementum pulvinar etiam non. Fringilla ut morbi tincidunt augue interdum. Sodales neque sodales ut etiam. Viverra suspendisse potenti nullam ac tortor vitae purus. Enim sed faucibus turpis in eu mi. Diam maecenas ultricies mi eget mauris. Elementum curabitur vitae nunc sed velit dignissim sodales ut. Volutpat odio facilisis mauris sit amet massa vitae tortor condimentum. Aliquet lectus proin nibh nisl condimentum id venenatis a.")
    ),
    
    tabItem(tabName = "text",
            h2("Widgets tab content"),
            p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci. Integer feugiat scelerisque varius morbi. Tincidunt id aliquet risus feugiat in ante metus. Auctor urna nunc id cursus metus aliquam. Malesuada pellentesque elit eget gravida. Eu sem integer vitae justo eget magna. Quam quisque id diam vel quam elementum pulvinar etiam non. Fringilla ut morbi tincidunt augue interdum. Sodales neque sodales ut etiam. Viverra suspendisse potenti nullam ac tortor vitae purus. Enim sed faucibus turpis in eu mi. Diam maecenas ultricies mi eget mauris. Elementum curabitur vitae nunc sed velit dignissim sodales ut. Volutpat odio facilisis mauris sit amet massa vitae tortor condimentum. Aliquet lectus proin nibh nisl condimentum id venenatis a.")
    )#close tabItem
  )#close tabItems
)# close dashboardBody

ui <- dashboardPage(
  dashboardHeader(title = "Sidebar tabs"),
  sidebar,
  body
)

server <- function(input, output) {}

shinyApp(ui, server)
