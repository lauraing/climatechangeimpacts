# Test file for `mean_daily` function

context("Mean Daily")

library(testthat)
library(climatechangeimpacts)


test_data <- as.data.frame(cbind(year = c(2018, 2018, 2019, 2019, 2020, 2020),
                                 month = c(1:6),
                                 day = rep(1),
                                 daily_rain = rep(1)))

test_data <- test_data %>%
  mutate(date = as.Date(paste(year, month, day, sep = "-")))

test_that("mean_daily returns expected value",{
  expect_equal(mean_daily(data = test_data, start = "2020-06-01", end = "2020-06-30"), 1/30)
})
