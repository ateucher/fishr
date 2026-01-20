#' Calculate Catch Per Unit Effort (CPUE)
#'
#' Calculates CPUE from catch and effort data, with optional gear standardization.
#'
#' @param catch Numeric vector of catch (e.g., kg)
#' @param effort Numeric vector of effort (e.g., hours)
#' @param gear_factor Numeric adjustment for gear standardization (default is 1)
#'
#' @return A numeric vector of CPUE values
#' @export
#'
#' @examples
#' cpue(100, 10)
#' cpue(100, 10, gear_factor = 0.5)
cpue <- function(catch, effort, gear_factor = 1) {
  if (!is.numeric(catch) || !is.numeric(effort)) {
    stop("Catch and effort must be numeric.")
  }
  if (any(effort <= 0, na.rm = TRUE)) {
    stop(
      "Effort contains zero or negative values; resulting CPUE will be Inf or NaN.",
      call. = TRUE
    )
  }
  raw_cpue <- catch / effort
  raw_cpue * gear_factor
}
