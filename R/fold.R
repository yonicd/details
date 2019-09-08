#' @title Roxygen2 Documentation Folding
#' @description Insert more information to function documentation 
#'  without overwhelming the user by using foldstart and foldend macros.
#' @param title Title of the folded section, Default: NULL
#' @return character
#' @details
#'  To enable this feature add to the  `DESCRIPTION` file 
#'  before rendering the `roxygen2`:
#'  
#'  \strong{Roxygen: list(markdown = TRUE)}
#'  
#' @examples 
#' 
#' # With title
#' 
#'  "#' \foldstart{This is an example}
#'  
#'   #' DOCUMENTATION
#'  
#'   #' \foldend"
#' 
#' 
#' # With no title
#' 
#'  "#' \foldstart{}
#'  
#'   #' DOCUMENTATION
#'  
#'   #' \foldend"
#'  
#' @rdname fold
#' @family fold
#' @export 

foldstart <- function(title = NULL){
  
  if(is.null(title)){
    
    ret <- "\\if{html}{\\out{<br><details>}}"
    
  }else{
    
    ret <- sprintf("\\if{html}{\\out{<br><details>%s}}",
                   summary_fold(title))
    
}

  ret
    
}

#' @rdname fold
#' @export 
foldend <- function(){
  '\\if{html}{\\out{</details>}}'
}

summary_fold <- function(txt= ''){
  sprintf("<summary> <span title='Click to Expand'> %s </span> </summary>",txt)
}



