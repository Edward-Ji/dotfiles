if (require("colorout", quietly = TRUE)) {
    mauve <- "#8839ef"
    red <- "#d20f39"
    peach <- "#fe640b"
    yellow <- "#df8e1d"
    green <- "#40a02b"
    teal <- "#179299"
    text <- "#4c4f69"
    surface1 <- "#bcc0cc"

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
