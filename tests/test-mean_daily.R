# Test file for `mean_daily` function

context("Mean Daily")

library(tidyverse)
library(testthat)
library(climatechangeimpacts)


test_data_md <- as.data.frame(cbind(year = c(2018, 2018, 2019, 2019, 2020, 2020),
                                 month = c(1:6),
                                 day = rep(1),
                                 daily_rain = rep(1)))

test_data_md <- test_data %>%
  mutate(date = as.Date(paste(year, month, day, sep = "-")))

test_that("mean daily returns expected value",{
  expect_equal(mean_daily(data = test_data_md, start = "2020-05-01", end = "2020-06-01"), 2/32)
})

test_that("returns error if date range extends beyond data",{
  expect_match(mean_daily(data = test_data_md, start = "2000-06-01", end = "2019-06-30"), "Input start of date range exceeds date range of data")
  expect_match(mean_daily(data = test_data_md, start = "2019-06-01", end = "2030-06-30"), "Input end of date range exceeds date range of data")
})

test_that("returns error if date range contains no observations",{
  expect(TRUE, mean_daily(data = test_data_md, start = "2018-06-01", end = "2018-06-30"), NA)
})
