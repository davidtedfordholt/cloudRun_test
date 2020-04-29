#* @post /fable
#* @serializer rds
function(req) {
    
    packageStartupMessage("forecasting object")
    req$robj %>%
        fabletools::model(
            naive = fable::NAIVE(),
            snaive = fable::SNAIVE(),
            arima = fable::ARIMA()
        ) %>%
        fabletools::forecast(h = 12)
}
