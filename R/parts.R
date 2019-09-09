start_details <- function(state,summary){
  sprintf('<details %s>%s',state, summary)
}

end_details <- function(){
  paste('</details>','<br>',sep='\n')
}

body_details <- function(lang,text){
  
  if(!details_env$device){
    
    text <- sprintf('```%s\n\n%s\n\n```',lang,text)  
    
  }
    
  text
    
}
