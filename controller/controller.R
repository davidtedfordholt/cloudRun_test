library(Mcomp)
library(tsibble)
library(tsbox)
library(tidyverse)

data <-
    subset(Mcomp::M3,"monthly") %>%
    lapply(function(x) tsbox::ts_tsibble(x$x) %>% mutate(series = x$sn) %>% as_tibble()) %>%
    bind_rows() %>%
    as_tsibble(key = series, index = time)

fetch_predictions <-
    function(tsbl) {
        httr::POST(
            "http://127.0.0.1:8000/fable",
            encode = "raw",
            body = serialize(tsbl, NULL),
            httr::content_type("application/octet-stream")
        )
    }

data %>%
    filter(series == "N1402") %>%
    fetch_predictions()

base::unserialize(httr::content(out))