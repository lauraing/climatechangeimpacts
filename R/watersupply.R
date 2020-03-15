# function that estimates water supply from precipitation with parameters that vary to reflect water storage

#' watersupply
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

watersupply = function(data = "",  years = 1952:2018, area = 100, total_depth = 200, start_depth = 100){

  annual <- annual_precip(data = data, years = years)

  change_in <- sum(annual$Rainfall.inches)

  change_ft <- change_in / 12

  end_depth <- start_depth + change_ft

  tot_vol <- area * total_depth

  start_vol <- area * start_depth

  end_vol <- area * end_depth

  vol_change <- area * change_ft

  pct_full <- end_vol / tot_vol

  pct_change <- vol_change / tot_vol

  return(list(pct_full, pct_change))

}

watersupply(data = UCSB_daily_rainfall)

