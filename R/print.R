#' @export
print.details_character <- function(x,...){
  
  print(strsplit(as.character(x),'\\n')[[1]])
  
}

#' @export
print.details_console <- function(x,...){
  
  cat(x,...)
  
}

#' @importFrom clipr write_clip
#' @export
print.details_clipr <- function(x,...){
  
  if(!clipr::clipr_available())
    stop('clipboard is not installed on the system, consider setting output to "edit"')
  
  clipr::write_clip(x,...)
  
}

#' @importFrom utils file.edit
#' @export
print.details_edit <- function(x,...){
  
  if(!interactive()){
    warning('Not an interactive enviornment, falling back to output = "console"',
            call. = FALSE)
    class(x) <- 'details_console'
    return(print(x))
  }
    

  tf <- tempfile(fileext = '.R')
  
  cat(x,file = tf,sep = '\n')
  
  utils::file.edit(tf,...)
  
}

#' @export
#' @importFrom knitr knit_print
knit_print.details_console <- function(x,...){
  res <- capture.output(print(x))
  class(x) <- 'knit_asis'
  x
}

#' @export
#' @importFrom knitr knit_print
knit_print.details_character <- function(x,...){
  res <- capture.output(print(x))
  class(x) <- 'knit_asis'
  x
}

#' @export
#' @importFrom knitr knit_print fig_path sew
#' @importFrom utils getFromNamespace
knit_print.details_image <- function (x, ...){

on.exit({unlink(details_env$f_png)},add = TRUE)

if (!length(attr(x,'file'))) 
  return(invisible())

  this <- attr(x,'file')
  
  plot_counter <- utils::getFromNamespace("plot_counter", "knitr")
  in_base_dir <- utils::getFromNamespace("in_base_dir", "knitr")
  
  tmp <- knitr::fig_path('png', number = plot_counter())
  tmp <- structure(tmp,class = c('knit_image_paths',class(tmp)))
  
  in_base_dir({
    dir.create(dirname(tmp), showWarnings = FALSE, recursive = TRUE)
    file.copy(this,tmp)
  })
  
  x <- gsub(this,knitr::sew(tmp),x)
  
  knitr::asis_output(x)
  
}
