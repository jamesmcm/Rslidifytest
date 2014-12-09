library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  fit <- lm(mpg~wt, mtcars)
  
  output$distPlot <- renderPlot({

    # draw the histogram with the specified number of bins
    ggplot(mtcars, aes(x=wt, y=mpg)) +
      geom_point(shape=1) +    # Use hollow circles
       geom_smooth(method=lm) + geom_vline(xintercept = input$weight) +
     geom_hline(yintercept=predict(fit,data.frame(wt=input$weight))[[1]]) +
      ggtitle("Fit of MPG vs. Weight for mtcars data") +
     xlab("Weight (1000 lbs)") +
    ylab("Miles per US Gallon")})
  
  output$text1 <- renderText({paste("Your input: ", input$weight*1000, " lbs") })
  
output$text2 <- renderText({paste("Predicted MPG: ", 
                                  round(predict(fit,data.frame(wt=input$weight))[[1]],1), "miles per US gallon")})
})