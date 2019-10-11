Tests and Coverage
================
10 October, 2019 22:24:53

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                        | Coverage (%) |
| :---------------------------- | :----------: |
| details                       |    78.30     |
| [R/print.R](../R/print.R)     |     5.26     |
| [R/device.R](../R/device.R)   |    88.24     |
| [R/read.R](../R/read.R)       |    88.89     |
| [R/build.R](../R/build.R)     |    100.00    |
| [R/details.R](../R/details.R) |    100.00    |
| [R/fold.R](../R/fold.R)       |    100.00    |
| [R/parts.R](../R/parts.R)     |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                        | n |  time | error | failed | skipped | warning |
| :------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| [test-basic.R](testthat/test-basic.R)       | 4 | 0.019 |     0 |      0 |       0 |       0 |
| [test-collapse.R](testthat/test-collapse.R) | 3 | 0.003 |     0 |      0 |       0 |       0 |
| [test-device.R](testthat/test-device.R)     | 3 | 1.077 |     0 |      0 |       0 |       0 |
| [test-utils.R](testthat/test-utils.R)       | 5 | 0.036 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                | context   | test                            | status | n |  time |
| :-------------------------------------------------- | :-------- | :------------------------------ | :----- | -: | ----: |
| [test-basic.R](testthat/test-basic.R#L6_L9)         | basic     | basic: empty                    | PASS   | 1 | 0.002 |
| [test-basic.R](testthat/test-basic.R#L13_L16)       | basic     | basic: object                   | PASS   | 1 | 0.011 |
| [test-basic.R](testthat/test-basic.R#L20_L23)       | basic     | basic: file                     | PASS   | 1 | 0.003 |
| [test-basic.R](testthat/test-basic.R#L27_L30)       | basic     | basic: no lang                  | PASS   | 1 | 0.003 |
| [test-collapse.R](testthat/test-collapse.R#L6_L9)   | fold      | fold methods: close             | PASS   | 1 | 0.001 |
| [test-collapse.R](testthat/test-collapse.R#L13_L16) | fold      | fold methods: open default      | PASS   | 1 | 0.001 |
| [test-collapse.R](testthat/test-collapse.R#L20_L23) | fold      | fold methods: open with summary | PASS   | 1 | 0.001 |
| [test-device.R](testthat/test-device.R#L16)         | device    | using device: device flag       | PASS   | 1 | 0.001 |
| [test-device.R](testthat/test-device.R#L20)         | device    | using device: device png        | PASS   | 1 | 0.001 |
| [test-device.R](testthat/test-device.R#L24)         | device    | using device: device upload     | PASS   | 1 | 1.075 |
| [test-utils.R](testthat/test-utils.R#L6_L9)         | utilities | utilities: tooltip default      | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L13_L16)       | utilities | utilities: tooltip with text    | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L21_L24)       | utilities | utilities: summary default      | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L28_L31)       | utilities | utilities: state open           | PASS   | 1 | 0.032 |
| [test-utils.R](testthat/test-utils.R#L35_L38)       | utilities | utilities: state closed         | PASS   | 1 | 0.001 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.6.1 (2019-07-05)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS Mojave 10.14.5                |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.2.1   |
| covr     | 3.3.0   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : pass --->
