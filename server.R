
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  values <- reactiveValues()
  observe({
    input$FindWindchill
    values$Windchill <- isolate({
      
      round((33 + (input$AirTemperature -33)*(0.474 +0.454*sqrt(input$WindVelocity)-0.0454*input$WindVelocity)),2)
      
    })
  })
  
  
  # Display your current values
  output$current_AirTemperature <- renderText({
    input$FindWindchill
    paste("Current Air temperature in ºC is:", isolate(input$AirTemperature))
  })
  
  output$current_WindVelocity <- renderText({
    input$FindWindchill
    paste("Current Wind Velocity in m/s : ", isolate(input$WindVelocity))
  })
  
  
  # Display your BMI
  
  output$Windchill_result <- renderText({
    paste("Your current BMI is:", values$Windchill)
  })
  
})