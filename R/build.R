build_details <- function(text = '', summary = '', state = 'open', 
                          lang = 'r', output = 'console',...){
  
  structure(
    paste(
    start_details(state,summary),
    body_details(lang,capture.print(text,...)),
    end_details(),
    sep='\n\n'),
    class = sprintf('details_%s',output)
  )
  
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
