Tests and Coverage
================
14 January, 2021 12:10:59

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                               | Coverage (%) |
|:-----------------------------------------------------|:------------:|
| ZHAWTools4R                                          |      90      |
| [R/functions\_io.R](../R/functions_io.R)             |      0       |
| [R/functions\_cleaning.R](../R/functions_cleaning.R) |     100      |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                            |   n |  time | error | failed | skipped | warning |
|:----------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test\_normalize\_strings.R](testthat/test_normalize_strings.R) |   3 | 0.149 |     0 |      0 |       0 |       0 |

<details closed>
<summary>
Show Detailed Test Results
</summary>

| file                                                                | context            | test                  | status |   n |  time |
|:--------------------------------------------------------------------|:-------------------|:----------------------|:-------|----:|------:|
| [test\_normalize\_strings.R](testthat/test_normalize_strings.R#L30) | normalize\_strings | prepare lookup vector | PASS   |   2 | 0.140 |
| [test\_normalize\_strings.R](testthat/test_normalize_strings.R#L62) | normalize\_strings | normalize strings     | PASS   |   1 | 0.009 |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                             |
|:---------|:----------------------------------|
| Version  | R version 4.0.2 (2020-06-22)      |
| Platform | x86\_64-apple-darwin17.0 (64-bit) |
| Running  | macOS Catalina 10.15.7            |
| Language | en\_US                            |
| Timezone | Europe/Zurich                     |

| Package  | Version |
|:---------|:--------|
| testthat | 3.0.1   |
| covr     | 3.5.1   |
| covrpage | 0.1     |

</details>
<!--- Final Status : pass --->
