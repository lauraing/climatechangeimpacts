#' UCSB Daily Rainfall Data from Santa Barbara County
#'
#' Daily rainfall amounts are recorded for each location at 8am for the previous 24 hours. Daily rainfall data are available from https://www.countyofsb.org/pwd/dailyrainfall.sbc. Copyright Santa Barbara County, Department of Water Resources.
#' Data were downloaded from Santa Barbara County. https://www.countyofsb.org/pwd/dailyrainfall.sbc
#'
#' @format A data frame with 2567 rows and 8 columns
#' \itemize{
#' \item station_id The identification number for the rainfall gauge station
#' \item water_year
#' \item year The year rainfall data was collected
#' \item month The month rainfall data was collected
#' \item day The day rainfall data was collected
#' \item daily_rain The daily rainfall (in inches) recorded as of 8am for the previous 24 hours (PST)
#' \item code Codes: PR = Preliminary data, E = Estimated from nearby gauge
#' \item station The common name of the location of the rainfall gauge station
#'
#' }
#' @source \url{https://www.countyofsb.org/pwd/dailyrainfall.sbc}
#' @author Santa Barbara County Water Resources
"UCSB_daily_rainfall"
