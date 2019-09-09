#' @importFrom withr with_png
#' @importFrom utils capture.output
device_check <- function(object,f_png = tempfile(fileext = ".png"), env){
  
  utils::capture.output(withr::with_png(f_png,print(object)))
  
  env$device <- !is.na(file.size(f_png))
  
  if(env$device){
    env$f_png <- f_png
    object <- f_png
  }
  
  object
  
}
