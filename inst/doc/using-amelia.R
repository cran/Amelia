## ----setup, echo = FALSE, include = FALSE-------------------------------------
knitr::opts_chunk$set(fig.width = 5, fig.height = 4, fig.align = "center")
options(digits = 4, show.signif.stars = FALSE)
set.seed(12345)

## ----load_data, results = "hide"----------------------------------------------
library(Amelia)
data(freetrade)

## ----summarize_data-----------------------------------------------------------
summary(freetrade)

## ----mk_lm--------------------------------------------------------------------
summary(lm(tariff ~ polity + pop + gdp.pc + year + country,
          data = freetrade))

## ----amelia-------------------------------------------------------------------
a.out <- amelia(freetrade, m = 5, ts = "year", cs = "country")
a.out

## -----------------------------------------------------------------------------
hist(a.out$imputations[[3]]$tariff, col = "grey", border = "white")

## ----save, eval = FALSE-------------------------------------------------------
#  save(a.out, file = "imputations.RData")

## ----write_amelia, eval = FALSE-----------------------------------------------
#  write.amelia(obj = a.out, file.stem = "outdata")

## ----write_dta, eval = FALSE--------------------------------------------------
#  write.amelia(obj = a.out, file.stem = "outdata", format = "dta")

## ----more_amelia--------------------------------------------------------------
a.out.more <- amelia(freetrade, m = 10, ts = "year", cs = "country", p2s = 0)
a.out.more

## ----ameliabind---------------------------------------------------------------
a.out.more <- ameliabind(a.out, a.out.more)
a.out.more

## ----rand_stem, eval = FALSE--------------------------------------------------
#  b <- round(runif(1, min = 1111, max = 9999))
#  random.name <- paste("am", b, sep = "")
#  amelia <- write.amelia(obj = a.out, file.stem = random.name)

## ----p2s----------------------------------------------------------------------
a.out.p2s <- amelia(freetrade, m = 1, ts = "year", cs = "country", p2s = 2)

## ----polity_tab---------------------------------------------------------------
table(a.out$imputations[[3]]$polity)

## ----polity_ord---------------------------------------------------------------
a.out1 <- amelia(freetrade, m = 5, ts = "year", cs = "country", ords =
                 "polity", p2s = 0)
table(a.out1$imputations[[3]]$polity)

## ----binary_tab---------------------------------------------------------------
table(a.out1$imputations[[3]]$signed)

## ----noms---------------------------------------------------------------------
a.out2 <- amelia(freetrade, m = 5, ts = "year", cs = "country",
                 noms = "signed", p2s = 0)
table(a.out2$imputations[[3]]$signed)

## ----tarrif_hist--------------------------------------------------------------
hist(freetrade$tariff, col="grey", border="white")
hist(log(freetrade$tariff), col="grey", border="white")

## ----idvars-------------------------------------------------------------------
amelia(freetrade, idvars = c("year", "country"))

## ----idvars_error-------------------------------------------------------------
a.out2 <- amelia(freetrade, idvars = c("year"))

## ----polytime, results = "hide"-----------------------------------------------
a.out2 <- amelia(freetrade, ts = "year", cs = "country", polytime = 2)

## ----intercs, results = "hide"------------------------------------------------
a.out.time <- amelia(freetrade, ts = "year", cs = "country", polytime = 1,
                 intercs = TRUE, p2s = 2)

## ----tcomp1-------------------------------------------------------------------
tscsPlot(a.out, cs = "Malaysia", main = "Malaysia (no time settings)",
         var = "tariff", ylim = c(-10, 60))

tscsPlot(a.out.time, cs = "Malaysia", main = "Malaysia (with time settings)",
         var = "tariff", ylim = c(-10, 60))

## ----lags_leads---------------------------------------------------------------
a.out2 <- amelia(freetrade, ts = "year", cs = "country", lags = "tariff",
                 leads = "tariff")

## ----empri--------------------------------------------------------------------
a.out.time2 <- amelia(freetrade, ts = "year", cs = "country", polytime = 1,
                 intercs = TRUE, p2s = 0, empri = .01 * nrow(freetrade))
a.out.time2

## ----thailand-----------------------------------------------------------------
freetrade[freetrade$country == "Thailand", c("year", "country", "tariff")]

## ----build_prior--------------------------------------------------------------
pr <- matrix(
  c(158, 159, 160, 3, 3, 3, 40, 40, 40, 3, 3, 3),
  nrow = 3, ncol = 4
)
pr

## ----amelia_prior-------------------------------------------------------------
a.out.pr <- amelia(freetrade, ts = "year", cs = "country", priors = pr)

## ----build_prior2-------------------------------------------------------------
pr.2 <- matrix(
  c(158, 159, 160, 3, 3, 3, 34, 34, 34, 46, 46, 46, 0.95, 0.95, 0.95),
  nrow = 3, ncol = 5
)
pr.2

## ----build_prior3-------------------------------------------------------------
pr.3 <- matrix(
  c(158, 159, 160, 0, 3, 3 , 3, 3, 40, 40, 40, 20, 3, 3, 3, 5),
  nrow = 4, ncol = 4)
pr.3

## ----build_bounds-------------------------------------------------------------
bds <- matrix(c(3, 30, 40), nrow = 1, ncol = 3)
bds

## ----amelia_bounds------------------------------------------------------------
a.out.bds <- amelia(freetrade, ts = "year", cs = "country", bounds = bds,
                    max.resample = 1000)

## ----bounds_plot--------------------------------------------------------------
tscsPlot(a.out, cs = "Malaysia", main = "No logical bounds", var = "tariff",
         ylim = c(-10, 60))

tscsPlot(a.out.bds, cs = "Malaysia", main = "Bounded between 30 and 40",
         var = "tariff", ylim = c(-10, 60))

## ----amelia_transform---------------------------------------------------------
a.out <- transform(a.out, lgdp = log(gdp.pc))
head(a.out$imputations[[1]][,c("country", "year","gdp.pc", "lgdp")])

## ----interaction--------------------------------------------------------------
a.out <- transform(a.out, pol_gdp = polity * gdp.pc)

## ----sum_trans----------------------------------------------------------------
summary(a.out)

## ----lm_lwd-------------------------------------------------------------------
orig.model <- lm(tariff ~ polity + pop + gdp.pc + year + country, data = freetrade)
orig.model

## ----lm_imp-------------------------------------------------------------------
imp.models <- with(
  a.out,
  lm(tariff ~ polity + pop + gdp.pc + year + country)
)
imp.models[1:2]

## ----mi_combine---------------------------------------------------------------
out <- mi.combine(imp.models, conf.int = TRUE)
out

## ----write_dta_stacked, eval = FALSE------------------------------------------
#  write.amelia(a.out, separate = FALSE, file.stem = "outdata", format = "dta")

