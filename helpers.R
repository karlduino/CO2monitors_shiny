library(googlesheets4)
sheet_files <- c(
    "https://docs.google.com/spreadsheets/d/1iCzjd1VGPIKMcijLCCyBCRpYuntBZD8bb86diQd63Rw",
    "https://docs.google.com/spreadsheets/d/1Vdb8D2_6ISUh7UZe0QLqYrO26AiNasoTIYNMWBvEebA",
    "https://docs.google.com/spreadsheets/d/1gMocvOY3MA83lewVMDJAW5JymRO7CGMUinlWURRiDDQ",
    "https://docs.google.com/spreadsheets/d/1zONs9wG8Q8zOpRDzHyBKmaRPsxTAiNnJA7IZPLcEXzA",
    "https://docs.google.com/spreadsheets/d/1l1xLyvTe8l4g4Qk-yVMMqdecEDtNoF52lXNnyu4BaBk",
    "https://docs.google.com/spreadsheets/d/1e7lq-AVRgiyo54M-PnX3jzL8vO7S0OK5PfGa_TmGqUc",
    "https://docs.google.com/spreadsheets/d/16SP_bPLM6C06-b5rm3wsn-Z0cR_WoMf1J31ZRU0TTqc",
    "https://docs.google.com/spreadsheets/d/11Lyckhy1EeU4o2u53sMn5MkiUWhfInrT4zuuVccULG0",
    "https://docs.google.com/spreadsheets/d/1Za6rd9mNkl4LVIl8lno2GTIeZ65DhxHtZiakis4qW-I",
    "https://docs.google.com/spreadsheets/d/1jrS-bJMffITdhlcU_t5W3tiI0b7mlmPR3fL7w1JPhvU",
    "https://docs.google.com/spreadsheets/d/1jO6SxB_LpMS5_ksRH6mwLpANPer-_gBkiUGoUZZAHvw",
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

# remove last two columns
co2data <- co2data[ , !(colnames(co2data) %in% c("max_CO2", "ave_CO2"))]

# remove 0 CO2_ppm
co2data <- co2data[co2data$CO2_ppm > 0,]

saveRDS(co2data, "data/co2data.rds")
