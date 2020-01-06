#' @title re-export magrittr pipe operators
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
NULL

details_env        <- new.env()
details_env$device <- FALSE
details_env$imgur <- TRUE
