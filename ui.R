library(shiny)
library(plotly)

shinyUI(pageWithSidebar(

  # Application title
  headerPanel("CO2 concentration"),

  sidebarPanel(
      selectInput("monitor", "Monitor:",
                  choices=as.list(setNames(sn, sn))),

      dateRangeInput("daterange", "Date range:",
                     start=max(co2data$Timestamp)-7*3600*24, # latest - 7 days
                     end=max(co2data$Timestamp),
                     min=min(co2data$Timestamp),
                     max=max(co2data$Timestamp))

  ),

  mainPanel(
      plotlyOutput("co2_plot")
  )

))
