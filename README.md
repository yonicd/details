
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
Summary](https://img.shields.io/badge/covrpage-Last_Build_2021_01_13-yellowgreen.svg)](http://tinyurl.com/yyodcwc7)
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

-   R object with supported classes:
    -   `character`
    -   `data.frame`
    -   `tibble`
    -   `list`
    -   `device` (eg plots)
-   File paths will be identified internally and the lines will be read
    in automatically.

### Output

The function `details::details` can output the result to

-   console (default)
-   clipboard via [clipr](https://github.com/mdlincoln/clipr)
-   [file.editor](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/file.edit.html)
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
<summary>
<span title="Click to Expand"> current session info </span>
</summary>

``` r
─ Session info ────────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.6.3 (2020-02-29)
 os       macOS Catalina 10.15.7      
 system   x86_64, darwin15.6.0        
 ui       RStudio                     
 language (EN)                        
 collate  en_US.UTF-8                 
 ctype    en_US.UTF-8                 
 tz       America/New_York            
 date     2021-01-13                  

─ Packages ────────────────────────────────────────────────────────────────
 package     * version    date       lib source                          
 assertthat    0.2.1      2019-03-21 [1] CRAN (R 3.6.0)                  
 callr         3.5.1      2020-10-13 [1] CRAN (R 3.6.2)                  
 cli           2.2.0      2020-11-20 [1] CRAN (R 3.6.2)                  
 clipr         0.7.1      2020-10-08 [1] CRAN (R 3.6.2)                  
 covr        * 3.5.0      2020-03-06 [1] CRAN (R 3.6.0)                  
 covrpage      0.1        2020-12-12 [1] local                           
 crayon        1.3.4      2017-09-16 [1] CRAN (R 3.6.0)                  
 curl          4.3        2019-12-02 [1] CRAN (R 3.6.0)                  
 desc          1.2.0.9000 2020-09-28 [1] Github (r-lib/desc@c175259)     
 details     * 0.2.2      2021-01-14 [1] local                           
 diffobj       0.3.2      2020-10-05 [1] CRAN (R 3.6.2)                  
 digest        0.6.27     2020-10-24 [1] CRAN (R 3.6.2)                  
 ellipsis      0.3.1      2020-05-15 [1] CRAN (R 3.6.2)                  
 evaluate      0.14       2019-05-28 [1] CRAN (R 3.6.0)                  
 fansi         0.4.1      2020-01-08 [1] CRAN (R 3.6.0)                  
 fs            1.5.0      2020-07-31 [1] CRAN (R 3.6.2)                  
 git2r         0.27.1     2020-05-03 [1] CRAN (R 3.6.2)                  
 glue          1.4.2      2020-08-27 [1] CRAN (R 3.6.2)                  
 highr         0.8        2019-03-20 [1] CRAN (R 3.6.0)                  
 htmltools     0.5.0      2020-06-16 [1] CRAN (R 3.6.2)                  
 httr          1.4.2      2020-07-20 [1] CRAN (R 3.6.2)                  
 knitr       * 1.30       2020-09-22 [1] CRAN (R 3.6.2)                  
 lazyeval      0.2.2      2019-03-15 [1] CRAN (R 3.6.0)                  
 lifecycle     0.2.0      2020-03-06 [1] CRAN (R 3.6.0)                  
 magrittr    * 2.0.1      2020-11-17 [1] CRAN (R 3.6.2)                  
 MASS          7.3-51.5   2019-12-20 [1] CRAN (R 3.6.3)                  
 memoise       1.1.0      2017-04-21 [1] CRAN (R 3.6.0)                  
 pillar        1.4.7      2020-11-20 [1] CRAN (R 3.6.2)                  
 pkgconfig     2.0.3      2019-09-22 [1] CRAN (R 3.6.0)                  
 pkgdown       1.4.1      2019-09-15 [1] CRAN (R 3.6.0)                  
 png           0.1-7      2013-12-03 [1] CRAN (R 3.6.0)                  
 processx      3.4.5      2020-11-30 [1] CRAN (R 3.6.2)                  
 ps            1.5.0      2020-12-05 [1] CRAN (R 3.6.2)                  
 purrr         0.3.4      2020-04-17 [1] CRAN (R 3.6.2)                  
 R6            2.5.0      2020-10-28 [1] CRAN (R 3.6.2)                  
 rematch2      2.1.2      2020-05-01 [1] CRAN (R 3.6.2)                  
 remotes       2.2.0      2020-07-21 [1] CRAN (R 3.6.2)                  
 rex           1.1.2      2017-10-19 [1] CRAN (R 3.6.0)                  
 rlang         0.4.9      2020-11-26 [1] CRAN (R 3.6.2)                  
 rmarkdown     2.5        2020-10-21 [1] CRAN (R 3.6.3)                  
 rprojroot     2.0.2      2020-11-25 [1] Github (r-lib/rprojroot@5bafca9)
 rsconnect     0.8.16     2019-12-13 [1] CRAN (R 3.6.2)                  
 rstudioapi    0.13       2020-11-12 [1] CRAN (R 3.6.2)                  
 sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 3.6.0)                  
 stringi       1.5.3      2020-09-09 [1] CRAN (R 3.6.2)                  
 stringr       1.4.0      2019-02-10 [1] CRAN (R 3.6.0)                  
 testthat    * 3.0.0      2020-10-31 [1] CRAN (R 3.6.2)                  
 tibble        3.0.4      2020-10-12 [1] CRAN (R 3.6.2)                  
 vctrs         0.3.5      2020-11-17 [1] CRAN (R 3.6.2)                  
 waldo         0.2.3      2020-11-09 [1] CRAN (R 3.6.2)                  
 whisker       0.4        2019-08-28 [1] CRAN (R 3.6.1)                  
 withr         2.3.0      2020-09-22 [1] CRAN (R 3.6.2)                  
 xfun          0.19       2020-10-30 [1] CRAN (R 3.6.2)                  
 xml2          1.3.2      2020-04-23 [1] CRAN (R 3.6.2)                  
 yaml          2.2.1      2020-02-01 [1] CRAN (R 3.6.0)                  

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
<summary>
<span title="Click to Open"> current session info </span>
</summary>

``` r
─ Session info ────────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.6.3 (2020-02-29)
 os       macOS Catalina 10.15.7      
 system   x86_64, darwin15.6.0        
 ui       RStudio                     
 language (EN)                        
 collate  en_US.UTF-8                 
 ctype    en_US.UTF-8                 
 tz       America/New_York            
 date     2021-01-13                  

─ Packages ────────────────────────────────────────────────────────────────
 package     * version    date       lib source                          
 assertthat    0.2.1      2019-03-21 [1] CRAN (R 3.6.0)                  
 callr         3.5.1      2020-10-13 [1] CRAN (R 3.6.2)                  
 cli           2.2.0      2020-11-20 [1] CRAN (R 3.6.2)                  
 clipr         0.7.1      2020-10-08 [1] CRAN (R 3.6.2)                  
 covr        * 3.5.0      2020-03-06 [1] CRAN (R 3.6.0)                  
 covrpage      0.1        2020-12-12 [1] local                           
 crayon        1.3.4      2017-09-16 [1] CRAN (R 3.6.0)                  
 curl          4.3        2019-12-02 [1] CRAN (R 3.6.0)                  
 desc          1.2.0.9000 2020-09-28 [1] Github (r-lib/desc@c175259)     
 details     * 0.2.2      2021-01-14 [1] local                           
 diffobj       0.3.2      2020-10-05 [1] CRAN (R 3.6.2)                  
 digest        0.6.27     2020-10-24 [1] CRAN (R 3.6.2)                  
 ellipsis      0.3.1      2020-05-15 [1] CRAN (R 3.6.2)                  
 evaluate      0.14       2019-05-28 [1] CRAN (R 3.6.0)                  
 fansi         0.4.1      2020-01-08 [1] CRAN (R 3.6.0)                  
 fs            1.5.0      2020-07-31 [1] CRAN (R 3.6.2)                  
 git2r         0.27.1     2020-05-03 [1] CRAN (R 3.6.2)                  
 glue          1.4.2      2020-08-27 [1] CRAN (R 3.6.2)                  
 highr         0.8        2019-03-20 [1] CRAN (R 3.6.0)                  
 htmltools     0.5.0      2020-06-16 [1] CRAN (R 3.6.2)                  
 httr          1.4.2      2020-07-20 [1] CRAN (R 3.6.2)                  
 knitr       * 1.30       2020-09-22 [1] CRAN (R 3.6.2)                  
 lazyeval      0.2.2      2019-03-15 [1] CRAN (R 3.6.0)                  
 lifecycle     0.2.0      2020-03-06 [1] CRAN (R 3.6.0)                  
 magrittr    * 2.0.1      2020-11-17 [1] CRAN (R 3.6.2)                  
 MASS          7.3-51.5   2019-12-20 [1] CRAN (R 3.6.3)                  
 memoise       1.1.0      2017-04-21 [1] CRAN (R 3.6.0)                  
 pillar        1.4.7      2020-11-20 [1] CRAN (R 3.6.2)                  
 pkgconfig     2.0.3      2019-09-22 [1] CRAN (R 3.6.0)                  
 pkgdown       1.4.1      2019-09-15 [1] CRAN (R 3.6.0)                  
 png           0.1-7      2013-12-03 [1] CRAN (R 3.6.0)                  
 processx      3.4.5      2020-11-30 [1] CRAN (R 3.6.2)                  
 ps            1.5.0      2020-12-05 [1] CRAN (R 3.6.2)                  
 purrr         0.3.4      2020-04-17 [1] CRAN (R 3.6.2)                  
 R6            2.5.0      2020-10-28 [1] CRAN (R 3.6.2)                  
 rematch2      2.1.2      2020-05-01 [1] CRAN (R 3.6.2)                  
 remotes       2.2.0      2020-07-21 [1] CRAN (R 3.6.2)                  
 rex           1.1.2      2017-10-19 [1] CRAN (R 3.6.0)                  
 rlang         0.4.9      2020-11-26 [1] CRAN (R 3.6.2)                  
 rmarkdown     2.5        2020-10-21 [1] CRAN (R 3.6.3)                  
 rprojroot     2.0.2      2020-11-25 [1] Github (r-lib/rprojroot@5bafca9)
 rsconnect     0.8.16     2019-12-13 [1] CRAN (R 3.6.2)                  
 rstudioapi    0.13       2020-11-12 [1] CRAN (R 3.6.2)                  
 sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 3.6.0)                  
 stringi       1.5.3      2020-09-09 [1] CRAN (R 3.6.2)                  
 stringr       1.4.0      2019-02-10 [1] CRAN (R 3.6.0)                  
 testthat    * 3.0.0      2020-10-31 [1] CRAN (R 3.6.2)                  
 tibble        3.0.4      2020-10-12 [1] CRAN (R 3.6.2)                  
 vctrs         0.3.5      2020-11-17 [1] CRAN (R 3.6.2)                  
 waldo         0.2.3      2020-11-09 [1] CRAN (R 3.6.2)                  
 whisker       0.4        2019-08-28 [1] CRAN (R 3.6.1)                  
 withr         2.3.0      2020-09-22 [1] CRAN (R 3.6.2)                  
 xfun          0.19       2020-10-30 [1] CRAN (R 3.6.2)                  
 xml2          1.3.2      2020-04-23 [1] CRAN (R 3.6.2)                  
 yaml          2.2.1      2020-02-01 [1] CRAN (R 3.6.0)                  

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
<summary>
<span title="Click to Expand"> My plot </span>
</summary>

![](https://i.imgur.com/Zjkngkz.png)

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

-   Imports: details
-   RdMacros: details
-   Roxygen: list(markdown = TRUE)

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

-   Creating a sessioninfo to paste into Github, Stackoverflow or
    Community Sites.
-   Customizing the details output
-   What R objects details can handle
-   Using the details knitr chunk engine
-   Using details in Roxygen2

## Code of Conduct

Please note that the ‘details’ project is released with a [Contributor
Code of
Conduct](https://github.com/yonicd/details/blob/master/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
