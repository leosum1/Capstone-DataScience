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
shinyUI(fluidPage(theme = "bootstrap.css",
  
  # Application title
  titlePanel("Word Prediction"),
  
  tabsetPanel(
    tabPanel(p(icon("line-chart"), "Predict"),
             hr(),
             sidebarLayout(
               sidebarPanel(
                 sliderInput("numResults",
                             "Number of results:",
                             min = 1,
                             max = 10,
                             value = 1),
                 
                 hr(),
                 textInput("text", "Type your text:", ""),
                 submitButton("Predict")
               ),
               mainPanel(
                 h4("Result(s)"),
                 h5("your input:"),
                 fluidRow(column(10, verbatimTextOutput("input"))),
                 h5("we predict the next word(s):"),
                 fluidRow(column(10, verbatimTextOutput("prediction"))),
                 plotOutput("wordcloudPlot")
               )
             )
    ),
   tabPanel(p(icon("info"), "About"),
            hr(),
            includeMarkdown("About.Rmd")
    )
  )
))