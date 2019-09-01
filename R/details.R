#' @title create markdown details 
#' 
#' @description Create details block for markdown with summary as optional.
#' 
#' @param text character, text to put in details block
#' @param summary character, text to put in summary block, Default: NULL
#' @param tooltip character, text for tooltip on the summary, Default: 'Click to Expand'
#' @param open logical, is the details open (TRUE) or closed (FALSE), Default: FALSE
#' @param lang character, language of block (for markdown highlighting) Default: 'r'
#' @param output character, where to output the file console (Default), clipboard or R file editor,
#'  Default: c('console','clipr','file.edit')
#'
#' @details 
#'   To remove summary or tooltip set them to NULL.
#'   If the text is a file path, it will automatically it's lines will be read in internally.
#'
#' \foldstart{More Details}
#'  Here more information can be inserted without overwhelming the user. 
#'  
#'  To enable this
#'  feature add `Roxygen: list(markdown = TRUE)` to the DESCRIPTION file before rendering
#'  the roxygen2
#'  
#'  you can use this feature by wrapping documentation with the macros
#'  
#'  \code{\\foldstart{[SUMMARY TEXT]}}
#'  
#'  \code{#' DOCUMENTATION}
#'  
#'  \code{\\foldend}
#'  
#' \foldend
#' 
#'
#' @return character
#' @rdname details
#' @export 
#' @importFrom clipr write_clip
#' @importFrom utils file.edit
details <- function(text, summary = NULL, tooltip = 'Click to Expand', open = FALSE, lang = 'r',output = c('console','clipr','file.edit')){
  
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
  
  if(length(text)==1){
    if(file.exists(text)){
      text <- readLines(text)
    }    
  }

  
  ret <- sprintf(
    '<details %s>%s\n\n```%s\n%s\n```\n\n</details><br>',
    state, summary,lang,capture.print(text)
  )
  
  switch(match.arg(output,c('console','clipr','file.edit')),
         'console' = cat(ret),
         'clipr'   = clipr::write_clip(ret),
         'file.edit' = {
           tf <- tempfile(fileext = '.R')
           cat(ret,file = tf,sep = '\n')
           utils::file.edit(tf)
         }
         )
}

#' @importFrom utils capture.output
capture.print <- function(obj){
  if(!inherits(obj,'character')){
    obj <- utils::capture.output(print(obj))
  }
  paste0(obj,collapse = '\n')
}
