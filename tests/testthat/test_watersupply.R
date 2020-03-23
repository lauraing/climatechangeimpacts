# Test file for `watersupply` function

context("Water Supply")

library(tidyverse)
library(testthat)
library(climatechangeimpacts)

test_data <- as.data.frame(cbind(year = c(2018, 2018, 2019, 2019, 2020, 2020),
                                 month = c(1:6),
                                 day = rep(1),
                                 daily_rain = rep(1)))

test_that("watersupply() returns list",{
  expect_equal(class(watersupply(data = test_data,
                                 years = 2018:2020,
                                 area = 1,
                                 total_depth = 1,
                                 start_depth = 0)), "list")
})


test_that("end volume (end_vol) returns expected value",{
  expect_equal(as.numeric(watersupply(data = test_data,
                                      years = 2018:2020,
                                      area = 1,
                                      total_depth = 1,
                                      start_depth = 0)[1]),
               0.5)
})

test_that("percent full (pct_full) returns expected value",{
  expect_equal(as.numeric(watersupply(data = test_data,
                                      years = 2018:2020,
                                      area = 1,
                                      total_depth = 1,
                                      start_depth = 0)[2]),
               0.5)
})

test_that("percent change (pct_change) returns expected value",{
  expect_equal(as.numeric(watersupply(data = test_data,
                                      years = 2018:2020,
                                      area = 1,
                                      total_depth = 1,
                                      start_depth = 0)[3]),
               0.5)
})
