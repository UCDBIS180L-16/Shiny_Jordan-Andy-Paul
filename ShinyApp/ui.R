#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Rice Across the World"),
  
  
  helpText(),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("xtrait", #the input variable that the value will go into
                   "Choose a trait to display on the x-axis:",
                   c("Seed.length",
                     "Seed.width",
                     "Seed.volume",
                     "Seed.surface.area",
                     "Protein.content")
      ),
                  
      radioButtons("ytrait",
                    "Choose a trait to display on the y-axis:",
                    c("Seed.length", "Seed.width", "Seed.volume", "Seed.surface.area", "Protein.content")
      ),
      
      radioButtons("color",
                   "Choose a trait sort by:",
                   c("Region", "Pericarp.color", "Seed.color")
      ),
    
    titlePanel("Size"),
    
    # Sidebar with sliders that demonstrate various available
    # options
    
    sliderInput("decimal", "", 
                min = 0, max = 5, value = 0.5, step= 0.1)
    ),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot"))
    
    )
  )
)


