#' @importFrom utils capture.output
capture.print <- function(obj){
  
  if(details_env$device){
    
    obj <- sprintf('![](%s)',imgur_upload(obj))
    
  }else{

    if(!inherits(obj,'character')){
      
      obj <- utils::capture.output(print(obj))  
      
    }
        
  }
  
  paste0(obj,collapse = '\n')
}

read_text <- function(text){
  
  if(length(text)==1 & !details_env$device){
    if(file.exists(text)){
      text <- readLines(text,warn = FALSE)
    }    
  }
  
  text
}
