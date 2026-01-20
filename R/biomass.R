#' Calculate Biomass Index
#'
#' Calculates biomass index from CPUE and area swept.
#'
#' @param cpue Numeric vector of CPUE values
#' @param area_swept Numeric vector of area swept (e.g., km²)
#'
#' @return A numeric vector of biomass index values
#' @export
#'
#' @examples
#' biomass_index(cpue = 10, area_swept = 5)
biomass_index <- function(cpue, area_swept) {
  if (!is.numeric(cpue) || !is.numeric(area_swept)) {
    stop("CPUE and area_swept must be numeric.")
  }
  cpue * area_swept
}
