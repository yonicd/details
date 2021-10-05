#' @title Create HTML DOM Details
#' 
#' @description Create HTML DOM Details block for Markdown documents
#'  with summary as optional.
#' 
#' @param object object, object to put in details block
#' @param \dots arguments to pass to print method of the object
#' @param summary character, text to put in summary block, Default: NULL
#' @param tooltip character, text for tooltip on the summary, 
#'   Default: 'Click to Expand'
#' @param open logical, is the details open (TRUE) or closed (FALSE), 
#'   Default: FALSE
#' @param lang character, language of block (for markdown highlighting) 
#'   Default: 'r'
#' @param output character, where to output the file console (Default), 
#'  clipboard or R file editor, 
#'  Default: c('console','clipr','file.edit','character')
#' @param imgur logical, upload device outputs to imgur, Default: TRUE
#' @param comment character, the prefix to be put before source code output, Default: NA 
#' @seealso [use_details][details::use_details]
#' @details 
#'   To remove summary or tooltip set them to NULL.
#'   If the object is a file path, it will automatically it's lines will be read 
#'   in internally.
#'
#'   If lang is 'none' then the output will not be wrapped in a code block and 
#'   will display the raw output (useful for HTML)
#'  
#'   When using details in knitr/rmarkdown documents there is no need to set
#'   the results to 'asis', there are already predefined print methods for these
#'   environments.
#'  
#'  \dots is passed to objects that do not invoke an image device. 
#'  
#' @return character
#' @examples 
#' 
#' #basic
#'  details::details('test')
#' 
#' #sessionInfo
#'  details::details(sessionInfo(), summary = 'sessionInfo')
#' 
#' #data.frame
#'  details::details(head(mtcars))
#' 
#' #plots
#' \donttest{
#'  details(
#'    plot(x = mtcars$mpg, y = mtcars$wt),
#'    summary = 'Plots')
#' }
#' 
#' #output options
#' 
#' #character
#'  details::details('test', output = 'character')
#' 
#' #clipboard
#' if(clipr::clipr_available()){
#' 
#'  details::details('test', output = 'clipr')
#' 
#'  clipr::read_clip()
#' 
#' }
#' 
#' #file.edit
#' \donttest{
#' 
#'  details::details('test', output = 'edit')
#'  
#' }
#' 
#' 
#' 
#' @rdname details
#' @importFrom clipr read_clip clipr_available
#' @export
details <- function(object, 
                    ...,
                    summary = NULL, 
                    tooltip = 'Click to Expand', 
                    open    = FALSE, 
                    lang    = 'r',
                    output  = c('console','clipr','edit','character','html'),
                    imgur = TRUE,
                    comment = NA
                    ){
  
  on.exit({
    
    if(details_env$imgur)
      unlink(details_env$f_png)
    
    details_env$device <- FALSE
    details_env$imgur <- TRUE
    },add = TRUE)

  details_env$imgur <- imgur
  
  object <- device_check(object,env = details_env)
  
  output <- match.arg(output,c('console','clipr','edit','character','html'))
  
  if(!details_env$imgur)
    output <- 'image'
  
  if(output=='html'){
    lang <- 'none'
  }
  
  build_details(text    = read_text(object), 
                summary = build_summary(summary,tooltip), 
                state   = build_state(open), 
                lang    = lang,
                output  = output,
                comment = comment,
                ...)
  
}
