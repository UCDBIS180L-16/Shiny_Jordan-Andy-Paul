#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)

#RiceData<-read.csv("/home/handy/Bioinformatics_Lab_BIS180L/Shiny_Jordan-Andy-Paul/RiceSNPData/RiceDiversity.44K.MSU6.Phenotypes.csv",header=T)
#RiceData<-read.csv("~/MEGAsync/Assignment_4_Zaman.Paul/RiceSNPData/RiceDiversity.44K.MSU6.Phenotypes.csv",header=T)

Rice.melt<-melt(RiceData,id.vars="Region")

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  sliderValues<- reactive({
    data.frame(
      Name = c("Size"),
      Value= as.character(c(input$size)),
      stringsAsFactors = FALSE
    )
  })
  output$Values<-renderTable({
    sliderValues()
  })
  Rice.melt.ss<-subset(RiceData,variable=input$trait)
  output$boxPlot <- renderPlot({
    
    # set up the plot
    pl <- ggplot(data = Rice.melt.ss,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x=input$xtrait,
                            y=input$ytrait,
                            color=input$color                 )
    )
    # draw the boxplot for the specified trait
    pl + geom_point(size=input$decimal) + geom_smooth(method=lm,se=FALSE)
  })
})

