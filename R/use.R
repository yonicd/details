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
#' - Imports: details
#' - RdMacros: details
#' - Roxygen: list(markdown = TRUE)
#' @seealso [details][details::details]
#' @export
use_details <- function(desc_path = './DESCRIPTION'){
  
  if(!file.exists(desc_path))
    stop('invalid path to DESCRIPTION file')
  
  set_details_imports(desc_path)
  set_details_macros(desc_path)
  set_details_roxy(desc_path)
  
  invisible()
}

#' @importFrom desc desc_has_fields desc_get_field desc_set
set_details_imports <- function(desc_path, pkg = 'details'){
  
  if(desc::desc_has_fields("Imports", file = desc_path)){
    
    imports <- desc::desc_get_field("Imports", file = desc_path)
    imports <- gsub('\\n|\\s+','',imports)
    imports <- strsplit(imports, ",")[[1]]
    
  }else{
    
    imports <- character()
    
  }
  
  if (!pkg %in% imports) {
    imports <- c(imports, pkg)
    imports <- paste0("    ", imports, collapse = ",\n")
    desc::desc_set(
      Imports = imports,
      file = desc_path, 
      normalize = TRUE)
  }
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
