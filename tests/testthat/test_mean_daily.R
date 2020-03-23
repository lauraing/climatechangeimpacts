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

<<<<<<< HEAD
test_that("mean_daily_returns_expected_value",{
  expect_equal(mean_daily(data = test_data_md, start = "2020-06-01", end = "2020-06-30"), 1/30)
=======
test_that("mean_daily returns expected value",{
  expect_equal(mean_daily(data = test_data, start = "2020-06-01", end = "2020-06-30"), 1/30)
>>>>>>> 1dd9b7fe5a4c4a41aa0a76903346e15c26c7577f
})
