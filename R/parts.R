start_details <- function(state,summary){
  sprintf('<details %s>%s',state, summary)
}

end_details <- function(){
  paste('</details>','<br>',sep='\n')
}

body_details <- function(lang,text){
  
  if(!details_env$device){
    
    text <- sprintf('\n\n%s\n\n',text)
    
    if(is.null(lang)){
      message("NULL is being deprecated for this feature, please use 'none'")
      lang <- 'none'
    }
      
    if(!grepl('^none$',lang))
      text <- sprintf('```%s%s```',lang,text)
    
  }
    
  text
    
}
