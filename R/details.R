#' @title create markdown details
#' @description Create details block for markdown with summary as optional.
#' @param text character, text to put in details block
#' @param summary character, text to put in summary block, Default: NULL
#' @param lang character, language of block (for markdown highlighting) Default: 'r'
#' @return character
#' @rdname details
#' @export 
details <- function(text,summary = NULL,lang = 'r'){
  
  if(!is.null(summary)){
    summary <- sprintf('\n<summary>%s</summary>',summary)
  }else{
    summary = ''
  }
  
  ret <- sprintf(
    '<details>%s\n\n```%s\n%s\n```\n\n</details><br>',
    summary,lang,paste0(text,collapse = '\n')
  )
  
  cat(ret)
}
