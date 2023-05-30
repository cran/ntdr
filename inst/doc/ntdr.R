## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  remotes::install_github("https://github.com/vgXhc/ntdr", build_vignettes = TRUE)

## ----setup--------------------------------------------------------------------
library(ntdr)
library(tidyverse)

## ----bare-get-ntd-call--------------------------------------------------------
ntd_data <- get_ntd()
ntd_data
colnames(ntd_data)

## -----------------------------------------------------------------------------
ntd_data |>
  count(modes)

## -----------------------------------------------------------------------------
ntd_data |>
  count(tos, sort = TRUE)

## ----ridership-chart----------------------------------------------------------
get_ntd(agency = c("City of Madison", "Capital Area Transportation Authority"), modes = "MB") |>
  dplyr::filter(tos == "DO") |>
  ggplot(aes(month, value, color = agency)) +
  geom_line() +
  labs(title = "Monthly unlinked passenger trips in Madison and Lansing") +
  theme_minimal()

