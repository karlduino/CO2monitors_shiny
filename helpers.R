library(googlesheets4)
sheet_file <-"https://docs.google.com/spreadsheets/d/1U458S6zutd1dDgCGKRRVxzDfe5JfD8_ZA-x3PFkwGUg"
col_types <- "Tccnnn"

if(!dir.exists("data")) dir.create("data")

rds_file <- "data/co2data.rds"
if(file.exists(rds_file)) {
    co2data <- readRDS(rds_file)
} else {
    co2data <- read_sheet(sheet_file, col_types=col_types)

    # trim off garbage (ULC11 with values > 1000)
    co2data <- subset(co2data, SessionID != "543625635471476" |
                               Timestamp > lubridate::ymd_hms("2022-10-06 12:16:59"))

    saveRDS(co2data, rds_file)
}
