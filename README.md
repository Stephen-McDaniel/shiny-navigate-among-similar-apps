# shiny-navigate-among-similar-apps
Using Shiny with shinyjs, we can capture clicks/selections via inputs to redirect to another app.

2016-12-15 in response to Google Groups thread by Sylvain on 2016-12-14 at https://groups.google.com/forum/#!topic/shiny-discuss/YODirLvqH4c

Program: app1/app.R (duplicated with minor changes to 
                     app2/app.r and app3/app.r)

Response from Stephen McDaniel at PowerTrip Analytics
Using various package examples as a basis, built simple prototype 
of an app that demonstrates how to clear all inputs/outputs in
related apps without app refactoring, etc.

In simplest case, you would place your apps in adjacent directories
/app1/app.R 
/app2/app.R
/app3/app.R

License: MIT License 

Attribution, package authors for shiny and shinyjs packages on CRAN
