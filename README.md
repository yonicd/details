
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/yonicd/details.svg?branch=master)](https://travis-ci.org/yonicd/details)
[![Codecov test
coverage](https://codecov.io/gh/yonicd/details/branch/master/graph/badge.svg)](https://codecov.io/gh/yonicd/details?branch=master)
[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2019_09_03-brightgreen.svg)](http://tinyurl.com/yyodcwc7)
<!-- badges: end -->

# details

Simple function for creating a details block for markdown documents and
Roxygen2 documentation.

## Installation

``` r
remotes::install_github("yonicd/details")
```

## Roxygen2

Many times in documentation there is a lot to say, but you do not want
to overwhelm the user.

To solve this we can use folding blocks in the documentation (which are
then rendered into pkgdown website automatically)

To enable this feature add `Roxygen: list(markdown = TRUE)` to the
DESCRIPTION file before rendering the roxygen2

You can use this feature by wrapping documentation with the macros

    \foldstart{[SUMMARY TEXT]}
    
    #' DOCUMENTATION
    #' ...
    #' DOCUMENTATION
    
    \foldend

The `SUMMARY_TEXT` is optional, where the folded block will have a
header of
<svg style="height:0.8em;top:.04em;position:relative;" viewBox="0 0 192 512"><path d="M0 384.662V127.338c0-17.818 21.543-26.741 34.142-14.142l128.662 128.662c7.81 7.81 7.81 20.474 0 28.284L34.142 398.804C21.543 411.404 0 402.48 0 384.662z"/></svg>
**your text**.

The default will display
<svg style="height:0.8em;top:.04em;position:relative;" viewBox="0 0 192 512"><path d="M0 384.662V127.338c0-17.818 21.543-26.741 34.142-14.142l128.662 128.662c7.81 7.81 7.81 20.474 0 28.284L34.142 398.804C21.543 411.404 0 402.48 0 384.662z"/></svg>
**details**.

These folded blocks can be inserted anywhere in the documentation, eg
`@description`, `@param`, `@details`, `@return`, ….

## Markdown

The function `details::details` can output to result either to `console`
(default), `clipboard` (via clipr) or to the R `file.editor` pop up
(useful when clipr not available).

If the input is a file path then it will be identified internally and
the lines will be read in automatically.

For this document it makes most sense to use the default output
(`console`).

### Character

#### Basic

``` r
library(magrittr)

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
 date     2019-09-03                  

─ Packages ──────────────────────────────────────────────────────────────
 package     * version    date       lib
 assertthat    0.2.1      2019-03-21 [1]
 cli           1.1.0      2019-03-19 [1]
 crayon        1.3.4      2017-09-16 [1]
 digest        0.6.20     2019-07-04 [1]
 evaluate      0.14       2019-05-28 [1]
 fontawesome   0.1.0      2019-09-01 [1]
 htmltools     0.3.6.9004 2019-08-28 [1]
 knitr         1.23       2019-05-18 [1]
 magrittr    * 1.5        2014-11-22 [1]
 Rcpp          1.0.2      2019-07-25 [1]
 rlang         0.4.0      2019-06-25 [1]
 rmarkdown     1.14       2019-07-12 [1]
 sessioninfo   1.1.1      2018-11-05 [1]
 stringi       1.4.3      2019-03-12 [1]
 stringr       1.4.0      2019-02-10 [1]
 withr         2.1.2      2018-03-15 [1]
 xfun          0.8        2019-06-25 [1]
 yaml          2.2.0      2018-07-25 [1]
 source                              
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 Github (rstudio/fontawesome@ba97af5)
 Github (rstudio/htmltools@cb452a8)  
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      

[1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```

</details>

<br>

#### Open by default

``` r
sessioninfo::session_info()%>%
  details::details(summary = 'open session info',open = TRUE)
```

<details open>

<summary> <span title="Click to Expand"> open session info </span>
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
 date     2019-09-03                  

─ Packages ──────────────────────────────────────────────────────────────
 package     * version    date       lib
 assertthat    0.2.1      2019-03-21 [1]
 cli           1.1.0      2019-03-19 [1]
 clipr         0.7.0      2019-07-23 [1]
 crayon        1.3.4      2017-09-16 [1]
 details       0.0.7      2019-09-04 [1]
 digest        0.6.20     2019-07-04 [1]
 evaluate      0.14       2019-05-28 [1]
 fontawesome   0.1.0      2019-09-01 [1]
 htmltools     0.3.6.9004 2019-08-28 [1]
 knitr         1.23       2019-05-18 [1]
 magrittr    * 1.5        2014-11-22 [1]
 Rcpp          1.0.2      2019-07-25 [1]
 rlang         0.4.0      2019-06-25 [1]
 rmarkdown     1.14       2019-07-12 [1]
 sessioninfo   1.1.1      2018-11-05 [1]
 stringi       1.4.3      2019-03-12 [1]
 stringr       1.4.0      2019-02-10 [1]
 withr         2.1.2      2018-03-15 [1]
 xfun          0.8        2019-06-25 [1]
 yaml          2.2.0      2018-07-25 [1]
 source                              
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 local                               
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 Github (rstudio/fontawesome@ba97af5)
 Github (rstudio/htmltools@cb452a8)  
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      

[1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```

</details>

<br>

#### Custom tooltip

``` r
sessioninfo::session_info()%>%
  details::details(summary = 'session info with date tooltip ', tooltip = Sys.Date())
```

<details closed>

<summary> <span title="2019-09-03"> session info with date tooltip
</span>
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
 date     2019-09-03                  

─ Packages ──────────────────────────────────────────────────────────────
 package     * version    date       lib
 assertthat    0.2.1      2019-03-21 [1]
 cli           1.1.0      2019-03-19 [1]
 clipr         0.7.0      2019-07-23 [1]
 crayon        1.3.4      2017-09-16 [1]
 details       0.0.7      2019-09-04 [1]
 digest        0.6.20     2019-07-04 [1]
 evaluate      0.14       2019-05-28 [1]
 fontawesome   0.1.0      2019-09-01 [1]
 htmltools     0.3.6.9004 2019-08-28 [1]
 knitr         1.23       2019-05-18 [1]
 magrittr    * 1.5        2014-11-22 [1]
 Rcpp          1.0.2      2019-07-25 [1]
 rlang         0.4.0      2019-06-25 [1]
 rmarkdown     1.14       2019-07-12 [1]
 sessioninfo   1.1.1      2018-11-05 [1]
 stringi       1.4.3      2019-03-12 [1]
 stringr       1.4.0      2019-02-10 [1]
 withr         2.1.2      2018-03-15 [1]
 xfun          0.8        2019-06-25 [1]
 yaml          2.2.0      2018-07-25 [1]
 source                              
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 local                               
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 Github (rstudio/fontawesome@ba97af5)
 Github (rstudio/htmltools@cb452a8)  
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      
 CRAN (R 3.6.0)                      

[1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```

</details>

<br>

#### Highlight Language

``` r

readLines('https://raw.githubusercontent.com/metrumresearchgroup/covrpage/master/_pkgdown.yml')%>%
  details::details(summary = 'yaml example',lang = 'yml')
```

<details closed>

<summary> <span title="Click to Expand"> yaml example </span> </summary>

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

### data.frame/tibble

#### data.frame

``` r
 iris%>%
  details::details(summary = 'data.frame')
```

<details closed>

<summary> <span title="Click to Expand"> data.frame </span> </summary>

``` r
    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
1            5.1         3.5          1.4         0.2     setosa
2            4.9         3.0          1.4         0.2     setosa
3            4.7         3.2          1.3         0.2     setosa
4            4.6         3.1          1.5         0.2     setosa
5            5.0         3.6          1.4         0.2     setosa
6            5.4         3.9          1.7         0.4     setosa
7            4.6         3.4          1.4         0.3     setosa
8            5.0         3.4          1.5         0.2     setosa
9            4.4         2.9          1.4         0.2     setosa
10           4.9         3.1          1.5         0.1     setosa
11           5.4         3.7          1.5         0.2     setosa
12           4.8         3.4          1.6         0.2     setosa
13           4.8         3.0          1.4         0.1     setosa
14           4.3         3.0          1.1         0.1     setosa
15           5.8         4.0          1.2         0.2     setosa
16           5.7         4.4          1.5         0.4     setosa
17           5.4         3.9          1.3         0.4     setosa
18           5.1         3.5          1.4         0.3     setosa
19           5.7         3.8          1.7         0.3     setosa
20           5.1         3.8          1.5         0.3     setosa
21           5.4         3.4          1.7         0.2     setosa
22           5.1         3.7          1.5         0.4     setosa
23           4.6         3.6          1.0         0.2     setosa
24           5.1         3.3          1.7         0.5     setosa
25           4.8         3.4          1.9         0.2     setosa
26           5.0         3.0          1.6         0.2     setosa
27           5.0         3.4          1.6         0.4     setosa
28           5.2         3.5          1.5         0.2     setosa
29           5.2         3.4          1.4         0.2     setosa
30           4.7         3.2          1.6         0.2     setosa
31           4.8         3.1          1.6         0.2     setosa
32           5.4         3.4          1.5         0.4     setosa
33           5.2         4.1          1.5         0.1     setosa
34           5.5         4.2          1.4         0.2     setosa
35           4.9         3.1          1.5         0.2     setosa
36           5.0         3.2          1.2         0.2     setosa
37           5.5         3.5          1.3         0.2     setosa
38           4.9         3.6          1.4         0.1     setosa
39           4.4         3.0          1.3         0.2     setosa
40           5.1         3.4          1.5         0.2     setosa
41           5.0         3.5          1.3         0.3     setosa
42           4.5         2.3          1.3         0.3     setosa
43           4.4         3.2          1.3         0.2     setosa
44           5.0         3.5          1.6         0.6     setosa
45           5.1         3.8          1.9         0.4     setosa
46           4.8         3.0          1.4         0.3     setosa
47           5.1         3.8          1.6         0.2     setosa
48           4.6         3.2          1.4         0.2     setosa
49           5.3         3.7          1.5         0.2     setosa
50           5.0         3.3          1.4         0.2     setosa
51           7.0         3.2          4.7         1.4 versicolor
52           6.4         3.2          4.5         1.5 versicolor
53           6.9         3.1          4.9         1.5 versicolor
54           5.5         2.3          4.0         1.3 versicolor
55           6.5         2.8          4.6         1.5 versicolor
56           5.7         2.8          4.5         1.3 versicolor
57           6.3         3.3          4.7         1.6 versicolor
58           4.9         2.4          3.3         1.0 versicolor
59           6.6         2.9          4.6         1.3 versicolor
60           5.2         2.7          3.9         1.4 versicolor
61           5.0         2.0          3.5         1.0 versicolor
62           5.9         3.0          4.2         1.5 versicolor
63           6.0         2.2          4.0         1.0 versicolor
64           6.1         2.9          4.7         1.4 versicolor
65           5.6         2.9          3.6         1.3 versicolor
66           6.7         3.1          4.4         1.4 versicolor
67           5.6         3.0          4.5         1.5 versicolor
68           5.8         2.7          4.1         1.0 versicolor
69           6.2         2.2          4.5         1.5 versicolor
70           5.6         2.5          3.9         1.1 versicolor
71           5.9         3.2          4.8         1.8 versicolor
72           6.1         2.8          4.0         1.3 versicolor
73           6.3         2.5          4.9         1.5 versicolor
74           6.1         2.8          4.7         1.2 versicolor
75           6.4         2.9          4.3         1.3 versicolor
76           6.6         3.0          4.4         1.4 versicolor
77           6.8         2.8          4.8         1.4 versicolor
78           6.7         3.0          5.0         1.7 versicolor
79           6.0         2.9          4.5         1.5 versicolor
80           5.7         2.6          3.5         1.0 versicolor
81           5.5         2.4          3.8         1.1 versicolor
82           5.5         2.4          3.7         1.0 versicolor
83           5.8         2.7          3.9         1.2 versicolor
84           6.0         2.7          5.1         1.6 versicolor
85           5.4         3.0          4.5         1.5 versicolor
86           6.0         3.4          4.5         1.6 versicolor
87           6.7         3.1          4.7         1.5 versicolor
88           6.3         2.3          4.4         1.3 versicolor
89           5.6         3.0          4.1         1.3 versicolor
90           5.5         2.5          4.0         1.3 versicolor
91           5.5         2.6          4.4         1.2 versicolor
92           6.1         3.0          4.6         1.4 versicolor
93           5.8         2.6          4.0         1.2 versicolor
94           5.0         2.3          3.3         1.0 versicolor
95           5.6         2.7          4.2         1.3 versicolor
96           5.7         3.0          4.2         1.2 versicolor
97           5.7         2.9          4.2         1.3 versicolor
98           6.2         2.9          4.3         1.3 versicolor
99           5.1         2.5          3.0         1.1 versicolor
100          5.7         2.8          4.1         1.3 versicolor
101          6.3         3.3          6.0         2.5  virginica
102          5.8         2.7          5.1         1.9  virginica
103          7.1         3.0          5.9         2.1  virginica
104          6.3         2.9          5.6         1.8  virginica
105          6.5         3.0          5.8         2.2  virginica
106          7.6         3.0          6.6         2.1  virginica
107          4.9         2.5          4.5         1.7  virginica
108          7.3         2.9          6.3         1.8  virginica
109          6.7         2.5          5.8         1.8  virginica
110          7.2         3.6          6.1         2.5  virginica
111          6.5         3.2          5.1         2.0  virginica
112          6.4         2.7          5.3         1.9  virginica
113          6.8         3.0          5.5         2.1  virginica
114          5.7         2.5          5.0         2.0  virginica
115          5.8         2.8          5.1         2.4  virginica
116          6.4         3.2          5.3         2.3  virginica
117          6.5         3.0          5.5         1.8  virginica
118          7.7         3.8          6.7         2.2  virginica
119          7.7         2.6          6.9         2.3  virginica
120          6.0         2.2          5.0         1.5  virginica
121          6.9         3.2          5.7         2.3  virginica
122          5.6         2.8          4.9         2.0  virginica
123          7.7         2.8          6.7         2.0  virginica
124          6.3         2.7          4.9         1.8  virginica
125          6.7         3.3          5.7         2.1  virginica
126          7.2         3.2          6.0         1.8  virginica
127          6.2         2.8          4.8         1.8  virginica
128          6.1         3.0          4.9         1.8  virginica
129          6.4         2.8          5.6         2.1  virginica
130          7.2         3.0          5.8         1.6  virginica
131          7.4         2.8          6.1         1.9  virginica
132          7.9         3.8          6.4         2.0  virginica
133          6.4         2.8          5.6         2.2  virginica
134          6.3         2.8          5.1         1.5  virginica
135          6.1         2.6          5.6         1.4  virginica
136          7.7         3.0          6.1         2.3  virginica
137          6.3         3.4          5.6         2.4  virginica
138          6.4         3.1          5.5         1.8  virginica
139          6.0         3.0          4.8         1.8  virginica
140          6.9         3.1          5.4         2.1  virginica
141          6.7         3.1          5.6         2.4  virginica
142          6.9         3.1          5.1         2.3  virginica
143          5.8         2.7          5.1         1.9  virginica
144          6.8         3.2          5.9         2.3  virginica
145          6.7         3.3          5.7         2.5  virginica
146          6.7         3.0          5.2         2.3  virginica
147          6.3         2.5          5.0         1.9  virginica
148          6.5         3.0          5.2         2.0  virginica
149          6.2         3.4          5.4         2.3  virginica
150          5.9         3.0          5.1         1.8  virginica
```

</details>

<br>

#### tibble

``` r
 iris%>%
  tibble::as_tibble()%>%
  details::details(summary = 'tibble')
```

<details closed>

<summary> <span title="Click to Expand"> tibble </span> </summary>

``` r
# A tibble: 150 x 5
   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
          <dbl>       <dbl>        <dbl>       <dbl> <fct>  
 1          5.1         3.5          1.4         0.2 setosa 
 2          4.9         3            1.4         0.2 setosa 
 3          4.7         3.2          1.3         0.2 setosa 
 4          4.6         3.1          1.5         0.2 setosa 
 5          5           3.6          1.4         0.2 setosa 
 6          5.4         3.9          1.7         0.4 setosa 
 7          4.6         3.4          1.4         0.3 setosa 
 8          5           3.4          1.5         0.2 setosa 
 9          4.4         2.9          1.4         0.2 setosa 
10          4.9         3.1          1.5         0.1 setosa 
# … with 140 more rows
```

</details>

<br>

### lists

``` r
 list(a = 1,b = head(iris))%>%
  details::details(summary = 'list')
```

<details closed>

<summary> <span title="Click to Expand"> list </span> </summary>

``` r
$a
[1] 1

$b
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

</details>

<br>
