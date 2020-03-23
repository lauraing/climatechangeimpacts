# Test file for `annual_precip` function

context("Annual Precipitation")

library(testthat)
library(climatechangeimpacts)

test_data <- as.data.frame(cbind(year = c(2018, 2018, 2019, 2019, 2020, 2020),
                                 month = c(1:6),
                                 day = rep(1),
                                 daily_rain = rep(1)))

annual_precip(data = test_data, years = 2018:2020)

test_that("annual_precip_returns_dataframe",{
  expect_equal(class(annual_precip(data = test_data, years = 2018:2020)), "data.frame")
})

