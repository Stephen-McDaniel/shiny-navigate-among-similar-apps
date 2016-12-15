# 2016-12-15 in response to Google Groups thread by Sylvain on 2016-12-14
#
# Program: app1/app.R (duplicated with minor changes to 
#                      app2/app.r and app3/app.r)
#
# Response from Stephen McDaniel at PowerTrip Analytics
# Using various package examples as a basis, built simple prototype 
# of an app that demonstrates how to clear all inputs/outputs in
# related apps without app refactoring, etc.
#
# In simplest case, you would place your apps in adjacent directories
# /app1/app.R 
# /app2/app.R
# /app3/app.R
#
# License: MIT License
# Attribution, package authors for shiny and shinyjs packages on CRAN

library(shiny)
library(shinyjs)

shinyApp(
   ui = 
      fluidPage(
          useShinyjs(),
          titlePanel("App 1 - Picker Using JavaScript to Redirect to Another App"),
          # Sidebar with a slider input
          sidebarPanel(
            selectizeInput("tabs1", 
                           "App Picker - Will Trigger JavaScript Redirect", 
                           c("Plot 1", "Plot 2", "Plot 3"), 
                           selected = "Plot 1"
            ),
            sliderInput("obs",
                        "Number of observations:",
                        min = 0,
                        max = 1000,
                        value = 500)
          ),
          # Show a plot of the generated distribution
          mainPanel(
            HTML(
               "Using Shiny with shinyjs, we can capture clicks/selections via inputs to redirect to another app.
               <br>This was in response to <b>Sylvain</b> on Shiny Google Groups on 2016-12-14
               <br>&nbsp;&nbsp;&nbsp;&nbsp;<i>Is it possible to clear input and output objects inside a session?</i>"),
            plotOutput("distPlot")
          )
     )
   ,
   server = function(input, output, session) {
     
     observe({# Javascript redirection based on selected plot
        if(interactive()) { # don't redirect when run locally
           info("Sorry, you need this on a Shiny Server for an effective demonstration")
        } else if(input$tabs1 == "Plot 2") {
           runjs('window.location = "../app2";') # redirect JS
        } else if(input$tabs1 == "Plot 3") {
           runjs('window.location = "../app3";') # redirect JS
        }
     })
   
     output$distPlot <- renderPlot({
        hist(rnorm(input$obs), col = 'darkgray', border = 'white')
     })
   }
)