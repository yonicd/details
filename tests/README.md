Tests and Coverage
================
27 March, 2022 19:41:11

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                        | Coverage (%) |
| :---------------------------- | :----------: |
| details                       |    60.26     |
| [R/engine.R](../R/engine.R)   |     0.00     |
| [R/print.R](../R/print.R)     |     3.03     |
| [R/parts.R](../R/parts.R)     |    80.00     |
| [R/read.R](../R/read.R)       |    85.71     |
| [R/device.R](../R/device.R)   |    88.24     |
| [R/details.R](../R/details.R) |    95.00     |
| [R/build.R](../R/build.R)     |    95.65     |
| [R/fold.R](../R/fold.R)       |    100.00    |
| [R/use.R](../R/use.R)         |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                        | n |  time | error | failed | skipped | warning |
| :------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| [test-basic.R](testthat/test-basic.R)       | 6 | 0.045 |     0 |      0 |       0 |       0 |
| [test-collapse.R](testthat/test-collapse.R) | 3 | 0.004 |     0 |      0 |       0 |       0 |
| [test-device.R](testthat/test-device.R)     | 5 | 0.678 |     0 |      0 |       0 |       0 |
| [test-use.R](testthat/test-use.R)           | 9 | 0.056 |     0 |      0 |       0 |       0 |
| [test-utils.R](testthat/test-utils.R)       | 5 | 0.006 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                | context     | test                            | status | n |  time |
| :-------------------------------------------------- | :---------- | :------------------------------ | :----- | -: | ----: |
| [test-basic.R](testthat/test-basic.R#L6_L9)         | basic       | basic: empty                    | PASS   | 1 | 0.014 |
| [test-basic.R](testthat/test-basic.R#L13_L16)       | basic       | basic: object                   | PASS   | 1 | 0.012 |
| [test-basic.R](testthat/test-basic.R#L20_L23)       | basic       | basic: dots                     | PASS   | 1 | 0.010 |
| [test-basic.R](testthat/test-basic.R#L27_L30)       | basic       | basic: file                     | PASS   | 1 | 0.003 |
| [test-basic.R](testthat/test-basic.R#L34_L37)       | basic       | basic: non file singleton       | PASS   | 1 | 0.003 |
| [test-basic.R](testthat/test-basic.R#L41_L44)       | basic       | basic: no lang                  | PASS   | 1 | 0.003 |
| [test-collapse.R](testthat/test-collapse.R#L6_L9)   | fold        | fold methods: close             | PASS   | 1 | 0.001 |
| [test-collapse.R](testthat/test-collapse.R#L13_L16) | fold        | fold methods: open default      | PASS   | 1 | 0.002 |
| [test-collapse.R](testthat/test-collapse.R#L20_L23) | fold        | fold methods: open with summary | PASS   | 1 | 0.001 |
| [test-device.R](testthat/test-device.R#L16)         | device      | using device: device flag       | PASS   | 1 | 0.088 |
| [test-device.R](testthat/test-device.R#L20)         | device      | using device: device png        | PASS   | 1 | 0.004 |
| [test-device.R](testthat/test-device.R#L26)         | device      | using device: device upload     | PASS   | 1 | 0.577 |
| [test-device.R](testthat/test-device.R#L43)         | device      | local device: image created     | PASS   | 1 | 0.005 |
| [test-device.R](testthat/test-device.R#L47)         | device      | local device: env flag reset    | PASS   | 1 | 0.004 |
| [test-use.R](testthat/test-use.R#L8_L10)            | use details | bad path: imports               | PASS   | 1 | 0.009 |
| [test-use.R](testthat/test-use.R#L20_L23)           | use details | default: imports                | PASS   | 1 | 0.006 |
| [test-use.R](testthat/test-use.R#L27_L30)           | use details | default: RdMacros               | PASS   | 1 | 0.006 |
| [test-use.R](testthat/test-use.R#L35_L38)           | use details | default: Roxygen                | PASS   | 1 | 0.005 |
| [test-use.R](testthat/test-use.R#L50_L53)           | use details | single fields: imports          | PASS   | 1 | 0.006 |
| [test-use.R](testthat/test-use.R#L61_L64)           | use details | single fields: RdMacros         | PASS   | 1 | 0.007 |
| [test-use.R](testthat/test-use.R#L72_L75)           | use details | single fields: Roxygen          | PASS   | 1 | 0.006 |
| [test-use.R](testthat/test-use.R#L83_L86)           | use details | single fields: Roxygen FALSE    | PASS   | 1 | 0.005 |
| [test-use.R](testthat/test-use.R#L102)              | use details | import: imports empty           | PASS   | 1 | 0.006 |
| [test-utils.R](testthat/test-utils.R#L6_L9)         | utilities   | utilities: tooltip default      | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L13_L16)       | utilities   | utilities: tooltip with text    | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L21_L24)       | utilities   | utilities: summary default      | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L28_L31)       | utilities   | utilities: state open           | PASS   | 1 | 0.002 |
| [test-utils.R](testthat/test-utils.R#L35_L38)       | utilities   | utilities: state closed         | PASS   | 1 | 0.001 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                             |                                                                                                                                                                                                                                                                 |
| :------- | :-------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.1.3 (2022-03-10)      |                                                                                                                                                                                                                                                                 |
| Platform | x86\_64-apple-darwin17.0 (64-bit) | <a href="https://github.com/yonicd/details/commit/ef3affd61c8dacc2795bc29fec8266d6046537ce/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | macOS Big Sur/Monterey 10.16      |                                                                                                                                                                                                                                                                 |
| Language | en\_US                            |                                                                                                                                                                                                                                                                 |
| Timezone | UTC                               |                                                                                                                                                                                                                                                                 |

| Package  | Version |
| :------- | :------ |
| testthat | 3.1.2   |
| covr     | 3.3.2   |
| covrpage | 0.1     |

</details>

<!--- Final Status : pass --->
