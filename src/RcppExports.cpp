// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// anova_cpp
List anova_cpp(NumericMatrix data, NumericVector gp, int unequal_var, NumericVector df_red);
RcppExport SEXP _pmartR_anova_cpp(SEXP dataSEXP, SEXP gpSEXP, SEXP unequal_varSEXP, SEXP df_redSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type data(dataSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type gp(gpSEXP);
    Rcpp::traits::input_parameter< int >::type unequal_var(unequal_varSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type df_red(df_redSEXP);
    rcpp_result_gen = Rcpp::wrap(anova_cpp(data, gp, unequal_var, df_red));
    return rcpp_result_gen;
END_RCPP
}
// pooled_cv_rcpp
std::list<double> pooled_cv_rcpp(arma::mat mtr, std::vector<std::string> group);
RcppExport SEXP _pmartR_pooled_cv_rcpp(SEXP mtrSEXP, SEXP groupSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type mtr(mtrSEXP);
    Rcpp::traits::input_parameter< std::vector<std::string> >::type group(groupSEXP);
    rcpp_result_gen = Rcpp::wrap(pooled_cv_rcpp(mtr, group));
    return rcpp_result_gen;
END_RCPP
}
// unpooled_cv_rcpp
std::list<double> unpooled_cv_rcpp(NumericMatrix mtr);
RcppExport SEXP _pmartR_unpooled_cv_rcpp(SEXP mtrSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type mtr(mtrSEXP);
    rcpp_result_gen = Rcpp::wrap(unpooled_cv_rcpp(mtr));
    return rcpp_result_gen;
END_RCPP
}
// count_missing_cpp
NumericMatrix count_missing_cpp(NumericMatrix data, NumericVector gp);
RcppExport SEXP _pmartR_count_missing_cpp(SEXP dataSEXP, SEXP gpSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type data(dataSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type gp(gpSEXP);
    rcpp_result_gen = Rcpp::wrap(count_missing_cpp(data, gp));
    return rcpp_result_gen;
END_RCPP
}
// proj_mat_cpp
List proj_mat_cpp(arma::mat X, int ngroups);
RcppExport SEXP _pmartR_proj_mat_cpp(SEXP XSEXP, SEXP ngroupsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type X(XSEXP);
    Rcpp::traits::input_parameter< int >::type ngroups(ngroupsSEXP);
    rcpp_result_gen = Rcpp::wrap(proj_mat_cpp(X, ngroups));
    return rcpp_result_gen;
END_RCPP
}
// project_to_null_cpp
List project_to_null_cpp(arma::mat data_mat, arma::mat Xmatrix, int ngroups);
RcppExport SEXP _pmartR_project_to_null_cpp(SEXP data_matSEXP, SEXP XmatrixSEXP, SEXP ngroupsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type data_mat(data_matSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Xmatrix(XmatrixSEXP);
    Rcpp::traits::input_parameter< int >::type ngroups(ngroupsSEXP);
    rcpp_result_gen = Rcpp::wrap(project_to_null_cpp(data_mat, Xmatrix, ngroups));
    return rcpp_result_gen;
END_RCPP
}
// fold_change_diff
arma::mat fold_change_diff(arma::mat data, arma::mat C);
RcppExport SEXP _pmartR_fold_change_diff(SEXP dataSEXP, SEXP CSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type data(dataSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type C(CSEXP);
    rcpp_result_gen = Rcpp::wrap(fold_change_diff(data, C));
    return rcpp_result_gen;
END_RCPP
}
// fold_change_ratio
arma::mat fold_change_ratio(arma::mat data, arma::mat C);
RcppExport SEXP _pmartR_fold_change_ratio(SEXP dataSEXP, SEXP CSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type data(dataSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type C(CSEXP);
    rcpp_result_gen = Rcpp::wrap(fold_change_ratio(data, C));
    return rcpp_result_gen;
END_RCPP
}
// fold_change_logbase2
arma::mat fold_change_logbase2(arma::mat data, arma::mat C);
RcppExport SEXP _pmartR_fold_change_logbase2(SEXP dataSEXP, SEXP CSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type data(dataSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type C(CSEXP);
    rcpp_result_gen = Rcpp::wrap(fold_change_logbase2(data, C));
    return rcpp_result_gen;
END_RCPP
}
// fold_change_diff_na_okay
arma::mat fold_change_diff_na_okay(arma::mat data, arma::mat C);
RcppExport SEXP _pmartR_fold_change_diff_na_okay(SEXP dataSEXP, SEXP CSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type data(dataSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type C(CSEXP);
    rcpp_result_gen = Rcpp::wrap(fold_change_diff_na_okay(data, C));
    return rcpp_result_gen;
END_RCPP
}
// fold_change_diff_copy
arma::mat fold_change_diff_copy(arma::mat data, arma::mat C);
RcppExport SEXP _pmartR_fold_change_diff_copy(SEXP dataSEXP, SEXP CSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type data(dataSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type C(CSEXP);
    rcpp_result_gen = Rcpp::wrap(fold_change_diff_copy(data, C));
    return rcpp_result_gen;
END_RCPP
}
// group_comparison_anova_cpp
List group_comparison_anova_cpp(arma::mat means, arma::mat sizes, arma::vec sigma2, arma::mat C);
RcppExport SEXP _pmartR_group_comparison_anova_cpp(SEXP meansSEXP, SEXP sizesSEXP, SEXP sigma2SEXP, SEXP CSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type means(meansSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type sizes(sizesSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type sigma2(sigma2SEXP);
    Rcpp::traits::input_parameter< arma::mat >::type C(CSEXP);
    rcpp_result_gen = Rcpp::wrap(group_comparison_anova_cpp(means, sizes, sigma2, C));
    return rcpp_result_gen;
END_RCPP
}
// gtest_cpp
List gtest_cpp(NumericMatrix data, NumericVector gp);
RcppExport SEXP _pmartR_gtest_cpp(SEXP dataSEXP, SEXP gpSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type data(dataSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type gp(gpSEXP);
    rcpp_result_gen = Rcpp::wrap(gtest_cpp(data, gp));
    return rcpp_result_gen;
END_RCPP
}
// holm_cpp
NumericVector holm_cpp(NumericVector ps);
RcppExport SEXP _pmartR_holm_cpp(SEXP psSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type ps(psSEXP);
    rcpp_result_gen = Rcpp::wrap(holm_cpp(ps));
    return rcpp_result_gen;
END_RCPP
}
// kw_rcpp
std::list<double> kw_rcpp(arma::mat mtr, std::vector<std::string> group);
RcppExport SEXP _pmartR_kw_rcpp(SEXP mtrSEXP, SEXP groupSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type mtr(mtrSEXP);
    Rcpp::traits::input_parameter< std::vector<std::string> >::type group(groupSEXP);
    rcpp_result_gen = Rcpp::wrap(kw_rcpp(mtr, group));
    return rcpp_result_gen;
END_RCPP
}
// nonmissing_per_grp
arma::Mat<int> nonmissing_per_grp(arma::mat mtr, std::vector<std::string> group);
RcppExport SEXP _pmartR_nonmissing_per_grp(SEXP mtrSEXP, SEXP groupSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type mtr(mtrSEXP);
    Rcpp::traits::input_parameter< std::vector<std::string> >::type group(groupSEXP);
    rcpp_result_gen = Rcpp::wrap(nonmissing_per_grp(mtr, group));
    return rcpp_result_gen;
END_RCPP
}
// ptukey_speed
NumericMatrix ptukey_speed(NumericMatrix qstats, NumericVector sizes);
RcppExport SEXP _pmartR_ptukey_speed(SEXP qstatsSEXP, SEXP sizesSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type qstats(qstatsSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type sizes(sizesSEXP);
    rcpp_result_gen = Rcpp::wrap(ptukey_speed(qstats, sizes));
    return rcpp_result_gen;
END_RCPP
}
// two_factor_anova_cpp
List two_factor_anova_cpp(arma::mat y, arma::mat X_full, arma::mat X_red, NumericVector red_df, arma::colvec group_ids);
RcppExport SEXP _pmartR_two_factor_anova_cpp(SEXP ySEXP, SEXP X_fullSEXP, SEXP X_redSEXP, SEXP red_dfSEXP, SEXP group_idsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type y(ySEXP);
    Rcpp::traits::input_parameter< arma::mat >::type X_full(X_fullSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type X_red(X_redSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type red_df(red_dfSEXP);
    Rcpp::traits::input_parameter< arma::colvec >::type group_ids(group_idsSEXP);
    rcpp_result_gen = Rcpp::wrap(two_factor_anova_cpp(y, X_full, X_red, red_df, group_ids));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_pmartR_anova_cpp", (DL_FUNC) &_pmartR_anova_cpp, 4},
    {"_pmartR_pooled_cv_rcpp", (DL_FUNC) &_pmartR_pooled_cv_rcpp, 2},
    {"_pmartR_unpooled_cv_rcpp", (DL_FUNC) &_pmartR_unpooled_cv_rcpp, 1},
    {"_pmartR_count_missing_cpp", (DL_FUNC) &_pmartR_count_missing_cpp, 2},
    {"_pmartR_proj_mat_cpp", (DL_FUNC) &_pmartR_proj_mat_cpp, 2},
    {"_pmartR_project_to_null_cpp", (DL_FUNC) &_pmartR_project_to_null_cpp, 3},
    {"_pmartR_fold_change_diff", (DL_FUNC) &_pmartR_fold_change_diff, 2},
    {"_pmartR_fold_change_ratio", (DL_FUNC) &_pmartR_fold_change_ratio, 2},
    {"_pmartR_fold_change_logbase2", (DL_FUNC) &_pmartR_fold_change_logbase2, 2},
    {"_pmartR_fold_change_diff_na_okay", (DL_FUNC) &_pmartR_fold_change_diff_na_okay, 2},
    {"_pmartR_fold_change_diff_copy", (DL_FUNC) &_pmartR_fold_change_diff_copy, 2},
    {"_pmartR_group_comparison_anova_cpp", (DL_FUNC) &_pmartR_group_comparison_anova_cpp, 4},
    {"_pmartR_gtest_cpp", (DL_FUNC) &_pmartR_gtest_cpp, 2},
    {"_pmartR_holm_cpp", (DL_FUNC) &_pmartR_holm_cpp, 1},
    {"_pmartR_kw_rcpp", (DL_FUNC) &_pmartR_kw_rcpp, 2},
    {"_pmartR_nonmissing_per_grp", (DL_FUNC) &_pmartR_nonmissing_per_grp, 2},
    {"_pmartR_ptukey_speed", (DL_FUNC) &_pmartR_ptukey_speed, 2},
    {"_pmartR_two_factor_anova_cpp", (DL_FUNC) &_pmartR_two_factor_anova_cpp, 5},
    {NULL, NULL, 0}
};

RcppExport void R_init_pmartR(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
