# Test file for `annual_precip` function

context("Annual Precipitation")

library(tidyverse)
library(testthat)
library(climatechangeimpacts)

test_data <- as.data.frame(cbind(year = c(2018, 2018, 2019, 2019, 2020, 2020),
                                 month = c(1:6),
                                 day = rep(1),
                                 daily_rain = rep(1)))

test_that("annual_precip returns data frame",{
  expect_equal(class(annual_precip(data = test_data, years = 2018:2020)), "data.frame")
})

test_that("annual_precip returns expected rainfall values",{
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Rainfall.inches[1], 2)
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Rainfall.inches[2], 2)
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Rainfall.inches[3], 2)
  expect_equal(sum(annual_precip(data = test_data, years = 2018:2020)$Rainfall.inches), 6)
})

test_that("annual_precip returns expected years", {
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Year[1], 2018)
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Year[2], 2019)
  expect_equal(annual_precip(data = test_data, years = 2018:2020)$Year[3], 2020)
})
