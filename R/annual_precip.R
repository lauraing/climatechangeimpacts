#' annual_precip
#'
#' Calculate annual total precipitation each year for a dataset during a specified time period.
#' @param data dataframe with columns year, month, day, daily_rain
#' @param years the years in the dataframe you want to specify for the time period (default is 1952 to 2019)
#' @author Laura Ingulsrud & Keene Morrow
#' @example annual_precip(data = UCSB_rain, years = 2010:2015)
#' @return Returns a dataframe containing,
#' \describe{
#'  \item{Year}{Years specified}
#'  \item{Rainfall.inches}{The total precipitation (inches) for each year specified in the time period}
#'  }
#'

annual_precip = function(data = "",  years = 1952:2019){
  if (class(data$year) != "numeric") return("Dataframe must contain variable year of class numeric")
  if (class(data$month) != "numeric") return("Dataframe must contain variable month of class numeric")
  if (class(data$day) != "numeric") return("Dataframe must contain variable day of class numeric")
  if (class(data$daily_rain) != "numeric") return("Dataframe must contain variable daily_rain of class numeric with observations greater than or equal to 0.")

  if (count(filter(data, daily_rain < 0)) > 0) return("Dataframe must contain variable daily_rain of class numeric with observations greater than or equal to 0.")

  precip_df <- data %>%
    dplyr::filter(year %in% years) %>%
    dplyr::select(year, month, day, daily_rain)

  precip_sum <- aggregate(precip_df$daily_rain, by=list(precip_df$year), FUN = sum)
  names(precip_sum) = c("Year", "Rainfall.inches")
  years = as.numeric(as.character(precip_sum$Year))

  return(precip_sum)

}
