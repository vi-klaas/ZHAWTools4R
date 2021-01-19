Tests and Coverage
================
19 January, 2021 09:39:54

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                                                    | Coverage (%) |
|:--------------------------------------------------------------------------|:------------:|
| ZHAWTools4R                                                               |    14.18     |
| [R/functions\_io.R](../R/functions_io.R)                                  |     0.00     |
| [R/functions\_labeling.R](../R/functions_labeling.R)                      |     0.00     |
| [R/plots\_management\_functions.R](../R/plots_management_functions.R)     |     0.00     |
| [R/plots\_manipulation\_functions.R](../R/plots_manipulation_functions.R) |     0.00     |
| [R/plots\_zhaw\_theme.R](../R/plots_zhaw_theme.R)                         |     0.00     |
| [R/misc\_functions.R](../R/misc_functions.R)                              |     4.17     |
| [R/functions\_cleaning.R](../R/functions_cleaning.R)                      |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                            |   n |  time | error | failed | skipped | warning |
|:----------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test\_misc\_functions.R](testthat/test_misc_functions.R)       |   2 | 0.123 |     0 |      0 |       0 |       0 |
| [test\_normalize\_strings.R](testthat/test_normalize_strings.R) |   3 | 0.039 |     0 |      0 |       0 |       0 |
| [test\_relabel\_values.R](testthat/test_relabel_values.R)       |   1 | 0.008 |     0 |      0 |       0 |       0 |

<details closed>
<summary>
Show Detailed Test Results
</summary>

| file                                                                | context            | test                                           | status |   n |  time |
|:--------------------------------------------------------------------|:-------------------|:-----------------------------------------------|:-------|----:|------:|
| [test\_misc\_functions.R](testthat/test_misc_functions.R#L10)       | misc\_functions    | usage of %+% with two strings                  | PASS   |   1 | 0.118 |
| [test\_misc\_functions.R](testthat/test_misc_functions.R#L14)       | misc\_functions    | usage of %+% with string and vector of strings | PASS   |   1 | 0.005 |
| [test\_normalize\_strings.R](testthat/test_normalize_strings.R#L35) | normalize\_strings | prepare lookup vector                          | PASS   |   2 | 0.030 |
| [test\_normalize\_strings.R](testthat/test_normalize_strings.R#L67) | normalize\_strings | normalize strings                              | PASS   |   1 | 0.009 |
| [test\_relabel\_values.R](testthat/test_relabel_values.R#L29)       | relabel\_values    | relabel values                                 | PASS   |   1 | 0.008 |

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
