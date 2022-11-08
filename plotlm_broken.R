# Fit a linear model and plot it
plotlm <- function(x, y, col = "blue", ...){
                
  if (FALSE) {
    x = rnorm(100)
    y = rnorm(100)
    col = "blue"
    plotlm(x, y, main = "Plot", pch = 18,
           col = "green4",
           cex = 2)
  }
  mod <- lm(y ~ x)
  browser()
  tmp = sign(mod$coefficients[2])
  tmp = substr(1,1)
  modstr <- paste("y =", signif(mod$coefficients[1], 3),
                  tmp,
                  signif(abs(mod$coefficients[2]), 3), "x")
  if (plotit) {
    plot(x, y, col = col, ...)
    mtext(modstr, side = 3, line = 0)
    abline(mod)
  }
  return(mod)
}
source(“plotlm_broken.R”)
