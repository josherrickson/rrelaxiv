#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .Call calls */
extern SEXP _rrelaxiv_ismOps(SEXP, SEXP, SEXP);
extern SEXP _rrelaxiv_mahalanobisHelper(SEXP, SEXP, SEXP);
extern SEXP _rrelaxiv_r_smahal(SEXP, SEXP, SEXP);
extern SEXP _rrelaxiv_subsetInfSparseMatrix(SEXP, SEXP, SEXP);

/* .Fortran calls */
extern void F77_NAME(relaxalg)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(relaxalgold)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);

static const R_CallMethodDef CallEntries[] = {
  {"_rrelaxiv_ismOps",                (DL_FUNC) &_rrelaxiv_ismOps,                3},
  {"_rrelaxiv_mahalanobisHelper",     (DL_FUNC) &_rrelaxiv_mahalanobisHelper,     3},
  {"_rrelaxiv_r_smahal",              (DL_FUNC) &_rrelaxiv_r_smahal,              3},
  {"_rrelaxiv_subsetInfSparseMatrix", (DL_FUNC) &_rrelaxiv_subsetInfSparseMatrix, 3},
  {NULL, NULL, 0}
};

static const R_FortranMethodDef FortranEntries[] = {
  {"relaxalg",    (DL_FUNC) &F77_NAME(relaxalg),    11},
  {"relaxalgold", (DL_FUNC) &F77_NAME(relaxalgold), 11},
  {NULL, NULL, 0}
};

void R_init_rrelaxiv(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, FortranEntries, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
