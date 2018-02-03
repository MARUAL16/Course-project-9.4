
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Windchill calculator"),
  
  sidebarLayout(
    sidebarPanel( 
      
      helpText(" This application helps you to calculate the windchill. For that purpose, it´s use the Siple's equation"),
      
      br(),           
      numericInput("AirTemperature",label = h4("Air temperature (ºC)"),min = -20, max = 45,value= 8),
      br(),
      numericInput("WindVelocity",label = h4("Wind velocity (m/s)"),min = 0, max = 40, value=20),
      br(),
      
      br(),   
      actionButton("FindWindchill", label = "The windchill is")    
      
      
    ),
    mainPanel
    (
    tabsetPanel
    (
    tabPanel("Estimation of windchill",
             p(h4("Here are the current air temperature and wind velocity:")),
             textOutput("current_AirTemperature"),
             textOutput("current_WindVelocity"),
             br(),
             p(h4("The Windchill is displayed below:")),
             textOutput("Windchill_result")
             
    ),
    tabPanel(
      "Documentation",
      p(h4("Windchill Application")),
      br(),
      helpText("This simple application calculates the current windchill")
      
    )
    )
    )
  )))