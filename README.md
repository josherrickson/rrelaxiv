# rrelaxiv: Access to RELAX-IV algorithm in R

Package website: [release](https://errickson.net/rrelaxiv/) | [development](https://errickson.net/rrelaxiv/dev)

# rrelaxiv <a href="http://errickson.net/rrelaxiv"><img src="man/figures/logo.png" align="right" height="139" /></a>

<!-- badges: start -->
[![R-build-check](https://github.com/josherrickson/rrelaxiv/workflows/R-build-check/badge.svg)](https://github.com/josherrickson/rrelaxiv/actions)
<!-- badges: end -->

The RELAX-IV minimum cost flow solver implementation in FORTRAN by Dimitri
P. Bertsekas and Paul Tseng is made accessible inside R.

# Interface

There are two functions for interfacing with the RELAX-IV solver. The first,
`RELAX_IV()`, is intended for most users and includes a simplified interface and
input sanitization. It's inputs are characteristics of the graph, and it returns
the flow across each edges.

For advanced usage, consider the `.RELAX_IV()` function. This features no input
sanitization and has a more complex interface. It's inputs are advanced
characteristics of the graph, and it returns a more complete set of results.

# Installing

This package is unlikely to ever appear on CRAN. Methods to install are below.

## Using **drat**

The [**drat**](https://eddelbuettel.github.io/drat/) package can be used to
install the package. On Windows/Mac systems this should install a binary
version, meaning FORTRAN is not required to be set up on your system. On *nix
based systems, it will only install from source and therefore requires gfortran
installed.

The following command will add this repo to your list of sources, so that it
interacts with `install.packages` and `update.packages`.

```
drat::addRepo("rrelaxiv", "https://errickson.net/rrelaxiv")
install.packages("rrelaxiv")
```

Unfortunately the `drat::addRepo` needs to be run each time you plan on
installing or updating. You may be better served adding the `drat::addRepo` line
to your [.Rprofile](https://www.roelpeters.be/what-is-the-rprofile-file/).

See [this wiki
page](https://github.com/josherrickson/rrelaxiv/wiki/drat-system-status) for
details of support for **drat** on various systems.

## Using **devtools**

Installing using **devtools** will build the package from source directly from
this repo. You can either build the most recent
[release](https://github.com/josherrickson/rrelaxiv/releases) with

```
devtools::install_github("josherrickson/rrelaxiv@*release")
```

or the current development version at to the last commit to this repo with

```
devtools::install_github("josherrickson/rrelaxiv")
```

Building from source requires gfortran.

## Manual Installation

Binaries can also be installed manually without the use of external packages.
You can download binary releases from [this
directory](https://github.com/josherrickson/rrelaxiv/tree/gh-pages/bin) in the
repository, or
[here](https://github.com/josherrickson/rrelaxiv/tree/gh-pages/src/contrib) to
build from source (note that building from source requires gfortran).

After downloading, install with

```
install.packages("/path/to/downloaded/file.xyz", repos = NULL)
```
