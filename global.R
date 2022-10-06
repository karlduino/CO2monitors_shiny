# load data

rds_file <- "data/co2data.rds"
co2data <- readRDS(rds_file)

# snip off session of <= 5 min
tab <- table(co2data$SessionID)
co2data <- subset(co2data, SessionID %in% names(tab)[tab > 5])

# drop-down options: "all" + observed devices
sn <- c("all", names(sort(table(co2data$SerialNumber), decreasing=TRUE)))
