library(pacman)
pacman::p_load(data.table, fixest, BatchGetSymbols, finreportr, ggplot2, lubridate)

first.date <- Sys.Date()-500
last.date <- Sys.Date()
freq.data <- "daily"
ticker <- "PG"

stock <- BatchGetSymbols(tickers = ticker,
                         first.date = first.date,
                         last.date = last.date,
                         freq.data = freq.data,
                         do.cache = FALSE,
                         thresh.bad.data = 0)

stock_DT <- stock$df.tickers %>% setDT() %>% .[order(ticker,ref.date)]

ggplot(stock_DT, aes(x=ref.date, y=ret.adjusted.prices, color=ticker))+
  geom_line()+theme_bw()+labs(title = "Proctor Gamble",x="Date",y="Closing Price", subtitle = "")
