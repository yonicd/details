
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/details)](https://CRAN.R-project.org/package=details)
[![downloads](http://cranlogs.r-pkg.org/badges/details)](https://CRAN.R-project.org/package=details)
[![R-win build
status](https://github.com/yonicd/details/workflows/R-win/badge.svg)](https://github.com/yonicd/details)
[![R-mac build
status](https://github.com/yonicd/details/workflows/R-mac/badge.svg)](https://github.com/yonicd/details)
[![R-linux build
status](https://github.com/yonicd/details/workflows/R-linux/badge.svg)](https://github.com/yonicd/details)
[![Codecov test
coverage](https://codecov.io/gh/yonicd/details/branch/master/graph/badge.svg)](https://codecov.io/gh/yonicd/details?branch=master)
[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2020_01_11-yellowgreen.svg)](http://tinyurl.com/yyodcwc7)
<!-- badges: end -->

# details <img src="man/figures/logo.png" align="right" class="logo" style="height:150px;"/>

Suppose you’re opening an issue in GitHub and there’s a lot noisey logs
that may be useful or you want to add the `sessionInfo()` to the end of
the issue.

Rather than wrecking readability, wrapping it in a `<details>` tag is a
great solution

``` md
<details>
 <summary>Summary Goes Here</summary>
 ...this is hidden, collapsable content...
</details>
```

Doing this manually every time is a pain.

`details` is a package lets you create and customize details blocks for
[markdown](#markdown) documents and [Roxygen2](#package-documentation)
documentation within `R`.

![](https://github.com/yonicd/details/raw/media/input/details.gif)

## Installation

### CRAN

``` r
install.packages("details")
```

### Dev

``` r
remotes::install_github("yonicd/details")
```

## Markdown

### Input

The function `details::details` can handle inputs

  - R object with supported classes:
      - `character`
      - `data.frame`
      - `tibble`
      - `list`
      - `device` (eg plots)
  - File paths will be identified internally and the lines will be read
    in automatically.

### Output

The function `details::details` can output the result to

  - console (default)
  - clipboard via
    [clipr](https://github.com/mdlincoln/clipr)
  - [file.editor](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/file.edit.html)
    useful when clipr not available

### Examples

One the most popular uses for `details` is to paste the sessioninfo at
the bottom of a GitHub issue.

``` r
library(details)

sessioninfo::session_info()%>%
  details::details(summary = 'current session info')
```

<details closed>

<summary> <span title="Click to Expand"> current session info </span>
</summary>

``` r

─ Session info ──────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.6.1 (2019-07-05)
 os       macOS Mojave 10.14.5        
 system   x86_64, darwin15.6.0        
 ui       X11                         
 language (EN)                        
 collate  en_US.UTF-8                 
 ctype    en_US.UTF-8                 
 tz       America/New_York            
 date     2020-01-12                  

─ Packages ──────────────────────────────────────────────────────────────
 package     * version    date       lib source                         
 assertthat    0.2.1      2019-03-21 [1] CRAN (R 3.6.0)                 
 backports     1.1.5      2019-10-02 [1] CRAN (R 3.6.0)                 
 cli           2.0.0      2019-12-09 [1] CRAN (R 3.6.0)                 
 clipr         0.7.0      2019-07-23 [1] CRAN (R 3.6.0)                 
 crayon        1.3.4      2017-09-16 [1] CRAN (R 3.6.0)                 
 desc          1.2.0      2019-12-01 [1] Github (r-lib/desc@61205f6)    
 details     * 0.2.1      2020-01-12 [1] local                          
 digest        0.6.23     2019-11-23 [1] CRAN (R 3.6.0)                 
 evaluate      0.14       2019-05-28 [1] CRAN (R 3.6.0)                 
 fansi         0.4.0      2018-10-05 [1] CRAN (R 3.6.0)                 
 glue          1.3.1.9000 2020-01-07 [1] Github (tidyverse/glue@b9ffe6c)
 htmltools     0.4.0      2019-10-04 [1] CRAN (R 3.6.0)                 
 httr          1.4.1      2019-08-05 [1] CRAN (R 3.6.0)                 
 knitr         1.25       2019-09-18 [1] CRAN (R 3.6.0)                 
 magrittr      1.5        2014-11-22 [1] CRAN (R 3.6.0)                 
 png           0.1-7      2013-12-03 [1] CRAN (R 3.6.0)                 
 R6            2.4.1      2019-11-12 [1] CRAN (R 3.6.0)                 
 Rcpp          1.0.3      2019-11-08 [1] CRAN (R 3.6.1)                 
 rlang         0.4.2      2019-11-23 [1] CRAN (R 3.6.0)                 
 rmarkdown     2.0        2019-12-12 [1] CRAN (R 3.6.0)                 
 rprojroot     1.3-2      2018-01-03 [1] CRAN (R 3.6.0)                 
 sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 3.6.0)                 
 stringi       1.4.3      2019-03-12 [1] CRAN (R 3.6.0)                 
 stringr       1.4.0      2019-02-10 [1] CRAN (R 3.6.0)                 
 withr         2.1.2      2018-03-15 [1] CRAN (R 3.6.0)                 
 xfun          0.10       2019-10-01 [1] CRAN (R 3.6.0)                 
 xml2          1.2.2      2019-08-09 [1] CRAN (R 3.6.0)                 
 yaml          2.2.0      2018-07-25 [1] CRAN (R 3.6.0)                 

[1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```

</details>

<br>

You can also use the `knitr` chunk engine that is shipped with `details`
to created outputs in `Rmarkdown` documents.

```` markdown
```{details, echo = FALSE, details.summary = 'current session info'}
sessioninfo::session_info()
```
````

<details closed>

<summary> <span title="Click to Open"> current session info </span>
</summary>

``` r

─ Session info ──────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.6.1 (2019-07-05)
 os       macOS Mojave 10.14.5        
 system   x86_64, darwin15.6.0        
 ui       X11                         
 language (EN)                        
 collate  en_US.UTF-8                 
 ctype    en_US.UTF-8                 
 tz       America/New_York            
 date     2020-01-12                  

─ Packages ──────────────────────────────────────────────────────────────
 package     * version    date       lib source                         
 assertthat    0.2.1      2019-03-21 [1] CRAN (R 3.6.0)                 
 backports     1.1.5      2019-10-02 [1] CRAN (R 3.6.0)                 
 cli           2.0.0      2019-12-09 [1] CRAN (R 3.6.0)                 
 clipr         0.7.0      2019-07-23 [1] CRAN (R 3.6.0)                 
 crayon        1.3.4      2017-09-16 [1] CRAN (R 3.6.0)                 
 desc          1.2.0      2019-12-01 [1] Github (r-lib/desc@61205f6)    
 details     * 0.2.1      2020-01-12 [1] local                          
 digest        0.6.23     2019-11-23 [1] CRAN (R 3.6.0)                 
 evaluate      0.14       2019-05-28 [1] CRAN (R 3.6.0)                 
 fansi         0.4.0      2018-10-05 [1] CRAN (R 3.6.0)                 
 glue          1.3.1.9000 2020-01-07 [1] Github (tidyverse/glue@b9ffe6c)
 htmltools     0.4.0      2019-10-04 [1] CRAN (R 3.6.0)                 
 httr          1.4.1      2019-08-05 [1] CRAN (R 3.6.0)                 
 knitr         1.25       2019-09-18 [1] CRAN (R 3.6.0)                 
 magrittr      1.5        2014-11-22 [1] CRAN (R 3.6.0)                 
 png           0.1-7      2013-12-03 [1] CRAN (R 3.6.0)                 
 R6            2.4.1      2019-11-12 [1] CRAN (R 3.6.0)                 
 Rcpp          1.0.3      2019-11-08 [1] CRAN (R 3.6.1)                 
 rlang         0.4.2      2019-11-23 [1] CRAN (R 3.6.0)                 
 rmarkdown     2.0        2019-12-12 [1] CRAN (R 3.6.0)                 
 rprojroot     1.3-2      2018-01-03 [1] CRAN (R 3.6.0)                 
 sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 3.6.0)                 
 stringi       1.4.3      2019-03-12 [1] CRAN (R 3.6.0)                 
 stringr       1.4.0      2019-02-10 [1] CRAN (R 3.6.0)                 
 withr         2.1.2      2018-03-15 [1] CRAN (R 3.6.0)                 
 xfun          0.10       2019-10-01 [1] CRAN (R 3.6.0)                 
 xml2          1.2.2      2019-08-09 [1] CRAN (R 3.6.0)                 
 yaml          2.2.0      2018-07-25 [1] CRAN (R 3.6.0)                 

[1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```

</details>

<br>

There are a [number of
objects](https://yonicd.github.io/details/articles/objects.html) that
can be placed in a details block other than a character object. An
example of a object is a device output such as a plot

``` r
details(plot(x=mtcars$mpg,y=mtcars$wt), summary = 'My plot')
```

<details closed>

<summary> <span title="Click to Expand"> My plot </span> </summary>

![](https://i.imgur.com/QUmWvK3.png)

</details>

<br>

## Package Documentation

Many times in documentation there is a lot to say, but you do not want
to overwhelm the user.

To solve this we can use folding blocks in the documentation (which are
then rendered into pkgdown website automatically)

![](https://github.com/yonicd/details/raw/media/input/folding.gif)

### Setup

To make it easy to set up the DESCRIPTION file of your package so you
can use `details` macros run the following :

``` r
use_details('PATH_TO_DESCRIPTION_FILE')
```

This will append three elements to the DESCRIPTION file

  - Imports: details
  - RdMacros: details
  - Roxygen: list(markdown = TRUE)

### Usage

You can use this feature by wrapping documentation with the macros

    \foldstart{[SUMMARY TEXT]}
    
    #' DOCUMENTATION
    #' ...
    #' DOCUMENTATION
    
    \foldend

The `SUMMARY_TEXT` is optional, where the folded block will have a
header of
<svg style="height:0.8em;top:.04em;position:relative;" viewBox="0 0 192 512"><path d="M0 384.662V127.338c0-17.818 21.543-26.741 34.142-14.142l128.662 128.662c7.81 7.81 7.81 20.474 0 28.284L34.142 398.804C21.543 411.404 0 402.48 0 384.662z"/></svg>
**SUMMARY TEXT**.

The default will display
<svg style="height:0.8em;top:.04em;position:relative;" viewBox="0 0 192 512"><path d="M0 384.662V127.338c0-17.818 21.543-26.741 34.142-14.142l128.662 128.662c7.81 7.81 7.81 20.474 0 28.284L34.142 398.804C21.543 411.404 0 402.48 0 384.662z"/></svg>
**details**.

These folded blocks can be inserted anywhere in the documentation, eg
`@description`, `@param`, `@details`, `@return`, ….

## Vignettes

More information can be found in the
[articles](https://yonicd.github.io/details/) of the package site.

  - Creating a sessioninfo to paste into Github, Stackoverflow or
    Community Sites.
  - Customizing the details output
  - What R objects details can handle
  - Using the details knitr chunk engine
  - Using details in Roxygen2

## Code of Conduct

Please note that the ‘details’ project is released with a [Contributor
Code of
Conduct](https://github.com/yonicd/details/blob/master/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
