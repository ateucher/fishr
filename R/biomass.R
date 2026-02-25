#' Calculate biomass index
#'
#' Calculates biomass index from CPUE and area swept.
#'
#' @param cpue Numeric veccctor of CPUE values
#' @param area_swept Numeric vector of area swept (e.g., km^2)
#' @param catch catch value numeric
#' @param effort effort value numeric
#' @param ... arguments passed on to cpue()
#' @param verbose Logical; print processing info? Default from
#'   `getOption("fishr.verbose", FALSE)`.
#'
#' @returns A numeric vector of biomass index values
#' @export
#'
#' @examples
#' salmon_cpue <- cpue(catch = 2, effort = 2)
#' biomass_index(salmon_cpue, 5)
biomass_index <- function(
  cpue = NULL,
  area_swept,
  catch = NULL,
  effort = NULL,
  verbose = getOption("fishr.verbose", default = FALSE),
  ...
) {
  rlang::check_dots_used()

  if (is.null(cpue) && !is.null(catch) && !is.null(effort)) {
    cpue <- cpue(catch, effort, ...)
  }

  if (is.null(cpue)) {
    stop("Must provide either 'cpue' or both 'catch' and 'effort'.")
  }

  if (verbose) {
    message("Calculating biomass index for ", length(cpue), " records")
  }

  cpue * area_swept
}
