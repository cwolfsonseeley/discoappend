
<!-- README.md is generated from README.Rmd. Please edit that file -->
Before getting started
----------------------

The `discoappend` package is intended for use with the `discoveryengine` package. It is recommended that you are familiar with `discoveryengine`, especially how to create a `discoveryengine` definition. More about `discoveryengine` - including how to get started with R - can be found in its [documentation](https://tarakc02.github.io/discodocs/).

For ease of workflow, it is recommended you are familiar with the piping function (`%>%`). A simple guide to this function can be found [here](http://uc-r.github.io/pipe).

Introduction to discoappend
---------------------------

The `discoappend` package allows you to output additional data columns (beyond just IDs) to `discoveryengine` definititons. This can be useful in a variety of situations, including:

-   sanity-check your work by previewing some basic data (like names, addresses, ratings, degrees, etc) about your definition
-   quickly output a report without having to wait out the 15-minute savedlist delay in CADS
-   so much more!

Installation
------------

You can install discoappend from github with:

``` r
devtools::install_github("cwolfsonseeley/discoappend")
```

Once installed, call the library by entering

``` r
library(discoappend)
```

into your console.

Chunks and how to use them
--------------------------

`discoappend` provides you with pre-defined report chunks that can be "appended" to your disco engine definition, resulting in reports that can be analyzed in R or exported to a spreadsheet. To explore the available chunks and the output of each, use the `show_chunks` function. Simply enter

``` r
show_chunks()
```

into your console, and an interactive table will pop up, allowing you to sort and search for the chunks you need.

Chunks can be used individually, piped together, or as arguments of the `append` function. For example, you can look at basic biographical data of your constituency by calling the `basic_bio` function:

``` r
basic_bio(constituency)
```

Or you could add employment data to the same constituency by piping:

``` r
basic_bio(constituency) %>%
  employment
```

Or you can use the `basic_bio` and `employment` chunks as your arguments for the `append` function:

``` r
append(constituency, basic_bio, employment)
```

Note that these last two examples will output the same data frame; they are just two ways of getting to the same result.

Remember that you will need to use the `display` function to view any of your output. You can do this by naming your output and then displaying it:

``` r
report = append(constituency, basic_bio, employment)
display(report)
```

Or by piping:

``` r
append(constituency, basic_bio, employment) %>%
  display
```

The `display` function that we're using should be familiar to disco engine users, and it does in fact work the same way. That means that you can easily household your report with the `household` argument or export to a file with the `file` argument.

Examples
--------

We won't be printing the output of the following, but once you've installed the package you can try out this code yourself to see how it works:

``` r
library(discoappend)

is_wealthy = has_capacity(1)
is_wealthy %>% 
  basic_bio %>% 
  display
```

That example outputs the `basic_bio` chunk, which, as the name suggests, includes basic biographical information such as names and addresses.

What makes `discoappend` so much fun, though, is that you can easily add on additional chunks as you need them:

``` r
is_wealthy %>%
  basic_bio %>%
  degrees %>%
  employment %>%
  giving %>%
  display
```

And here we household the report and export it to a file:

``` r
is_wealthy %>%
  basic_bio %>%
  degrees %>%
  employment %>%
  giving %>%
  display(household = TRUE, file = "wealthy-prospects-report")
```

Help make discoappend better
----------------------------

`discoappend` is a tool made by and for Prospect Development. If you see something that doesn’t work correctly, or documentation that could be made clearer, or a chunk that would be useful that isn’t implemented, or anything at all that could be improved, please submit an issue by clicking on the green “New Issue” button on the [`discoappend` issues page](https://github.com/cwolfsonseeley/discoappend/issues).
