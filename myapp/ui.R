library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("mtCars MPG vs Weight predictor"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("weight",
                  "Weight (1000 lbs):",
                  min = 1,
                  max = 6,
                  value = 3,
                  step=0.1,
                  animate=T),
      "Move the slider to change the inputted weight, and view the predicted MPG for that weight"
      
    ), 

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      textOutput("text1"),
      textOutput("text2")
      
    )
  )
))