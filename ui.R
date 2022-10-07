library(shiny)
library(plotly)

shinyUI(pageWithSidebar(

  # Application title
  headerPanel("CO2 concentration"),

  sidebarPanel(
      selectInput("monitor", "Monitor:",
                  choices=as.list(setNames(sn, sn))),

      dateRangeInput("daterange", "Date range:",
                     start=min(co2data$Timestamp),
                     end=max(co2data$Timestamp))

  ),

  mainPanel(
      plotlyOutput("co2_plot")
  )

))
