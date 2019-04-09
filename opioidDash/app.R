#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Overdose 911 Dispatches"),
  sidebarPanel(
    selectInput("city","Choose a municipality",
                choices = ods$CITY_NAME,
                selected = "WILKINSBURG")
  ),
  mainPanel(
    plotOutput("bar1")
  )
)

# Define server logic required to draw a histogram
server <- function(input, output){
  filtered_data <- reactive({
    ods %>% filter(CITY_NAME == input$city)
  })
  
  output$bar1 <- renderPlot({
    filtered_data() %>%
      ggplot(aes(x = paste(CALL_YEAR,CALL_QUARTER), y = COUNT)) +
      geom_bar(stat = 'identity')
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

