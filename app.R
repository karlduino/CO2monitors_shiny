library(shiny)

rds_file <- "data/co2data.rds"
co2data <- readRDS(rds_file)
sn <- c("all", names(sort(table(co2data$SerialNumber), decreasing=TRUE)))

runApp()
