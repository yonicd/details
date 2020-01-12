`%n%` <- function (x, y){
  if (is.null(x)) y else x  
}

#' @importFrom utils getFromNamespace
#' @importFrom knitr fig_path engine_output
#' @importFrom grid grid.raster convertUnit unit
#' @importFrom png readPNG
eng_detail <- function (options) {
  
  type <- options$type %n% "details"
  options$type <- 'r'
  options$results <- 'asis'
  
  options$details.lang <- options$details.lang %n% 'r'
  options$details.summary <- options$details.summary %n% NULL
  options$details.open <- options$details.open %n% FALSE
  options$details.imgur <- options$details.imgur %n% FALSE
  
  if(!is.null(options$fig.dim)){
    options$fig.width <- options$fig.dim[1]
    options$fig.height <- options$fig.dim[2]
  }
  
  if(!is.null(options$fig.width)){
    options$fig.width <- grid::convertUnit(grid::unit(options$fig.width,units = 'in'),unitTo = 'npc')
  }
  
  if(!is.null(options$fig.height)){
    options$fig.height <- grid::convertUnit(grid::unit(options$fig.height,units = 'in'),unitTo = 'npc')
  }
  
  
  if(!'details.tooltip'%in%names(options))
    options$details.tooltip <- 'Click to Open'
  
  code <- details(eval(parse(text = options$code)),
                  lang = options$details.lang,
                  tooltip = options$details.tooltip,
                  summary = options$details.summary,
                  open = options$details.open,
                  imgur = options$details.imgur,
                  output = 'character')
  
  if(length(attr(code,'file'))>0){
    
    this <- attr(code,'file')
    
    wrap_path <- utils::getFromNamespace('wrap.knit_image_paths','knitr')
    plot_counter <- utils::getFromNamespace("plot_counter", "knitr")
    in_base_dir <- utils::getFromNamespace("in_base_dir", "knitr")
    
    tmp <- knitr::fig_path('png', number = plot_counter())
    
    if(!grepl('^-',tmp)){
      
    in_base_dir({
      dir.create(dirname(tmp), showWarnings = FALSE, recursive = TRUE)
      file.copy(this,tmp)
    })

    code <- gsub(this,wrap_path(tmp),code)
    
    }else{
      
      img <- png::readPNG(this,info = TRUE)
      grid::grid.raster(img, width = options$fig.width, height = options$fig.height)
      
    }
    
  }
    
  output_code <- paste0(code,collapse = '\n') 

  knitr::engine_output(options,code = options$code,out = output_code)

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
