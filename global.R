# load data

rds_file <- "data/co2data.rds"
co2data <- readRDS(rds_file)

# drop-down options: "all" + observed devices
sn <- c("all", names(sort(table(co2data$SerialNumber), decreasing=TRUE)))
