#' @importFrom utils capture.output
#' @importFrom xfun upload_imgur
capture.print <- function(obj, comment = NA,...){
  
  if(details_env$device){
    
    if(details_env$imgur){
      imgur_res <- xfun::upload_imgur(obj, include_xml = TRUE)
      obj <- sprintf('![](%s)', imgur_res$link)
    }
    
  }else{

    if(!inherits(obj, 'character')){
      
      obj <- utils::capture.output(print(obj, ...))
      
    }
        
  }
  
  if(!is.na(comment))
    obj <- paste0(comment, ' ', obj)
  
  paste0(obj, collapse = '\n')
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


