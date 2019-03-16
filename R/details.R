#' @title create markdown details
#' @description Create details block for markdown with summary as optional.
#' @param text character, text to put in details block
#' @param summary character, text to put in summary block, Default: NULL
#' @param tooltip character, text for tooltip on the summary, Default: 'Click to Expand'
#' @param open logical, is the details open (TRUE) or closed (FALSE), Default: FALSE
#' @param lang character, language of block (for markdown highlighting) Default: 'r'
#' @details To remove summary or tooltip set them to NULL
#' @return character
#' @rdname details
#' @export 
details <- function(text, summary = NULL, tooltip = 'Click to Expand', open = FALSE, lang = 'r'){
  
  if(!is.null(summary)){
    
    if(!is.null(tooltip)){
      
      summary <-  sprintf("<span title='%s'> %s </span>",tooltip, summary)
      
    }
    
    summary <- sprintf('\n<summary> %s </summary>',summary)

  }else{
    summary = ''
  }
  
  if(open){
    state = 'open'
  }else{
    state = 'closed'
  }
  
  ret <- sprintf(
    '<details %s>%s\n\n```%s\n%s\n```\n\n</details><br>',
    state, summary,lang,capture.print(text)
  )
  
  cat(ret)
}

#' @importFrom utils capture.output
capture.print <- function(obj){
  if(!inherits(obj,'character')){
    obj <- utils::capture.output(print(obj))
  }
  paste0(obj,collapse = '\n')
}