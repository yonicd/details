#' @title Create HTML DOM Details
#' 
#' @description Create HTLM DOM Details block for Markdown documents
#'  with summary as optional.
#' 
#' @param object object, object to put in details block
#' @param summary character, text to put in summary block, Default: NULL
#' @param tooltip character, text for tooltip on the summary, Default: 'Click to Expand'
#' @param open logical, is the details open (TRUE) or closed (FALSE), Default: FALSE
#' @param lang character, language of block (for markdown highlighting) Default: 'r'
#' @param device logical, If TRUE then a device will be created internally to upload
#' the input into a png and invoke [upload_imgur][knitr::upload_imgur] to place a URL
#' link pointing the output.
#' @param output character, where to output the file console (Default), clipboard or R file editor,
#'  Default: c('console','clipr','file.edit','character')
#'
#' @details 
#'   To remove summary or tooltip set them to NULL.
#'   If the object is a file path, it will automatically it's lines will be read in internally.
#'
#' @return character
#' @rdname details
#' @export 
details <- function(object, 
                    summary = NULL, 
                    tooltip = 'Click to Expand', 
                    open    = FALSE, 
                    lang    = 'r',
                    device = FALSE,
                    output  = c('console','clipr','edit','character')){
  
  build_details(text    = read_text(object), 
                summary = build_summary(summary,tooltip), 
                state   = build_state(open), 
                lang    = lang,
                device  = device,
                output  = match.arg(output,c('console','clipr','edit','character'))
               )
  
}
