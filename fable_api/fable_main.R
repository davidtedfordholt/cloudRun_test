library(plumber)

packageStartupMessage("Starting plumber")
api <- plumber::plumb("fable_api/plumber.R")

packageStartupMessage("filtering object")
api$filter("tsbl", function(req) {
    req$rook.input$rewind()
    req$tsbl <- unserialize(req$rook.input$read())
    plumber::forward()
})

packageStartupMessage("running plumber")
api$run(debug = TRUE, port = 8000)
