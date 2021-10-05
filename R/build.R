#' @importFrom htmltools HTML
build_details <- function(text = '', summary = '', state = 'open', 
                          lang = 'r', output = 'console', comment = NA, ...){
  
  ret <- structure(
    paste(
    start_details(state,summary),
    body_details(lang,capture.print(text,comment,...)),
    end_details(),
    sep='\n\n'),
    file = details_env$f_png,
    class = sprintf('details_%s',output)
  )
  
  if(output=='html'){
    ret <- htmltools::HTML(ret)
  }
    
  ret
}

build_tooltip <- function(txt = '',tooltip = NULL){
  
  if(is.null(tooltip)){
    return(txt)
  }
  
  sprintf("<span title='%s'> %s </span>", tooltip, txt)
  
}

build_summary <- function(txt = NULL, tooltip = NULL){
  
  if(is.null(txt))
    return('')
  
  sprintf('\n<summary> %s </summary>',
          build_tooltip(txt,tooltip)
  )
  
}

build_state <- function(open){
  
  if(open){
    'open'
  }else{
    'closed'
  }
  
}
