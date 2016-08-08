
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Demographic Prediction"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("region", "Region", 
                  choices = c("Beijing", "Chengdu", "Hong Kong", "Rural", 
                              "Shanghai")),
      sliderInput("hour", "Hour", min = 0, max = 23, value = 12),
      radioButtons("phone_brand", "Phone Brand", 
                   choices = c("vivo", "OPPO")),
      checkboxGroupInput("apps", "Categories of active apps",
                         c("Games", "Education", "Finance"),
                         selected = "Games")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tableOutput("table")
    )
  )
))
