context('IMD-ANOVA paired tests')

test_that('all paired tests conform to the decrees of the God of Stats',{

  # Load IMD-ANOVA filter objects ----------------------------------------------

  load(system.file('testdata',
                   'standards_filter_paired.RData',
                   package = 'pmartR'))

  # Load IMD-ANOVA standards ---------------------------------------------------

  load(system.file('testdata',
                   'standards_imd_anova_paired.RData',
                   package = 'pmartR'))

  # Compare IMD-ANOVAly --------------------------------------------------------

  expect_warning(
    afruit_1_0_3 <- imd_anova(afilta_1_0_3,
                              test_method = "anova",
                              paired = TRUE)
  )
  expect_warning(
    gfruit_1_0_3 <- imd_anova(gfilta_1_0_3,
                              test_method = "gtest",
                              paired = TRUE)
  )
  expect_warning(
    cfruit_1_0_3 <- imd_anova(cfilta_1_0_3,
                              test_method = "combined",
                              paired = TRUE)
  )

  expect_warning(
    afruit_1_1_3 <- imd_anova(afilta_1_1_3,
                              test_method = "anova",
                              covariates = "Gender",
                              paired = TRUE)
  )
  expect_warning(
    gfruit_1_1_3 <- imd_anova(gfilta_1_1_3,
                              test_method = "gtest",
                              covariates = "Gender",
                              use_parallel = FALSE,
                              paired = TRUE)
  )
  expect_warning(
    cfruit_1_1_3 <- imd_anova(cfilta_1_1_3,
                              test_method = "combined",
                              covariates = "Gender",
                              paired = TRUE)
  )

  # Holy IMD-ANOVA unit tests, Statman! ----------------------------------------

  # ANOVA: Unadjusted p-values ---------------

  expect_equal(afruit_1_0_3, astan_1_0_3)
  expect_equal(afruit_1_1_3, astan_1_1_3)

  # G-Test: Unadjusted p-values ---------------

  expect_equal(gfruit_1_0_3, gstan_1_0_3)
  expect_equal(gfruit_1_1_3, gstan_1_1_3)

  # Combined: Unadjusted p-values ---------------

  expect_equal(cfruit_1_0_3, cstan_1_0_3)
  expect_equal(cfruit_1_1_3, cstan_1_1_3)

  # Test argument checks -------------------------------------------------------

  # Maybe add later (depending on the position of the planets and stars).

})