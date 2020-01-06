#' @importFrom utils capture.output
capture.print <- function(obj,...){
  
  if(details_env$device){
    
    if(details_env$imgur)
      obj <- sprintf('![](%s)',imgur_upload(obj))
    
  }else{

    if(!inherits(obj,'character')){
      
      obj <- utils::capture.output(print(obj,...))  
      
    }
        
  }
  
  paste0(obj,collapse = '\n')
}

read_text <- function(text){

  if(!inherits(text,'character')||length(text)>1)
    return(text)
  
  if(!details_env$device){
    if(file.exists(text)){
      text <- readLines(text,warn = FALSE)
    }
  }
  
  text
}


