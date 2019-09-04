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
  
  clipr::write_clip(x,...)
  
}

#' @importFrom utils file.edit
#' @export
print.details_edit <- function(x,...){
  
  tf <- tempfile(fileext = '.R')
  
  cat(x,file = tf,sep = '\n')
  
  utils::file.edit(tf,...)
  
}
