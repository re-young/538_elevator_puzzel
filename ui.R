library(shiny)
require(markdown)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Elevator Buttons"),

  sidebarPanel(
  	# Simple integer interval
    sliderInput("numFloors", "Number of Floors:", 
                min=0, max=100, value=50),

    # Decimal interval with step value
    sliderInput("numPeople", "Number of People:", 
                min = 0, max = 100, value = 50),

    # Specification of range within an interval
    sliderInput("numSims", "Number of Simulations:",
                min = 1, max = 1000, value = 100)
  	),

  mainPanel(
  	plotOutput("distPlot"),
    includeMarkdown("exp.md")
  	)

  
))