#' @title Use details macros
#' @description Call this to import the details Rd macro into your package.
#' 
#'   - The RdMacros field of the DESCRIPTION file is updated so you can use the 
#'   `\\foldstart{}` and `\\foldend{}` macro in your documentation.
#'
#' See the [Package Documentation](https://yonicd.github.io/details/articles/documentation.html) vignette of the details package.
#' @param desc_path character, path to description file to check/edit, Default = './DESCRIPTION'
#' @details 
#' This will append three elements to the DESCRIPTION file
#' 
#' - Suggests: details
#' - RdMacros: details
#' - Roxygen: list(markdown = TRUE)
#' @seealso [details][details::details]
#' @export
use_details <- function(desc_path = './DESCRIPTION'){
  
  if(!file.exists(desc_path))
    stop('invalid path to DESCRIPTION file')
  
  set_details_suggests(desc_path)
  set_details_macros(desc_path)
  set_details_roxy(desc_path)
  
  invisible()
}

#' @importFrom desc desc_has_dep desc_set_dep
set_details_suggests <- function(desc_path, pkg = 'details'){
  
  if(!desc::desc_has_dep(pkg, type = 'Imports', file = desc_path))
    desc::desc_set_dep(pkg, type = 'Suggests', file = desc_path)
  
}

#' @importFrom desc desc_has_fields desc_get_field desc_set
set_details_macros <- function(desc_path, pkg = 'details'){
  
  if (desc::desc_has_fields("RdMacros", file = desc_path)) {
    macros <- desc::desc_get_field("RdMacros", file = desc_path)
    macros <- strsplit(macros, ",")[[1]]
  }
  else {
    macros <- character()
  }
  
  if (!pkg %in% macros) {
    macros <- c(macros, pkg)
    macros <- paste0("    ", macros, collapse = ",\n")
    desc::desc_set(
      RdMacros = macros,
      file = desc_path, 
      normalize = TRUE)
  }
}

#' @importFrom desc desc_has_fields desc_get_field desc_set
set_details_roxy <- function(desc_path){
  
  if (desc::desc_has_fields("Roxygen", file = desc_path)) {
    roxymd <- desc::desc_get_field("Roxygen", file = desc_path)
    roxymd_list <- eval(parse(text = roxymd))
  }
  else {
    roxymd_list <- list()
  }
  
  if (!'markdown' %in% names(roxymd_list)) {
    roxymd_list$markdown <- TRUE
    roxymd_chr <- list2char(roxymd_list)
    
    desc::desc_set(
      Roxygen = roxymd_chr,
      file = desc_path, 
      normalize = TRUE)
    
  }else{
    
    if(!roxymd_list$markdown)
      roxymd_list$markdown <- TRUE
    
    roxymd_chr <- list2char(roxymd_list)
    
    desc::desc_set(
      Roxygen = roxymd_chr,
      file = desc_path, 
      normalize = TRUE)
    
  }
}

list2char <- function(x){
  inner <- paste0(sapply(names(x),function(id) sprintf('%s = %s',id,x[[id]])),collapse = ', ')
  sprintf('list(%s)',inner)
}
