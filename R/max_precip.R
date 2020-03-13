#' max_precip
#'
#' Calculate maximum precipitation each year for UCSB during a specified time period. The ouput of this function returns the precipitation amount for that time period.
#' @param UCSB_daily_rainfall data frame with columns station_id, water_year, year, month, day, daily_rain, code, station
#' @param years the years in the data frame you want to specify for the time period (default is 1952 to 2019)
#' @param months the months in the data frame you want to specify for the time period (default is 1-4)
#' @author Laura Ingulsrud & Keene Morrow
#' @example max_precip(UCSB_daily_rainfall, years = 2010:2015, months = 2:3)
#' @return Returns a list containing,
#' \describe{
#'  \item{Years}{Years specified}
#'  \item{Months}{Months specified}
#'  \item{Max_precip}{The maximum precipitation (inches) for each year specified in the time period}
#'  }
#'

max_precip = function(UCSB_daily_rainfall,  years = 1952:2019, months = 1:4){

  precip_df <- UCSB_daily_rainfall %>%
    dplyr::filter(year %in% years, month %in% months) %>%
    dplyr::select(year, month, day, daily_rain)

  precip_array <- array(data = precip_df$daily_rain,
                      dim = c(30, 68),
                      dimnames = list(
                        1:30, # day labels
                        1952:2019)) # year labels

  precip_months_max <- apply(precip_array, MARGIN = 2, FUN = max, na.rm = TRUE)

  return(
    list(Years = years,
         Months = months,
         Max_precip = precip_months_max)
  )

}

max_precip(UCSB_daily_rainfall, years = 2009:2018, months = 2:4)
