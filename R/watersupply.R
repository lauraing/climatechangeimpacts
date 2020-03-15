#' watersupply
#'
#' Calculate annual total precipitation each year for UCSB during a specified time period.
#' @param data data frame with columns year, month, day, daily_rain
#' @param years the years in the data frame you want to specify for the time period (default is 1952 to 2018)
#' @param area the surface area of the reservoir
#' @param total_depth the total depth of the reservoir
#' @param start_depth the depth at the beginning of the year range in years
#' @author Laura Ingulsrud & Keene Morrow
#' @example watersupply(data = UCSB_rain, years = 2010:2015, area = 1000, total_depth = 2000, start_depth = 10)
#' @return Returns a list containing,
#' \describe{
#'  \item{end_vol}{Volume of water in reservoir at the end of the time period (square feet)}
#'  \item{pct_full}{Percent of reservoir volume occupied at the end of the time period}
#'  \item{pct_change}{Percent change in reservoir volume occupied over the time period}
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

  return(list(end_vol, pct_full, pct_change))

}
