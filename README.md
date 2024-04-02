# rrelaxiv: RELAX-IV algorithm in R <img src="man/figures/logo.png" align="right" height="139" />

Package website: [release](https://errickson.net/rrelaxiv/) | [development](https://errickson.net/rrelaxiv/dev)

<!-- badges: start -->
[![R-build-check](https://github.com/josherrickson/rrelaxiv/workflows/R-build-check/badge.svg)](https://github.com/josherrickson/rrelaxiv/actions)
<!-- badges: end -->

The RELAX-IV minimum cost flow solver implementation in FORTRAN by Dimitri
P. Bertsekas and Paul Tseng is made accessible inside R.

## Interface

There are two functions for interfacing with the RELAX-IV solver. The first,
`RELAX_IV()`, is intended for most users and includes a simplified interface and
input sanitization. Its inputs are characteristics of the graph, and it returns
the flow across each edges.

For advanced usage, consider the `.RELAX_IV()` function. This features no input
sanitization and has a more complex interface. It's inputs are advanced
characteristics of the graph, and it returns a more complete set of results.

## RELAX-IV algorithm and code

The **rrelaxiv** package implements D. P. Bertsekas and P. Tseng's RELAX-IV
algorithm and code:

- Bersekas, D. P. and Tseng, P., "Relaxation Methods for Minimum Cost ..."
  Operations Research, vol. 26, 1988, 93-114
- Bertsekas, D. P., "An Auction/Sequential Shortest Path Algorithm for the
  Minimum Cost Flow Problem", LIDS Report P-2146, MIT, Nov. 1992
- Bertsekas, D.P., Linear Network Optimization, MIT Press, 1991
- Bertsekas, D.P., Network Optimization: Continuous and Discrete Models, Athena
  Scientific, 1998; <http://web.mit.edu/dimitrib/www/noc.htm>

Bertsekas and Tseng freely permit their software to be used for research
purposes, but non-research uses, including the use of it to 'satisfy in any part
commercial delivery requirements to government or industry,' require a special
agreement with them. By extension, this requirement applies to most any use of R
functions in the **rrelaxiv** package.

To request permissions not here relayed, contact Professor Bertsekas at
Laboratory for Information and Decision Systems Massachusetts Institute of
Technology Cambridge, MA 02139 (617) 253-7267 <dimitrib@mit.edu>

## Installing

This package is unlikely to ever appear on CRAN. Methods to install are below.

### Using **drat**

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

### Using **devtools**

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

### Manual Installation

Binaries can also be installed manually without the use of external packages.
You can download binary releases from [this
directory](https://github.com/josherrickson/rrelaxiv/tree/main/bin) in the
repository, or
[here](https://github.com/josherrickson/rrelaxiv/tree/main/src/contrib) to
build from source (note that building from source requires gfortran).

After downloading, install with

```
install.packages("/path/to/downloaded/file.xyz", repos = NULL)
```

## Rebuilding website

Run `make build_site` (or, directly, `devtools::build_site(quiet = FALSE)`) to
build the site. Assuming the package is currently on a [development
version](https://r-pkgs.org/lifecycle.html#sec-lifecycle-version-number-tidyverse),
this will build the dev site to docs/dev. To build the release site, checkout
the most recent [tagged
release](https://github.com/josherrickson/rrelaxiv/tags), e.g. `git
checkout v0.2.5`. Build the site in that commit, which should populate docs/.
Checkout back to main, and both pkgdown sites should be build.

## Logo Attribution

<a href="https://www.vecteezy.com/free-vector/beach">Beach Vectors by Vecteezy</a>
