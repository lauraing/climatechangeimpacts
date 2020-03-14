# function to calculate mean precipitation

# It would be cool if we made it so the data didn't have to have an entry for every day.
# Maybe this would mean that the function would recognize what period of time the data takes place over and calculate the number of days in that period, then caluclate the mean as (sum of rainfall)/(end_date - start_date)


#' mean_precip
#'
#' Calculate mean precipitation each year for UCSB during a specified time period. The ouput of this function returns the precipitation amount for that time period.
#' @param UCSB_daily_rainfall data frame with columns station_id, water_year, year, month, day, daily_rain, code, station
#' @param years the years in the data frame you want to specify for the time period (default is 1952 to 2019)
#' @param months the months in the data frame you want to specify for the time period (default is 1-4)
#' @author Laura Ingulsrud & Keene Morrow
#' @example mean_precip(UCSB_daily_rainfall, years = 2010:2015, months = 2:3)
#' @return Returns a list containing,
#' \describe{
#'  \item{Years}{Years specified}
#'  \item{Months}{Months specified}
#'  \item{Max_precip}{The maximum precipitation (inches) for each year specified in the time period}
#'  }
#'

mean_precip = function(UCSB_daily_rainfall,  years = 1952:2019, months = 1:12){

  precip_df <- UCSB_daily_rainfall %>%
    dplyr::filter(year %in% years, month %in% months) %>%
    dplyr::select(year, month, day, daily_rain) %>%
    mutate(date = lubridate::ymd(paste(year, month, day, sep = "-")))

  precip_array <- array(data = precip_df$daily_rain,
                        dim = c(30, 68),
                        dimnames = list(
                          1:30, # day labels
                          1952:2019)) # year labels

  duration <- max(date) - min(date)

  precip_months_mean <- apply(precip_array, MARGIN = 2, FUN = , na.rm = TRUE)

  return(
    list(Years = years,
         Months = months,
         Max_precip = precip_months_max)
  )

}

max_precip(UCSB_daily_rainfall, years = 2009:2018, months = 2:4)


mean_daily = function(data = "", start = "1900-01-01", end = "2000-01-01"){
  start_date <- as.Date(start)
  end_date <- as.Date(end)

  # filter input data to include only dates between start and end dates
  precip_df <- data %>%
    mutate(date = as.Date(date))
  dplyr::filter(date >= start_date & date <= end_date)

  # calculate sum of daily rain
  sum <- sum(precip_df$daily_rain)

  # calculate duration
  dur <- as.numeric(end_date - start_date)

  # calculate mean
  mean <- sum / dur

  return(mean)
}

data = read_csv("R/UCSB_daily_rainfall.csv")
start = "1970-01-01"
end = "2000-01-01"

start_date <- as.Date(start)
end_date <- as.Date(end)

# filter input data to include only dates between start and end dates
precip_df <- data %>%
  mutate(date = as.Date(date))
  dplyr::filter(date >= start_date & date <= end_date)

# calculate sum of daily rain
sum <- sum(precip_df$daily_rain)

# calculate duration
dur <- as.numeric(end_date - start_date)

# calculate mean
mean <- sum / dur


### Testing
test <- mean_daily(data = data, start = "1970-01-01", end = "2000-01-01")
