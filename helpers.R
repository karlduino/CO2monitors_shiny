library(googlesheets4)
sheet_files <- c(
    "https://docs.google.com/spreadsheets/d/1iCzjd1VGPIKMcijLCCyBCRpYuntBZD8bb86diQd63Rw",
    "https://docs.google.com/spreadsheets/d/1U458S6zutd1dDgCGKRRVxzDfe5JfD8_ZA-x3PFkwGUg"
  )
col_types <- "Tccnnn"

if(!dir.exists("data")) dir.create("data")

rds_files <- paste0("data/co2data", seq_along(sheet_files), ".rds")
dat <- vector("list", length(sheet_files))
for(i in seq_along(sheet_files)) {
    cat("reading file ", i, "\n")
    if(file.exists(rds_files[i])) {
        dat[[i]] <- readRDS(rds_files[i])
    } else {
        dat[[i]] <- read_sheet(sheet_files[i], col_types=col_types)
        saveRDS(dat[[i]], rds_files[i])
    }
}

co2data <- do.call("rbind", dat)

# trim off garbage (ULC11 with values > 1000)
co2data <- subset(co2data, SessionID != "543625635471476" |
                  Timestamp > lubridate::ymd_hms("2022-10-06 12:16:59"))

saveRDS(co2data, "co2data.rds")
