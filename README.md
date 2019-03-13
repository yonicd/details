
<!-- README.md is generated from README.Rmd. Please edit that file -->

# details

Make a simple function for creating a details section in markdown.

## Installation

``` r
remotes::install_github("yonicd/details")
```

## Example

## Basic

``` r
library(magrittr)

sessioninfo::session_info()%>%
  details::details(summary = 'current session info',lang = 'r')
```

<details closed>

<summary>current session
info</summary>

``` r
─ Session info ──────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.5.1 (2018-07-02)
 os       macOS  10.14.3              
 system   x86_64, darwin15.6.0        
 ui       X11                         
 language (EN)                        
 collate  en_US.UTF-8                 
 ctype    en_US.UTF-8                 
 tz       America/New_York            
 date     2019-03-13                  

─ Packages ──────────────────────────────────────────────────────────────
 package     * version date       lib source                            
 assertthat    0.2.0   2017-04-11 [1] CRAN (R 3.5.0)                    
 cli           1.0.1   2018-09-25 [1] CRAN (R 3.5.0)                    
 crayon        1.3.4   2017-09-16 [1] CRAN (R 3.5.0)                    
 digest        0.6.18  2018-10-10 [1] CRAN (R 3.5.0)                    
 evaluate      0.13    2019-02-12 [1] CRAN (R 3.5.2)                    
 htmltools     0.3.6   2017-04-28 [1] CRAN (R 3.5.0)                    
 knitr         1.21    2018-12-10 [1] CRAN (R 3.5.1)                    
 magrittr    * 1.5     2014-11-22 [1] CRAN (R 3.5.0)                    
 Rcpp          1.0.0   2018-11-07 [1] CRAN (R 3.5.0)                    
 rmarkdown     1.11.6  2019-02-21 [1] Github (rstudio/rmarkdown@bbd0786)
 sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.5.0)                    
 stringi       1.4.3   2019-03-12 [1] CRAN (R 3.5.1)                    
 stringr       1.4.0   2019-02-10 [1] CRAN (R 3.5.2)                    
 withr         2.1.2   2018-03-15 [1] CRAN (R 3.5.0)                    
 xfun          0.5     2019-02-20 [1] CRAN (R 3.5.1)                    
 yaml          2.2.0   2018-07-25 [1] CRAN (R 3.5.0)                    

[1] /Users/yonis/Library/R/3.5/library
[2] /Library/Frameworks/R.framework/Versions/3.5/Resources/library
```

</details>

<br>

## Open by default

``` r
sessioninfo::session_info()%>%
  details::details(summary = 'open session info',open = TRUE,lang = 'r')
```

<details open>

<summary>open session
info</summary>

``` r
─ Session info ──────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.5.1 (2018-07-02)
 os       macOS  10.14.3              
 system   x86_64, darwin15.6.0        
 ui       X11                         
 language (EN)                        
 collate  en_US.UTF-8                 
 ctype    en_US.UTF-8                 
 tz       America/New_York            
 date     2019-03-13                  

─ Packages ──────────────────────────────────────────────────────────────
 package     * version date       lib source                            
 assertthat    0.2.0   2017-04-11 [1] CRAN (R 3.5.0)                    
 cli           1.0.1   2018-09-25 [1] CRAN (R 3.5.0)                    
 crayon        1.3.4   2017-09-16 [1] CRAN (R 3.5.0)                    
 details       0.0.1   2019-03-13 [1] local                             
 digest        0.6.18  2018-10-10 [1] CRAN (R 3.5.0)                    
 evaluate      0.13    2019-02-12 [1] CRAN (R 3.5.2)                    
 htmltools     0.3.6   2017-04-28 [1] CRAN (R 3.5.0)                    
 knitr         1.21    2018-12-10 [1] CRAN (R 3.5.1)                    
 magrittr    * 1.5     2014-11-22 [1] CRAN (R 3.5.0)                    
 Rcpp          1.0.0   2018-11-07 [1] CRAN (R 3.5.0)                    
 rmarkdown     1.11.6  2019-02-21 [1] Github (rstudio/rmarkdown@bbd0786)
 sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.5.0)                    
 stringi       1.4.3   2019-03-12 [1] CRAN (R 3.5.1)                    
 stringr       1.4.0   2019-02-10 [1] CRAN (R 3.5.2)                    
 withr         2.1.2   2018-03-15 [1] CRAN (R 3.5.0)                    
 xfun          0.5     2019-02-20 [1] CRAN (R 3.5.1)                    
 yaml          2.2.0   2018-07-25 [1] CRAN (R 3.5.0)                    

[1] /Users/yonis/Library/R/3.5/library
[2] /Library/Frameworks/R.framework/Versions/3.5/Resources/library
```

</details>

<br>

## Highlight Language

``` r

readLines('https://raw.githubusercontent.com/metrumresearchgroup/covrpage/master/_pkgdown.yml')%>%
  details::details(summary = 'yaml example',lang = 'yml')
```

<details closed>

<summary>yaml example</summary>

``` yml
title: covrpage

development:
  mode: auto

navbar:
  structure:
    left:  [home, reference, articleindex, news]
    right: [github, twitter]
  components:
    articles: ~
    articleindex:
      text: Articles
      href: articles/index.html
    twitter:
      icon: fa-lg fa-twitter
      href: http://twitter.com/MetrumRG

hexURL:
  https://github.com/metrumresearchgroup/covrpage/blob/master/inst/logo/covrpageLogoSCREEN.png?raw=true

reference:
  - title: "Setup"
    contents:
      - has_concept("setup")
  - title: "Invoking"
    contents:
      - has_concept("invoke")
  - title: "Covrpage Trends"
    contents:
      - has_concept("log")
  - title: "Covrpage Utilities"
    contents:
      - has_concept("utility")

articles:
  - title: "Basics"
    contents:
      - get-started
      - how-to-read-covrpage-report
  - title: "Advanced"
    contents:
      - Continuous_Integration
      - Test_Results
      - snapshots
  - title: "The Output"
    contents: 
      - tests_and_coverage      
```

</details>

<br>
