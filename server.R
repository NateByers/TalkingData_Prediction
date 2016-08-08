
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)

load("data/predictions.rda")

shinyServer(function(input, output) {

  output$table <- renderTable({
    
    apps <- c("Games", "Education", "Finance") == input$apps

    prd <- data.frame(region = input$region, hour = input$hour, 
               phone_brand = input$phone_brand, 
               Games = as.numeric(apps[1]), 
               Education = as.numeric(apps[2]), 
               Finance = as.numeric(apps[3]))
    
    prd <- inner_join(possible_inputs, prd,
                      by = c("region", "hour", "phone_brand", "Games",
                             "Education", "Finance"))
    
    data.frame(Gender = prd[["gender"]], Age = prd[["age"]])
  })

})
