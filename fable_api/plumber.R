library(plumber)

#* Forecast tsibble
#* @param req
#* @serializer rds
#* @post /fable
function(req) {
    
    packageStartupMessage("forecasting object")
    req$tsbl %>%
        fabletools::model(
            naive = fable::NAIVE(),
            snaive = fable::SNAIVE(),
            arima = fable::ARIMA()
        ) %>%
        fabletools::forecast(h = 12)
}
