
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
coverage](https://codecov.io/gh/yonicd/details/branch/master/graph/badge.svg)](https://app.codecov.io/gh/yonicd/details?branch=master)
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
- File paths will be identified internally and the lines will be read in
  automatically.

### Output

The function `details::details` can output the result to

- console (default)
- clipboard via [clipr](https://github.com/mdlincoln/clipr)
- [file.editor](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/file.edit.html)
  useful when clipr not available

### Examples

One the most popular uses for `details` is to paste the sessioninfo at
the bottom of a GitHub issue.

``` r
library(details)

sessioninfo::session_info()|>
  details::details(summary = 'current session info')
```

<details closed>

<summary>

<span title="Click to Expand"> current session info </span>
</summary>

``` r

─ Session info ───────────────────────────────────────────────────────────────
 setting  value
 version  R version 4.3.2 (2023-10-31 ucrt)
 os       Windows 11 x64 (build 22631)
 system   x86_64, mingw32
 ui       RTerm
 language (EN)
 collate  English_United States.utf8
 ctype    English_United States.utf8
 tz       America/New_York
 date     2025-02-01
 pandoc   3.6.2 @ C:/PROGRA~3/CHOCOL~1/bin/ (via rmarkdown)

─ Packages ───────────────────────────────────────────────────────────────────
 package     * version date (UTC) lib source
 cli           3.6.1   2023-03-23 [1] CRAN (R 4.3.2)
 clipr         0.8.0   2022-02-22 [1] CRAN (R 4.3.2)
 desc          1.4.2   2022-09-08 [1] CRAN (R 4.3.2)
 details     * 0.4.0   2025-02-01 [1] local
 digest        0.6.33  2023-07-07 [1] CRAN (R 4.3.2)
 evaluate      1.0.3   2025-01-10 [1] CRAN (R 4.3.3)
 fastmap       1.1.1   2023-02-24 [1] CRAN (R 4.3.2)
 htmltools     0.5.7   2023-11-03 [1] CRAN (R 4.3.2)
 httr          1.4.7   2023-08-15 [1] CRAN (R 4.3.2)
 knitr         1.45    2023-10-30 [1] CRAN (R 4.3.2)
 png           0.1-8   2022-11-29 [1] CRAN (R 4.3.1)
 R6            2.5.1   2021-08-19 [1] CRAN (R 4.3.2)
 rlang         1.1.2   2023-11-04 [1] CRAN (R 4.3.2)
 rmarkdown     2.29    2024-11-04 [1] CRAN (R 4.3.3)
 rprojroot     2.0.4   2023-11-05 [1] CRAN (R 4.3.2)
 rstudioapi    0.15.0  2023-07-07 [1] CRAN (R 4.3.2)
 sessioninfo   1.2.2   2021-12-06 [1] CRAN (R 4.3.3)
 withr         3.0.2   2024-10-28 [1] CRAN (R 4.3.3)
 xfun          0.50    2025-01-07 [1] CRAN (R 4.3.3)
 yaml          2.3.7   2023-01-23 [1] CRAN (R 4.3.2)

 [1] C:/Users/yoni/AppData/Local/R/win-library/4.3
 [2] C:/Program Files/R/R-4.3.2/library

──────────────────────────────────────────────────────────────────────────────
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

─ Session info ───────────────────────────────────────────────────────────────
 setting  value
 version  R version 4.3.2 (2023-10-31 ucrt)
 os       Windows 11 x64 (build 22631)
 system   x86_64, mingw32
 ui       RTerm
 language (EN)
 collate  English_United States.utf8
 ctype    English_United States.utf8
 tz       America/New_York
 date     2025-02-01
 pandoc   3.6.2 @ C:/PROGRA~3/CHOCOL~1/bin/ (via rmarkdown)

─ Packages ───────────────────────────────────────────────────────────────────
 package     * version date (UTC) lib source
 cli           3.6.1   2023-03-23 [1] CRAN (R 4.3.2)
 clipr         0.8.0   2022-02-22 [1] CRAN (R 4.3.2)
 desc          1.4.2   2022-09-08 [1] CRAN (R 4.3.2)
 details     * 0.4.0   2025-02-01 [1] local
 digest        0.6.33  2023-07-07 [1] CRAN (R 4.3.2)
 evaluate      1.0.3   2025-01-10 [1] CRAN (R 4.3.3)
 fastmap       1.1.1   2023-02-24 [1] CRAN (R 4.3.2)
 htmltools     0.5.7   2023-11-03 [1] CRAN (R 4.3.2)
 httr          1.4.7   2023-08-15 [1] CRAN (R 4.3.2)
 knitr         1.45    2023-10-30 [1] CRAN (R 4.3.2)
 png           0.1-8   2022-11-29 [1] CRAN (R 4.3.1)
 R6            2.5.1   2021-08-19 [1] CRAN (R 4.3.2)
 rlang         1.1.2   2023-11-04 [1] CRAN (R 4.3.2)
 rmarkdown     2.29    2024-11-04 [1] CRAN (R 4.3.3)
 rprojroot     2.0.4   2023-11-05 [1] CRAN (R 4.3.2)
 rstudioapi    0.15.0  2023-07-07 [1] CRAN (R 4.3.2)
 sessioninfo   1.2.2   2021-12-06 [1] CRAN (R 4.3.3)
 withr         3.0.2   2024-10-28 [1] CRAN (R 4.3.3)
 xfun          0.50    2025-01-07 [1] CRAN (R 4.3.3)
 yaml          2.3.7   2023-01-23 [1] CRAN (R 4.3.2)

 [1] C:/Users/yoni/AppData/Local/R/win-library/4.3
 [2] C:/Program Files/R/R-4.3.2/library

──────────────────────────────────────────────────────────────────────────────
```

</details>

<br>

There are a [number of
objects](https://yonicd.github.io/details/articles/objects.html) that
can be placed in a details block other than a character object. An
example of a object is a device output such as a plot

``` r
details(plot(x=mtcars$mpg,y=mtcars$wt), summary = 'My plot',imgur = interactive())
```

<details>
<summary>My Plot</summary>
<img src="C:\projects\details\man\figuresunnamed-chunk-3-1.png" width="100%" />
<details>

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
