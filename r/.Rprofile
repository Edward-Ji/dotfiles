if (require("colorout", quietly = TRUE)) {
    mauve <- "203;166;247"
    red <- "243;139;168"
    maroon <- "235;160;172"
    peach <- "250;179;135"
    yellow <- "249;226;175"
    green <- "166;227;161"
    teal <- "148;226;213"
    blue <- "137;180;250"
    text <- "205;214;244"

    true_color <- function(fg, bg) {
        esc <- "\x1b[38;2;"
        esc <- paste0(esc, fg)
        if (!missing(bg)) {
            esc <- paste0(esc, ";48;2;", bg)
        }
        esc <- paste0(esc, "m")
        return(esc)
    }

    setOutputColors(
        normal = true_color(text),
        negnum = true_color(mauve),
        zero = true_color(mauve),
        number = true_color(mauve),
        date = true_color(text),
        string = true_color(green),
        const = true_color(peach),
        false = true_color(blue),
        true = true_color(blue),
        infinite = true_color(mauve),
        index = true_color(teal),
        stderror = true_color(maroon),
        warn = true_color(yellow),
        error = true_color(red),
        verbose = FALSE,
        zero.limit = NA
    )
}
