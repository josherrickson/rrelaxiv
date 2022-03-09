# rrelaxiv: Access to RELAX-IV algorithm in R

[![R-build-check](https://github.com/josherrickson/rrelaxiv/workflows/R-build-check/badge.svg)](https://github.com/josherrickson/rrelaxiv/actions)

The RELAX-IV minimum cost flow solver implementation in FORTRAN by Dimitri
P. Bertsekas and Paul Tseng is made accessible inside R.

# Installing

## Using `drat`

```
drat::addRepo("rrelaxiv", "https://josherrickson.github.io/rrelaxiv")
install.packages("rrelaxiv")
```

## Using `remotes`

```
remotes::install_github("josherrickson/rrelaxiv")
```
