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
    "https://docs.google.com/spreadsheets/d/1IxFykQJCsKB23SqijqcysX0aKcgH2Gu7ZwShzs1ob34",
    "https://docs.google.com/spreadsheets/d/1mbys46fO_qDypyq5xYsVmolt8QhcFOKXWK96MXBP91o",
    "https://docs.google.com/spreadsheets/d/1YCAvX84fkE7OI_kLgphGy0vgkjjhEzuc2QButea_Hls",
    "https://docs.google.com/spreadsheets/d/1VnCLP-BhEXFeHIzJYRZxadwzCCeRsEUTWZRRq6RlfYM",
    "https://docs.google.com/spreadsheets/d/1-5l_H0RCqPStKny4QwGzE5j2pc5-db2dvLViUs8SDQE",
    "https://docs.google.com/spreadsheets/d/1SsLKk6JiGpFaqX3CvyK1b0lCkE6G3d1ARy_9J8ic1s4",
    "https://docs.google.com/spreadsheets/d/1eZkmO3iEZpnaYrZ7_9_TWc340lHekSpg3FgTIRIYwlY",
    "https://docs.google.com/spreadsheets/d/1a1RfGdYZEJXSINNYP9b7FbMk_T0MyYP1Mxm_N2L696k",
    "https://docs.google.com/spreadsheets/d/1BFruDqfbXTClyfCW5PMlirrANgWnEqhF5ZQ4FHdIBLw",
    "https://docs.google.com/spreadsheets/d/1Buzz9W6pU-HDMQ-IfEMGn-kwzMeYfCwBpxQiCQGNvak",
    "https://docs.google.com/spreadsheets/d/1wzrQujot4PwX43whF1o1mE-8mNMit4VKlzGYs6yKO6E",
    "https://docs.google.com/spreadsheets/d/1wDQzegC4gWm3h0PZ_4F658T530AxxiIcbLsdhITJnUA",
    "https://docs.google.com/spreadsheets/d/1k6eL8sv1p1ztr7ChnH_e2wMod4PJtkbxtRjf2ChfAAs",
    "https://docs.google.com/spreadsheets/d/1XGppfkjYxOZvdIkw1_ssQUgTWP5cQgr25XGfd5ZFTxw",
    "https://docs.google.com/spreadsheets/d/1LMr6GPGCQ8D-nPD6UOZIsl8N2TshE50fRwr7DgEuwiM",
    "https://docs.google.com/spreadsheets/d/17WzRM2y2eqHugaNFN5K5mFwnmnzkizUNuK4uHEulOhQ",
    "https://docs.google.com/spreadsheets/d/1fsUmMBdpzHZrOzPeNA--f11Sbq1fxL2EdvjAKdqFScE",
    "https://docs.google.com/spreadsheets/d/1drjWnKqcpNqqspg-mbLzRKPoDaYwc37vZmZaDGRu1Fg",
    "https://docs.google.com/spreadsheets/d/18Ee-BU1Jb2W9kKXpPI7VsdQblWvaEX-Xe_eCgAgOuD8",
    "https://docs.google.com/spreadsheets/d/1oQUKt7l2SdxkD1tIe2toZLZfPBHiuAaGQGeFhcfO1eE",
    "https://docs.google.com/spreadsheets/d/1FTNcMXe67FncJnSlkuW3V0IiELXtUn6C0FvMHOo-ASc",
    "https://docs.google.com/spreadsheets/d/1Q_vjePzsv0Eb1fKiPB7LKu3-My4wzFoAeU-vfeyPzJg",
    "https://docs.google.com/spreadsheets/d/1jERrm7sFP6eWqD9a_EOIHhQbo1GcS0OP-Bq_HMytz-A",
    "https://docs.google.com/spreadsheets/d/1yygiVHSwfzk2mlOmLyEiCkndje7oL3M8B9YnlTWnp30",
    "https://docs.google.com/spreadsheets/d/1J6KNg9EojlCZ9Wl0WEXLJDLeOGsQcoW-dE6Yhr8XhaY",
    "https://docs.google.com/spreadsheets/d/1FC7vLgrMp21GQKEu3XoMcfJccNcvVXVBdbUQhhP1gnM",
    "https://docs.google.com/spreadsheets/d/1BPHBprk7SSp9zGs2mF0nvUqYBRZxzjcIu1RAPOMqzig",
    "https://docs.google.com/spreadsheets/d/1vwV_7XmprwLZ4aoGfxa-qoaJ49k-J7p1cwP1dr3DWno",
    "https://docs.google.com/spreadsheets/d/1OM9B17noZHf0GyDAHH5e_bQ-V0Jp98VJV_H4z5oTk-k",
    "https://docs.google.com/spreadsheets/d/1BGAnm7tsaEWxJKFr1F_66D9uldOj37b783ncJFEXqnw",
    "https://docs.google.com/spreadsheets/d/1YC2TMG6kNpIeq05aZrYaG0GX7KflvEpupmLLAzo0CgQ",
    "https://docs.google.com/spreadsheets/d/1eH1lopSGaoBwC14N-g0gqjOUe7WPFlUFU654KAdcwBQ",
    "https://docs.google.com/spreadsheets/d/1c1TGqC1vBApqSAjZry460TssmL3__NmA5-HEuseH4hs",
    "https://docs.google.com/spreadsheets/d/1YaEpsFmaSI_C3W1WJzg45Pm2v94tcAqgi5UQzdBYDRQ",
    "https://docs.google.com/spreadsheets/d/1EOajPa7uFbtKjUlCOQjE6YFlW8tBF46_1--2iq7FfgI",
    "https://docs.google.com/spreadsheets/d/1qq_Yv7GTnupLTKmHzikNgp25rZHQJPaqpcYjy9Ewv5c",
    "https://docs.google.com/spreadsheets/d/1MBJGd7OeVGxaqL5PP9SGgMflaicocz_x5MRfXDWkVlo",
    "https://docs.google.com/spreadsheets/d/1De5tUmLEmH_DS1MSvC3fCK0FKnwFW1yTrA59TLhUhpk",
    "https://docs.google.com/spreadsheets/d/1IHJTO1qqrSBQU2x8LC002PAMg9MRQ8fz-KmR2YVrA9Y",
    "https://docs.google.com/spreadsheets/d/12Fku4c5gPSxDkFsMA2v8TZHEwa-amn69nAwQ9W14T2I",
    "https://docs.google.com/spreadsheets/d/19GXBzpX-FIw6QBIoZtQOZ-rhIOKBLnty2RCQXH6ZeOE",
    "https://docs.google.com/spreadsheets/d/1t1hdtuPX52F-91RM5SOU2r-noN78yMPClYckohYRzNY",
    "https://docs.google.com/spreadsheets/d/1tOvHNIDpr_ClBhYb9RCPuVKCnUPUqh1K5cQ_9dRbkBI",
    "https://docs.google.com/spreadsheets/d/154zC-uA8hzJRhPw2Xq0Xin7YfNxuNOPW63JQ5aYZp-U",
    "https://docs.google.com/spreadsheets/d/11xRLx5B74EUPIfLx4nNkgVMPbBqvPhAZYmBQktJm_kQ",
    "https://docs.google.com/spreadsheets/d/1LcPvvE_rlya0OVgNhhCAoucu1D_uvx7j5Ju8YWN93qA",
    "https://docs.google.com/spreadsheets/d/1vn3bk6Xy__vljUr3lbI8nGu747fh6nACh2QrnwD7P-U",
    "https://docs.google.com/spreadsheets/d/1HE9iiVhcQLTBAMcJXAbMNBqTGFRHC_jVtJ4vxH384c4",
    "https://docs.google.com/spreadsheets/d/1KBesbsNsFpTeg1fiGlQn6vvlMqIk1nhUqQiwHzoCon4"
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
