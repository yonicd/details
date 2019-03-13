#' @title create markdown details
#' @description Create details block for markdown with summary as optional.
#' @param text character, text to put in details block
#' @param summary character, text to put in summary block, Default: NULL
#' @param open logical, is the details open (TRUE) or closed (FALSE), Default: FALSE
#' @param lang character, language of block (for markdown highlighting) Default: 'r'
#' @return character
#' @rdname details
#' @export 
details <- function(text, summary = NULL, open = FALSE, lang = 'r'){
  
  if(!is.null(summary)){
    summary <- sprintf('\n<summary>%s</summary>',summary)
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
    state, summary,lang,paste0(text,collapse = '\n')
  )
  
  cat(ret)
}
