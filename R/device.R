#' @importFrom withr with_png
#' @importFrom utils capture.output
device_check <- function(object,f_png = tempfile(fileext = ".png"), env){
  
  utils::capture.output(withr::with_png(f_png,print(object)))
  
  env$device <- is_not_blank_png(f_png)

  if(env$device){
    
    env$f_png <- f_png
    object    <- f_png
    
  }
  
  object
  
}

# augmented function from https://github.com/yihui/knitr/blob/a6cc50b09314ee0243b5d3223090fe4ecc9a13cd/R/utils-upload.R
#' @importFrom httr POST add_headers upload_file stop_for_status content
#' @importFrom xml2 as_list read_xml
#' @importFrom utils packageVersion
imgur_upload <- function (file, key = "9f3460e67f308f6",only_link = TRUE){
  
  check_internet('imgur.com')
  
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

is_not_na_png <- function(file){
  !is.na(file.size(file))
}

#' @importFrom png readPNG
is_not_blank_png <- function(file){
  
  ret <- is_not_na_png(file)
  
  if(ret){
    ret <- length(unique(unlist(as.list(png::readPNG(file)))))>1  
  }
  
  ret
  
}

#' @importFrom httr HEAD timeout
check_internet <- function(url = 'google.com'){
  if(inherits(try({
      httr::HEAD(url,httr::timeout(1))
    },silent = TRUE),'try-error'))
    stop('An internet connection was not found')
}