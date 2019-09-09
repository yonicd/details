#' @importFrom utils capture.output
capture.print <- function(obj,device = FALSE){
  
  if(device){
    
    obj <- sprintf('![](%s)',imgur_upload(obj))
    
  }else{

    if(!inherits(obj,'character')){
      
      obj <- utils::capture.output(print(obj))  
      
    }
        
  }
  
  paste0(obj,collapse = '\n')
}

read_text <- function(text,device = FALSE){
  
  if(length(text)==1 & !device){
    if(file.exists(text)){
      text <- readLines(text,warn = FALSE)
    }    
  }
  
  text
}

#' @importFrom httr POST add_headers upload_file stop_for_status content
#' @importFrom xml2 as_list read_xml
#' @importFrom utils packageVersion
# augmented function from knitr::imgur_upload
imgur_upload <- function (file, key = "9f3460e67f308f6",only_link = TRUE){
  
  if (!is.character(key)) 
    stop("The Imgur API Key must be a character string!")
  
  resp <- httr::POST(
    "https://api.imgur.com/3/image.xml", 
    config = httr::add_headers(Authorization = paste("Client-ID", key)),
    body = list(image = httr::upload_file(file))
  )
  
  httr::stop_for_status(resp, "upload to imgur")
  
  res <- httr::content(resp, as = "raw")
  
  res <- if (length(res)) 
    xml2::as_list(xml2::read_xml(res))
  
  if (utils::packageVersion("xml2") >= "1.2.0") 
    res <- res[[1L]]
  
  if (is.null(res$link[[1]])) 
    stop("failed to upload ", file)
  
  if(only_link){
    
    res$link[[1]]
    
  }else{
    
    structure(res$link[[1]], XML = res)  
    
  }
  
}
