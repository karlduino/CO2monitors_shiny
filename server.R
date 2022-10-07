library(shiny)
library(ggplot2)
library(broman)
library(plotly)
library(lubridate)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

    output$co2_plot <- renderPlotly({

        # start and end of range
        start <- lubridate::ymd_hms(paste(input$daterange[1], "0:00:00"))
        end <- lubridate::ymd_hms(paste(input$daterange[2], "23:59:59"))

        co2data_sub <- subset(co2data, Timestamp >=start & Timestamp <= end)
        if(nrow(co2data_sub)==0) co2data_sub <- co2data # don't throw it all out

        if(input$monitor != "all" && input$monitor %in% co2data_sub$SerialNumber) {
            co2data_sub <- subset(co2data_sub, SerialNumber==input$monitor)
        }

        first_date <- date(min(co2data_sub$Timestamp))
        last_date <- date(max(co2data_sub$Timestamp))
        if(first_date == last_date) {
            title <- first_date
        } else {
            title <- paste(first_date, "-", last_date)
        }

        if(length(unique(co2data_sub$SerialNumber))==1) {
            p <- ggplot(co2data_sub) +
                geom_line(aes(x=Timestamp, y=CO2_ppm, group=SessionID)) +
                labs(title=paste0(title, ", ", input$monitor)) +
                xlab("") + ylab("CO2 concentration (ppm)") + theme_karl()
        } else {
            p <- ggplot(co2data_sub) +
                geom_line(aes(x=Timestamp, y=CO2_ppm, col=SerialNumber, group=SessionID)) +
                labs(title=title) +
                xlab("") + ylab("CO2 concentration (ppm)") + theme_karl()
        }

        ggplotly(p)
    })

})
