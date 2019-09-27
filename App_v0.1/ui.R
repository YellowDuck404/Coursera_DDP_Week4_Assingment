#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Health Check - version 0.1"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textOutput("txt"),
       selectInput(
         "selectID", "Enter your details in ...",
         c("Imperial" = "imperial", "Metric" = "metric")),

       h5("Your height in..."),
       # Only show this panel if "imperial"
       conditionalPanel(
         condition = "input.selectID == 'imperial'",
         numericInput("feet", "feet", label = "ft.", min = 0, value = 5),
         numericInput("inches", "inches", label = "in.", min = 0, max = 12, value = 2)
       ),
       # Only show this panel if "metric"
       conditionalPanel(
         condition = "input.selectID == 'metric'",
           numericInput("m", "m", label = "m", min = 0, value = 1.60)
       ),
       
       h5("Your weight in..."),
       # Only show this panel if "imperial"
       conditionalPanel(
         condition = "input.selectID == 'imperial'",
         numericInput("lbs", "lbs", label = "lbs.", min = 0, value = 130)
       ),
       # Only show this panel if "metric"
       conditionalPanel(
         condition = "input.selectID == 'metric'",
         numericInput("kg", "kg", label = "kg", min = 0, value = 60)
       ),
       actionButton("calculate", "Calculate")
    ),
    
    # Show a result
    mainPanel(
       h3("This application calculates BMI - Body Mass Index"),
       h3(),
       h4("To find out what Your BMI is:"),
       h4("1. Fill your details in imperial or metric system"),
       h4("2. Click Calculate button"),
       h4(),
       h4("Your BMI is..."),
       verbatimTextOutput("value")
    )
  )
))
