open_collapse <- function(summary_text = NULL){
  
  if(is.null(summary_text)){
    
    ret <- "\\if{html}{\\out{<br><details>}}"
    
  }else{
    
    ret <- sprintf("\\if{html}{\\out{<br><details>%s}}",summary_collapse(summary_text))
    
}

  ret
    
}

summary_collapse <- function(txt= ''){
  sprintf("<summary> <span title='Click to Expand'> %s </span> </summary>",txt)
}


close_collapse <- function(){
  '\\if{html}{\\out{</details>}}'
}
