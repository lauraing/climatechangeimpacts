# Test file for `annual_precip` function

context("Annual Precipitation")

library(tidyverse)
library(testthat)
library(climatechangeimpacts)

test_data <- as.data.frame(cbind(year = c(2018, 2018, 2019, 2019, 2020, 2020),
                                 month = c(1:6),
                                 day = rep(1),
                                 daily_rain = rep(1)))

test_that("annual_precip_returns_dataframe",{
  expect_equal(class(annual_precip(data = test_data, years = 2018:2020)), "data.frame")
})

test_that("annual_precip returns expected values",{
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Rainfall.inches[1], 2)
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Rainfall.inches[2], 2)
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Rainfall.inches[3], 2)
  expect_equal(sum(annual_precip(data = test_data, years = 2018:2020)$Rainfall.inches), 6)
})
