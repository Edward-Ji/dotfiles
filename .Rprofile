if (require("colorout", quietly = TRUE)) {
  rosewater <- "245;224;220"
  flamingo <- "242;205;205"
  pink <- "245;194;231"
  mauve <- "203;166;247"
  red <- "243;139;168"
  maroon <- "235;160;172"
  peach <- "250;179;135"
  yellow <- "249;226;175"
  green <- "166;227;161"
  teal <- "148;226;213"
  sky <- "137;220;235"
  sapphire <- "116;199;236"
  blue <- "137;180;250"
  lavender <- "180;190;254"
  text <- "205;214;244"
  subtext1 <- "186;194;222"
  subtext0 <- "166;173;200"
  overlay2 <- "147;153;178"
  overlay1 <- "127;132;156"
  overlay0 <- "108;112;134"
  surface2 <- "88;91;112"
  surface1 <- "69;71;90"
  surface0 <- "49;50;68"
  base <- "30;30;46"
  mantle <- "24;24;37"
  crust <- "17;17;27"

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
