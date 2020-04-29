packageStartupMessage("Starting plumber")
api <- plumber::plumb("fable_api.R")

packageStartupMessage("filtering object")
api$filter("robj", function(req) {
    req$rook.input$rewind()
    req$robj <- unserialize(req$rook.input$read())
    plumber::forward()
})

packageStartupMessage("running plumber")
api$run(debug = TRUE, port = Sys.getenv("PORT"))
