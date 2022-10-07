library(shiny)
library(ggplot2)
library(broman)
library(plotly)
library(lubridate)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

    output$co2_plot <- renderPlotly({

        start <- lubridate::ymd_hms(paste(input$daterange[1], "0:00:00"))
        end <- lubridate::ymd_hms(paste(input$daterange[2], "23:59:59"))

        co2data_sub <- subset(co2data, Timestamp >=start & Timestamp <= end)

        if(input$monitor != "all" && input$monitor %in% co2data_sub$SerialNumber) {
            co2data_sub <- subset(co2data_sub, SerialNumber==input$monitor)

            p <- ggplot(co2data_sub) +
                geom_line(aes(x=Timestamp, y=CO2_ppm, group=SessionID)) +
                labs(title=input$monitor) +
                xlab("") + ylab("CO2 concentration (ppm)") + theme_karl()
        } else {
            p <- ggplot(co2data_sub) +
                geom_line(aes(x=Timestamp, y=CO2_ppm, col=SerialNumber, group=SessionID)) +
                xlab("") + ylab("CO2 concentration (ppm)") + theme_karl()
        }

        ggplotly(p)
    })

})
