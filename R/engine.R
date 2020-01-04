`%n%` <- function (x, y){
  if (is.null(x)) y else x  
}

eng_detail <- function (options) {
  type <- options$type %n% "details"
  options$type <- 'r'
  
  options$details.lang <- options$details.lang %n% 'r'
  options$details.summary <- options$details.summary %n% NULL
  options$details.open <- options$details.open %n% FALSE
  
  if(!'details.tooltip'%in%names(options))
    options$details.tooltip <- 'Click to Open'
  
  code <- details::details(eval(parse(text = options$code)),
                           lang = options$details.lang,
                           tooltip = options$details.tooltip,
                           summary = options$details.summary,
                           open = options$details.open,
                           output = 'character')
  if(options$echo){
    echo_code <- sprintf('```r\n%s\n```',paste0(options$code,collapse = '\n'))
    options$code <- paste0(c(echo_code,code),collapse = '\n')
  }else{
    options$code <- paste0(code,collapse = '\n')  
    options$echo <- TRUE
  }
  
  get('eng_asis',envir = asNamespace('knitr'))(options)
}

#' @importFrom stats setNames
register_eng_detail = function(envs, engine) {
  knitr::knit_engines$set(stats::setNames(lapply(envs, function(env) {
    function(options) {
      options$type = env
      engine(options)
    }
  }), envs))
}

.onLoad = function(lib, pkg) {
  register_eng_detail('details', eng_detail)
}
