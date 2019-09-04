#' @importFrom utils capture.output
capture.print <- function(obj){
  
  if(!inherits(obj,'character')){
    
    obj <- utils::capture.output(print(obj))
    
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

