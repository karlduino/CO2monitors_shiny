library(shiny)
library(plotly)

shinyUI(pageWithSidebar(

  # Application title
  headerPanel("CO2 concentration"),

  sidebarPanel(
      selectInput("monitor", "Monitor:",
                  choices=as.list(setNames(sn, sn)))
  ),

  mainPanel(
      plotlyOutput("co2_plot")
  )

))
