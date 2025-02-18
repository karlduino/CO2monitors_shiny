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
    "https://docs.google.com/spreadsheets/d/1Fw-3XOx-S-uS1_BOFiOIhUWLIFna67b_47y1Uti8Y9I",
    "https://docs.google.com/spreadsheets/d/1HD9Qmo66elwnv4PYNXQLDXeOlhdP8GGfjMGr4GsrubU",
    "https://docs.google.com/spreadsheets/d/1lZEuGFMJFrfi8q61So96x6tv1mbcWnEG2769ow1ZgqY",
    "https://docs.google.com/spreadsheets/d/1UQKRBZdX7gV8dT68Xv3eZicvB9aZ2RP3zrWksY8zbzg",
    "https://docs.google.com/spreadsheets/d/1aN0Z4Vqka-JucJf5OrvNibNUk1Z59IMunllNhUqrBIc",
    "https://docs.google.com/spreadsheets/d/1Xvi5xRPKuGg3hLY4PVPAaMOm5MpTYU2LdwsYknroeHE",
    "https://docs.google.com/spreadsheets/d/1afAang4zj7f6E1upwX_r43EA1bB5f-eQjwh79telfmk",
    "https://docs.google.com/spreadsheets/d/1B9OJcQtCzOe6_ZXCiv8_NS6stFwJLnB_RXi4Xz1NJJc",
    "https://docs.google.com/spreadsheets/d/1tmw1rfvXwLiPHELCMds9gd21eFW5b2DueOKmGWoJyD4",
    "https://docs.google.com/spreadsheets/d/1AemmJbPUnzIHKf2H4C3O9PFFq5AjUCgCfJN8WlPNbGY",
    "https://docs.google.com/spreadsheets/d/1KP-7im-dNSSOb1bo97MFxtfAWVOVrgbMWJ3Ki24yOic",
    "https://docs.google.com/spreadsheets/d/1rsPfR3DNTvMjZkT9G88uYyyORB56oNXXZ6rhJ_VzmCU",
    "https://docs.google.com/spreadsheets/d/1h7knlebStVsW8eMDyG6pJQmqM-GsUT4RST6yvZRF_hE",
    "https://docs.google.com/spreadsheets/d/1GWSVTekUHI9AjxzgfvwLCKq2hX3qeEsYMks0qZYmbHc",
    "https://docs.google.com/spreadsheets/d/1UPvi4nQZ3PlXI9Edp0Ee4GOjJDQWxLPIlj_5tN_-Lhg",
    "https://docs.google.com/spreadsheets/d/1d-N8GSpDbdl6Rj1Q4v1YJHhdao6TEGjNgrYiGE7gqCk",
    "https://docs.google.com/spreadsheets/d/1-xlXJKWsHA_rHnx6YbfnOSlTqEec5GWUvo-tNCemFaE",
    "https://docs.google.com/spreadsheets/d/15dOAu7eLRZJ8OIMscMJujnvTRPUJXj8VS57RFUNSmdU",
    "https://docs.google.com/spreadsheets/d/1WWFZLheDhmpa5HNBv1dvUiqmnpTQHiRoMbwgCAqbMyE",
    "https://docs.google.com/spreadsheets/d/1Ro4cUO0Gi-rt__tEPh5mW7wXDI6YfM0kxdUeQziZIu8",
    "https://docs.google.com/spreadsheets/d/1X1lQAMCtNlcmVLt4Ay10WBosgswSaij76-Sw2SgxoWI",
    "https://docs.google.com/spreadsheets/d/1w1g9r-gXXYV6Q-CPxLBQ6l4j4pUe3d66JSOjyQBnIu8",
    "https://docs.google.com/spreadsheets/d/13KLg0zu3DohoR-sXluTdjfESaeFhijFBTDwQsKf32Xs",
    "https://docs.google.com/spreadsheets/d/15pcTDK1aV7I3PDsjkIfHfCqukNq4iug2ntByFLG9vRM",
    "https://docs.google.com/spreadsheets/d/1TzAPBXyAD1VUcZskaPNbY_Gx3x3CIwLkq4fQQQtiRlQ",
    "https://docs.google.com/spreadsheets/d/1jj-KPdnaqLtg7OuLZopqqjkTWBgAu3x01BzcAFsw0Jc",
    "https://docs.google.com/spreadsheets/d/1UhcmhlCbNO-5nkkmXsg9pijP_f-RYeYijHycwyrAoAA",
    "https://docs.google.com/spreadsheets/d/1breVedGAwdb744riqB4VYyxFD3PBnyrNcNsGgAqs8Xo"
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
# trim off data for ULC99 (test runs)
co2data <- subset(co2data, SerialNumber != "ULC99")

# remove last two columns
co2data <- co2data[ , !(colnames(co2data) %in% c("max_CO2", "ave_CO2"))]

# remove 0 CO2_ppm
co2data <- co2data[co2data$CO2_ppm > 0,]

saveRDS(co2data, "data/co2data.rds")
