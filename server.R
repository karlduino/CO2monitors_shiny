library(shiny)
library(googlesheets4)
library(broman)

sheet_file <-"https://docs.google.com/spreadsheets/d/1U458S6zutd1dDgCGKRRVxzDfe5JfD8_ZA-x3PFkwGUg"
col_types <- "Tccnnn"

if(!dir.exists("data")) dir.create("data")

rds_file <- "data/co2data.rds"
if(file.exists(rds_file)) {
    co2data <- readRDS(rds_file)
} else {
    co2data <- read_sheet(sheet_file, col_types=col_types)
    saveRDS(co2data, rds_file)
}

sn <- c("all", names(sort(table(co2data$SerialNumber), decreasing=TRUE)))

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

    output$co2_plot <- renderPlot({

        if(input$monitor=="all") {
            ggplot(co2data) +
                geom_line(aes(x=Timestamp, y=CO2_ppm, col=SerialNumber, group=SessionID)) +
                xlab("") + ylab("CO2 concentration (ppm)") + theme_karl()

        } else {
            ggplot(subset(co2data, SerialNumber==input$monitor)) +
                geom_line(aes(x=Timestamp, y=CO2_ppm, group=SessionID)) +
                labs(title=input$monitor) +
                xlab("") + ylab("CO2 concentration (ppm)") + theme_karl()
        }
    })

})
