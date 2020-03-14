#' annual_precip
#'
#' Calculate annual total precipitation each year for UCSB during a specified time period.
#' @param UCSB_daily_rainfall data frame with columns station_id, water_year, year, month, day, daily_rain, code, station
#' @param years the years in the data frame you want to specify for the time period (default is 1952 to 2019)
#' @author Laura Ingulsrud & Keene Morrow
#' @example annual_precip(UCSB_daily_rainfall, years = 2010:2015)
#' @return Returns a dataframe containing,
#' \describe{
#'  \item{Year}{Years specified}
#'  \item{Rainfall.inches}{The total precipitation (inches) for each year specified in the time period}
#'  }
#'

annual_precip = function(UCSB_daily_rainfall,  years = 1952:2019){

  precip_df <- UCSB_daily_rainfall %>%
    dplyr::filter(year %in% years) %>%
    dplyr::select(year, month, day, daily_rain)

  precip_sum <- aggregate(precip_df$daily_rain, by=list(precip_df$year), FUN = sum)
  names(precip_sum) = c("Year", "Rainfall.inches")
  years = as.numeric(as.character(precip_sum$Year))

  return(precip_sum)

}
