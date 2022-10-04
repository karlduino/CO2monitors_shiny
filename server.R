library(shiny)
library(ggplot2)
library(broman)
library(plotly)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

    output$co2_plot <- renderPlotly({

        if(input$monitor=="all") {
            p <- ggplot(co2data) +
                geom_line(aes(x=Timestamp, y=CO2_ppm, col=SerialNumber, group=SessionID)) +
                xlab("") + ylab("CO2 concentration (ppm)") + theme_karl()

        } else {
            p <- ggplot(subset(co2data, SerialNumber==input$monitor)) +
                geom_line(aes(x=Timestamp, y=CO2_ppm, group=SessionID)) +
                labs(title=input$monitor) +
                xlab("") + ylab("CO2 concentration (ppm)") + theme_karl()
        }

        ggplotly(p)
    })

})
