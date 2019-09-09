#' @importFrom utils capture.output
capture.print <- function(obj,device = FALSE){
  
  if(!inherits(obj,'character')){
    
    if(device){
      
      obj <- read_device(obj)
      
    }else{
      
      obj <- utils::capture.output(print(obj))  
      
    }
    
  }
  
  paste0(obj,collapse = '\n')
}

read_text <- function(text){
  
  if(length(text)==1){
    if(file.exists(text)){
      text <- readLines(text,warn = FALSE)
    }    
  }
  
  text
}

#' @importFrom grDevices png dev.off
read_device <- function(expr){
  
  f_png <- tempfile(fileext = ".png")
  on.exit(unlink(f_png),add = TRUE)
  
  grDevices::png(f_png)
  capture.output(print(eval(expr)))
  grDevices::dev.off()
  
  res <- knitr::imgur_upload(f_png)
  
  sprintf('![](%s)',attr(res, "XML")[['link']][[1]])
}
