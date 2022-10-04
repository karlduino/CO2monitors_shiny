library(shiny)
library(ggplot2)


shinyUI(pageWithSidebar(

  # Application title
  headerPanel("CO2 concentration"),

  sidebarPanel(
      selectInput("monitor", "Monitor:",
                  choices=as.list(setNames(sn, sn)))
  ),

  mainPanel(
      plotOutput("co2_plot")
  )

))
