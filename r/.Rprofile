if (require("colorout", quietly = TRUE)) {
    mauve <- "#cba6f7"
    red <- "#f38ba8"
    peach <- "#fab387"
    yellow <- "#f9e2af"
    green <- "#a6e3a1"
    teal <- "#94e2d5"
    text <- "#cdd6f4"
    surface1 <- "#45475a"

    true_color <- function(fg = "", bg = "", fo = "") {
        escape <- "\x1b["
        if (fg != "") fg <- {
            rgb_fg <- grDevices::col2rgb(fg)
            paste0("38;2;", rgb_fg[1], ";", rgb_fg[2], ";", rgb_fg[3])
        }
        if (bg != "") bg <- {
            rgb_bg <- grDevices::col2rgb(bg)
            paste0(";48;2;", rgb_bg[1], ";", rgb_bg[2], ";", rgb_bg[3])
        }
        fo <- if (fo != "") paste0(";", fo)
        return(paste0(escape, fg, bg, fo, "m"))
    }

    setOutputColors(
        normal = true_color(text),
        negnum = true_color(peach),
        zero = true_color(peach),
        number = true_color(peach),
        date = true_color(text),
        string = true_color(green),
        const = true_color(peach),
        false = true_color(mauve),
        true = true_color(mauve),
        infinite = true_color(peach),
        index = true_color(teal),
        stderror = true_color(text),
        warn = true_color(yellow),
        error = true_color(red, surface1),
        verbose = FALSE,
        zero.limit = NA
    )
}
