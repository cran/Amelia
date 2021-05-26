## ----setup, echo = FALSE, include = FALSE-------------------------------------
knitr::opts_chunk$set(fig.width = 5, fig.height = 4, fig.align = "center")
options(digits = 4, show.signif.stars = FALSE)
set.seed(12345)

## ----amelia, results = "hide"-------------------------------------------------
library(Amelia)
data(freetrade)
a.out <- amelia(freetrade, m = 5, ts = "year", cs = "country", p2s = 0)

## ----plot_amelia--------------------------------------------------------------
plot(a.out, which.vars = 3:6)

## ----compare_density----------------------------------------------------------
compare.density(a.out, var = "signed")

## -----------------------------------------------------------------------------
overimpute(a.out, var = "tariff")

## ----overimp_bad, echo = FALSE, results = "hide"------------------------------
dd <- Amelia:::rmvnorm(50, mu = c(0.5,0.5), vcv =
                       matrix(c(0.25^2,.06, .06,0.25^2),2,2))
ddmiss <- sample(1:50, replace = FALSE, size = 10)
is.na(dd) <- ddmiss
aa.out <- amelia(dd, m = 5)
overimpute(aa.out, var = 2, main = "Observed versus Imputed Values")

## ----displd-------------------------------------------------------------------
disperse(a.out, dims = 1, m = 5)
disperse(a.out, dims = 2, m = 5)

## ----tsplot1------------------------------------------------------------------
a.out.time <- amelia(freetrade, ts = "year", cs = "country", polytime = 1,
                     intercs = TRUE, p2s = 0)
tscsPlot(a.out.time, cs = "Malaysia", main = "Malaysia (with time settings)",
         var = "tariff", ylim = c(-10, 60))

## ----mmap1--------------------------------------------------------------------
missmap(a.out)

