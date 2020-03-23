#' mean_daily
#'
#' Calculate mean daily precipitation over a specified time period. The ouput of this function returns the precipitation amount for that time period.
#' @param data data frame with columns date and daily_rain
#' @param start the first date of the range
#' @param end the last date of the range
#' @author Laura Ingulsrud & Keene Morrow
#' @example mean_daily(data = UCSB_rain, start = "2018-01-01", end = "2018-12-31")
#' @return Returns numeric value for the mean daily precipitation over the period between the start and end dates
#'

mean_daily = function(data = "", start = "1900-01-01", end = "2000-01-01"){
  start_date <- as.Date(start)
  end_date <- as.Date(end)

  if (min(data$date) > start_date) return("Input start of date range exceeds date range of data")
  if (max(data$date) < end_date) return("Input end of date range exceeds date range of data")

  # filter input data to include only dates between start and end dates
  precip_df <- data %>%
    mutate(date = as.Date(date)) %>%
    dplyr::filter(date >= start_date & date <= end_date)

  # return error if no observations in date range
  if(nrow(precip_df) <= 0) return(NA)

  # calculate sum of daily rain
  sum <- sum(precip_df$daily_rain)

  # calculate duration
  dur <- as.numeric(end_date - start_date) + 1

  # calculate mean
  mean <- sum / dur

  return(mean)
}
