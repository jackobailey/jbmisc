#' Rescale Variables in R
#'
#' This functions makes it easier to rescale continuous variables.
#'
#' @param x A vector of interval-type data to standardise.
#' @param type One of "z", "mean", "gelman". Option "z" converts the scale to z-scores. Option "mean" rescales the data so that its mean is zero. Option "gelman" rescales the data so that it is centred on zero and a one-unit increase or decrease corresponds with the scale moving to its 97.5th and 2.5th percentile.
#' @param na.rm Remove missing data? Defaults to TRUE.
#' @return A vector of rescaled data.
#' @examples
#' x <- rnorm(100, 1, .2)
#' rescale(x, type = "z")
#' @export

rescale <- function(x, type = "z", na.rm = T){
  if(is.numeric(x) == F){
    warning("x must be a vector of numeric data.")
  } else if(!(type %in% c("z", "mean", "gelman"))){
    warning('x must be one of "z", "mean", or "gelman".')
  } else if(type == "z"){
    (x - mean(x, na.rm = na.rm))/sd(x, na.rm = na.rm)
  } else if (type == "mean"){
    (x - mean(x, na.rm = na.rm))
  } else if(type == "gelman") {
    (x - mean(x, na.rm = na.rm))/(qnorm(.975)*sd(x, na.rm = na.rm))
  }
}