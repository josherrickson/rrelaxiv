# rrelaxiv: Access to RELAX-IV algorithm in R

[![R-build-check](https://github.com/josherrickson/rrelaxiv/workflows/R-build-check/badge.svg)](https://github.com/josherrickson/rrelaxiv/actions)

The RELAX-IV minimum cost flow solver implementation in FORTRAN by Dimitri
P. Bertsekas and Paul Tseng is made accessible inside R.

# Installing

This package is unlikely to ever appear on CRAN. Methods to install are below.

## Using drat

The [drat](https://eddelbuettel.github.io/drat/) package can be used to
installed the package. On Windows/Mac systems this should install a binary
version, meaning FORTRAN is not required to be set up on your system. On *nix
based systems, it will only install from source and therefore requires gfortran
installed.

The following command will add this repo to your list of sources, so that it
interacts with `install.packages` and `update.packages`.

```
drat::addRepo("rrelaxiv", "https://josherrickson.github.io/rrelaxiv")
install.packages("rrelaxiv")
```

Unfortunately the `drat::addRepo` needs to be run each time you plan on
installing or updating. You may be better served adding the `drat::addRepo` line
to your [.Rprofile](https://www.roelpeters.be/what-is-the-rprofile-file/).

See [this wiki
page](https://github.com/josherrickson/rrelaxiv/wiki/drat-system-status) for
details of support for drat on various systems.

## Using remotes

Installing using remotes (previously this was known as installing using
devtools) will build the package from source directly from this repo. You can
either build the most recent
[release](https://github.com/josherrickson/rrelaxiv/releases) with

```
remotes::install_github("josherrickson/rrelaxiv@*release")
```

or the current development version at to the last commit to this repo with

```
remotes::install_github("josherrickson/rrelaxiv")
```
