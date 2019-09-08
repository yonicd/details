#' @title Create HTML DOM Details
#' 
#' @description Create HTLM DOM Details block for Markdown documents
#'  with summary as optional.
#' 
#' @param text character, text to put in details block
#' @param summary character, text to put in summary block, Default: NULL
#' @param tooltip character, text for tooltip on the summary, Default: 'Click to Expand'
#' @param open logical, is the details open (TRUE) or closed (FALSE), Default: FALSE
#' @param lang character, language of block (for markdown highlighting) Default: 'r'
#' @param output character, where to output the file console (Default), clipboard or R file editor,
#'  Default: c('console','clipr','file.edit','character')
#'
#' @details 
#'   To remove summary or tooltip set them to NULL.
#'   If the text is a file path, it will automatically it's lines will be read in internally.
#'
#' @return character
#' @rdname details
#' @export 
details <- function(text, 
                    summary = NULL, 
                    tooltip = 'Click to Expand', 
                    open    = FALSE, 
                    lang    = 'r',
                    output  = c('console','clipr','edit','character')){
  
  build_details(text    = read_text(text), 
                summary = build_summary(summary,tooltip), 
                state   = build_state(open), 
                lang    = lang,
                output  = match.arg(output,c('console','clipr','edit','character'))
               )
  
}
