details chunk engine
================

``` r
library(details)
```

## details chunks

### echo = TRUE & details closed

``` r
x <- 1
x * 2
```

<details closed>

<summary> click to see eval </summary>

``` r

[1] 2
```

</details>

<br>

### echo = TRUE & details open

``` r
x <- 1
x * 2
```

<details open>

<summary> click to hide eval </summary>

``` r

[1] 2
```

</details>

<br>

### echo = FALSE & details open

<details closed>

<summary> open to see eval </summary>

``` r

[1] 2
```

</details>

<br>

### file contents with no highlighting

<details closed>

<summary> open to see contents </summary>

``` 

Package: details
Title: Create Details HTML Tag for Markdown and Package
    Documentation
Version: 0.1.3
Authors@R: 
    person(given = "Jonathan",
           family = "Sidi",
           role = c("aut", "cre"),
           email = "yonicd@gmail.com")
Description: Create a details HTML tag around R objects to place
    in a Markdown, 'Rmarkdown' and 'roxygen2' documentation.
License: MIT + file LICENSE
URL: https://github.com/yonicd/details
BugReports: https://github.com/yonicd/details/issues
Depends: 
    R (>= 3.2.0)
Imports: 
    clipr,
    desc,
    httr,
    knitr,
    magrittr,
    png,
    utils,
    withr,
    xml2
Suggests:
    covr,
    rmarkdown,
    sessioninfo,
    testthat,
    tibble
VignetteBuilder: 
    knitr
Encoding: UTF-8
LazyData: false
Roxygen: list(markdown = TRUE)
RoxygenNote: 6.1.1
```

</details>

<br>

## r chunk

``` r
x <- 1
x * 2
```

    ## [1] 2
