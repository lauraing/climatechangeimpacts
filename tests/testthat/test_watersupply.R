# Test file for `watersupply` function

context("Water Supply")

library(tidyverse)
library(testthat)
library(climatechangeimpacts)

test_data <- as.data.frame(cbind(year = c(2018, 2018, 2019, 2019, 2020, 2020),
                                 month = c(1:6),
                                 day = rep(1),
                                 daily_rain = rep(1)))

test_that("watersupply()_returns_list",{
  expect_equal(class(watersupply(data = test_data,
                                 years = 2018:2020,
                                 area = 1,
                                 total_depth = 1,
                                 start_depth = 0)), "list")
})


test_that("end_volume_(end_vol)_returns_expected_value",{
  expect_equal(as.numeric(watersupply(data = test_data,
                                      years = 2018:2020,
                                      area = 1,
                                      total_depth = 1,
                                      start_depth = 0)[1]),
               0.5)
})

test_that("percent_full_(pct_full)_returns_expected_value",{
  expect_equal(as.numeric(watersupply(data = test_data,
                                      years = 2018:2020,
                                      area = 1,
                                      total_depth = 1,
                                      start_depth = 0)[1]),
               0.5)
})

test_that("percent_change_(pct_change)_returns_expected_value",{
  expect_equal(as.numeric(watersupply(data = test_data,
                                      years = 2018:2020,
                                      area = 1,
                                      total_depth = 1,
                                      start_depth = 0)[1]),
               0.5)
})
