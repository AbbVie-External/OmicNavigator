# Contributing instructions

Thanks for your interest in contributing to OmicNavigator!

## Branches

Branch        | Purpose
------------- | -------------
main          | Main development (**default**)
feature-\<x\> | Implements feature \<x\>
bugfix-\<x\>  | Fixes bug \<x\>

## How to contribute

1. Fork the repository to your personal account

1. Clone your fork to your local machine

    ```
    git clone https://github.com/<fork>/OmicNavigator.git
    cd OmicNavigator
    ```

1. Create a new branch. We recommend prefixing the branch name with `feature-`
or `bugfix-` to help classify it, but don't worry about this too much.

    ```
    git checkout -b feature-<x>
    ```

1. Make your edits. See the section below on setting up your development
environment.

1. Add, commit, push, and open a Pull Request against the "main" branch.

    ```
    git push origin feature-<x>
    ```

## Updating NEWS.md

If your pull request affects the end user experience, please add a bullet to
`NEWS.md`. At minimum include a reference to your pull request. Additional
useful information is your GitHub account and any related Issues.

For example:

```
* Fix bug in `nameOfFunction()` that caused a problem with... (#12, #13, @username)
```

## Unit tests

The unit tests are in `inst/tinytest/`. They use the testing framework
[tinytest][]. Each test file more or less corresponds to a file in `R/`, e.g.
`testAdd.R` tests the functions in `R/add.R`. Unit tests are highly encouraged
but not required for pull requests.

[tinytest]: https://cran.r-project.org/package=tinytest

After you make your changes, you can run all the tests by running the following
in the R console:

```
tinytest::test_all()
```

For quicker feedback, you can run one specific test file. For example, if you
are making changes to the functions in `R/get.R`, you can run the corresponding
tests in `inst/tinytest/testGet.R` with:

```
tinytest::run_test_file("inst/tinytest/testGet.R")
```

If you'd like to write additional tests (highly encouraged!), try to follow the
style of the surrounding code. In general, the tests are structured like below:

```
observed <- functionName(
  arg1,
  arg2
)

expect_identical(
  observed,
  expected
)
```

Some additional testing tips:

* If re-installing the package is taking up too much time, you can quickly load
the latest versions of all the package functions into the R console by running
`devtools::load_all(".")` (or Ctrl-Shift-L in RStudio).

* If the messages returned by OmicNavigator functions are obscuring the test
output too much, you can wrap the tinytest function call with
`suppressMessages()`. This will suppress the messages from the OmicNavigator
functions but still display the test results.

## Setup your development environment

First install the development only packages:

```
install.packages(c("remotes", "roxygen2"))
```

Second install the required and suggested dependencies:

```
remotes::install_deps(dependencies = TRUE)
```

Third install LaTeX, Make, and Graphviz if you wish to re-build the
vignettes:

```
sudo apt-get install texlive texinfo make graphviz
```

If you’re on Windows or macOS, I recommend using the R package
[tinytex](https://cran.r-project.org/package=tinytex) to install the
minimal [TinyTex](https://yihui.org/tinytex/) distribution.

To install the app for local testing, the easiest method is to install it once
in the source directory, so that the app is always installed whenever you build
the package locally. You can do this by first loading the package with devtools
and then running `installApp()`, which will install the app to `inst/www/`:

```
devtools::load_all()
installApp()
```

## Run OmicNavigator with Docker

The repository includes a `Dockerfile` to install and run OmicNavigator. This is
convenient if you want to test changes you've made to the R package without
installing the dependencies on your local machine.

```
# Build the image
docker build -t omicnavigator .
# Run the image
docker run --name onapp -t -p 8004:8004 omicnavigator
```

Open the app in your browser at http://localhost:8004/ocpu/library/OmicNavigator/

When you're finished, stop and delete the container:

```
docker stop onapp
docker rm onapp
```

## Files and directories

* `R/` - R source code files
* `inst/tinytest/` - Test files
* `inst/www/` - Web app
* `scripts/` - Utility scripts for maintaining the package
