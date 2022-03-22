library(pacman)
pacman::p_load(data.table, fixest, BatchGetSymbols, finreportr, ggplot2, lubridate)

first.date <- Sys.Date()-365
last.date <- Sys.Date()
freq.data <- "daily"
df.SP500 <- GetSP500Stocks()
tickers <- df.SP500$Tickers

SP500stonks <- BatchGetSymbols(tickers = tickers,
                               first.date = first.date,
                               last.date = last.date,
                               freq.data = freq.data,
                               do.cache = FALSE,
                               thresh.bad.data = 0)
