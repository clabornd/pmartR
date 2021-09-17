context('filter by peptide and protein counts')

test_that('proteomics_filter and applyFilt produce the correct output',{

  # Load data and prepare omicsData objects ------------------------------------

  load(system.file('testdata',
                   'little_pdata.RData',
                   package = 'pmartR'))

  # Create a pepData object with the reduced data set.
  pdata <- as.pepData(e_data = edata,
                      f_data = fdata,
                      e_meta = emeta,
                      edata_cname = "Mass_Tag_ID",
                      fdata_cname = "SampleID",
                      emeta_cname = "Protein")

  # Create an emeta data frame with degenerate peptides.
  ignoble <- rbind(rapply(emeta,
                          as.character,
                          classes = "factor",
                          how = "replace"),
                   c(4204701, "RL40_DROID", 9797, "K.TITLEVEPSDTIENV.I"),
                   c(6948847, "ROA2_DROID", 10031, "R.GFGFVTFDDHDPVD.Y"),
                   c(11939, "G3P_DROID", 4480, "Y.MFQYDSTTHGK.F"))

  # Fashion a pepData object with the degenerate peptide data.
  # sordata for sordid pdata :)
  sordata <- as.pepData(e_data = edata,
                        f_data = fdata,
                        e_meta = ignoble,
                        edata_cname = "Mass_Tag_ID",
                        fdata_cname = "SampleID",
                        emeta_cname = "Protein")

  # Count peptides and proteins for comparison purposes ------------------------

  # Count the number of peptides in e_meta.
  pepCount <- pdata$e_meta %>%
    dplyr::group_by(Mass_Tag_ID) %>%
    dplyr::tally() %>%
    data.frame()

  # Count the number of peptides associated with each protein.
  proCount <- pdata$e_meta %>%
    dplyr::group_by(Protein) %>%
    dplyr::tally() %>%
    data.frame()

  # Count the number of peptides in the ignoble e_meta data frame.
  pepCountS <- sordata$e_meta %>%
    dplyr::group_by(Mass_Tag_ID) %>%
    dplyr::tally() %>%
    data.frame()

  # Count the number of peptides associated with each protein.
  proCountS <- sordata$e_meta %>%
    dplyr::group_by(Protein) %>%
    dplyr::tally() %>%
    data.frame()

  # Non-degenerate peptides ---------------

  # Fish out the proteins with fewer than two peptides associated with them.
  # lil_pro because these proteins have a small number of peptides :)
  lil_pro <- as.character(proCount[which(proCount[, 2] < 2), 1])

  # Find rows in e_meta that correspond to proteins to be filtered.
  lil_pro_ids <- which(pdata$e_meta[, 2] %in% lil_pro)

  # Find all peptide IDs that will be filtered.
  pep_standard <- as.character(pdata$e_meta[lil_pro_ids, 1])

  # Degenerate peptides ---------------

  # pull peptides with more than one row in e_meta.
  amoral_pepes <- as.character(pepCountS[which(pepCountS[, 2] > 1), 1])

  # Find the row indices in e_meta that correspond to the naughty peptides.
  amoral_pepes_ids <- which(sordata$e_meta[, 1] %in% amoral_pepes)

  # Fish out the indices for the proteins associated with the sordid peptides.
  # GUILTY BY ASSOCIATION!!
  amoral_prots <- as.character(setdiff(sordata$e_meta[amoral_pepes_ids, 2],
                                       sordata$e_meta[-amoral_pepes_ids, 2]))

  # Test proteomics_filter without degenerate peptides -------------------------

  # Try creating a proteomicsFilt object with unholy input objects.
  expect_error(proteomics_filter(omicsData = fdata),
               paste("omicsData must be of class 'pepData'",
                     sep = " "))

  # Try creating a proteomicsFilt object without the e_meta data frame.
  expect_error(proteomics_filter(as.pepData(e_data = edata,
                                            f_data = fdata,
                                            edata_cname = "Mass_Tag_ID",
                                            fdata_cname = "SampleID")),
               paste("e_meta must be non-NULL",
                     sep = " "))

  # Run proteomics_filter with holy input objects.
  filter <- proteomics_filter(omicsData = pdata)

  # Review the class for the filter object.
  expect_s3_class(filter,
                  c('proteomicsFilt', 'data.frame'))

  # Check the length of the filter list.
  expect_equal(length(filter), 2)

  # Ensure the counts for each peptide are correct.
  expect_identical(filter[[1]],
                   pepCount)

  # Verify the counts for each protein are correct.
  expect_identical(filter[[2]],
                   proCount)

  # Test proteomics_filter with degenerate peptides ----------------------------

  # Run proteomics_filter with corrupt peptides.
  sorfilter <- proteomics_filter(omicsData = sordata)

  # Review the class for the sorfilter object.
  expect_s3_class(sorfilter,
                  c('proteomicsFilt', 'data.frame'))

  # Check the length of the sorfilter list.
  expect_equal(length(sorfilter), 2)

  # Ensure the counts for each peptide are correct.
  expect_identical(sorfilter[[1]],
                   pepCountS)

  # Verify the counts for each protein are correct.
  expect_identical(sorfilter[[2]],
                   proCountS)

  # Test applyFilt without degenerate peptides ---------------------------------

  # Apply the proteomics filter only using the min_num_peps argument.
  filtered <- applyFilt(filter_object = filter,
                        omicsData = pdata,
                        min_num_peps = 2)

  # Ensure the class and attributes that shouldn't have changed didn't change.
  expect_identical(attr(pdata, 'cnames'),
                   attr(filtered, 'cnames'))
  expect_identical(attr(pdata, 'check.names'),
                   attr(filtered, 'check.names'))
  expect_identical(class(pdata),
                   class(filtered))

  # Examine the filters attribute.
  expect_equal(attr(filtered, 'filters')[[1]]$type,
               'proteomicsFilt')
  expect_identical(attr(filtered, 'filters')[[1]]$threshold,
                   data.frame(min_num_peps = 2,
                              degen_peps = as.character(FALSE)))
  expect_equal(attr(filtered, 'filters')[[1]]$filtered$e_meta_remove,
               lil_pro)
  expect_equal(attr(filtered, 'filters')[[1]]$filtered$e_data_remove,
               pep_standard)
  expect_true(is.na(attr(filtered, 'filters')[[1]]$method))

  # Investigate the data_info attribute.
  expect_equal(
    attr(filtered, "data_info"),
    list(data_scale_orig = "abundance",
         data_scale = "abundance",
         norm_info = list(is_normalized = FALSE),
         num_edata = length(unique(filtered$e_data[, 1])),
         num_miss_obs = sum(is.na(filtered$e_data)),
         prop_missing = (sum(is.na(filtered$e_data)) /
                           prod(dim(filtered$e_data[, -1]))),
         num_samps = ncol(filtered$e_data[, -1]),
         data_types = NULL)
  )

  # Explore the meta_info attribute.
  expect_equal(
    attr(filtered, "meta_info"),
    list(meta_data = TRUE,
         num_emeta = length(unique(filtered$e_meta$Protein)))
  )

  # Inspect the filtered e_data, f_data, and e_meta data frames.
  expect_equal(dim(filtered$e_data),
               c(94, 13))
  expect_equal(dim(filtered$f_data),
               c(12, 2))
  expect_equal(dim(filtered$e_meta),
               c(94, 4))

  # Test applyFilt with degenerate peptides ------------------------------------

  # Apply the proteomics filter with degenerate peptides and min_num_peps.
  sorfiltered <- applyFilt(filter_object = sorfilter,
                           omicsData = sordata,
                           min_num_peps = 2,
                           degen_peps = TRUE)

  # Ensure the class and attributes that shouldn't have changed didn't change.
  expect_identical(attr(sordata, 'cnames'),
                   attr(sorfiltered, 'cnames'))
  expect_identical(attr(sordata, 'check.names'),
                   attr(sorfiltered, 'check.names'))
  expect_identical(class(sordata),
                   class(sorfiltered))

  # Examine the filters attribute.
  expect_equal(attr(sorfiltered, 'filters')[[1]]$type,
               'proteomicsFilt')
  expect_identical(attr(sorfiltered, 'filters')[[1]]$threshold,
                   data.frame(min_num_peps = 2,
                              degen_peps = "TRUE"))
  expect_equal(attr(sorfiltered, 'filters')[[1]]$filtered$e_meta_remove,
               c(amoral_prots, lil_pro))
  expect_equal(attr(sorfiltered, 'filters')[[1]]$filtered$e_data_remove,
               c(amoral_pepes, pep_standard))
  expect_true(is.na(attr(sorfiltered, 'filters')[[1]]$method))

  # Investigate the data_info attribute.
  expect_equal(
    attr(sorfiltered, "data_info"),
    list(data_scale_orig = "abundance",
         data_scale = "abundance",
         norm_info = list(is_normalized = FALSE),
         num_edata = length(unique(sorfiltered$e_data[, 1])),
         num_miss_obs = sum(is.na(sorfiltered$e_data)),
         prop_missing = (sum(is.na(sorfiltered$e_data)) /
                           prod(dim(sorfiltered$e_data[, -1]))),
         num_samps = ncol(sorfiltered$e_data[, -1]),
         data_types = NULL)
  )

  # Explore the meta_info attribute.
  expect_equal(
    attr(sorfiltered, "meta_info"),
    list(meta_data = TRUE,
         num_emeta = length(unique(sorfiltered$e_meta$Protein)))
  )

  # Inspect the sorfiltered e_data, f_data, and e_meta data frames.
  expect_equal(dim(sorfiltered$e_data),
               c(91, 13))
  expect_equal(dim(sorfiltered$f_data),
               c(12, 2))
  expect_equal(dim(sorfiltered$e_meta),
               c(91, 4))

  # Apply the proteomics filter just with degenerate peptides.
  sorfiltered2 <- applyFilt(filter_object = sorfilter,
                            omicsData = sordata,
                            degen_peps = TRUE)

  # Ensure the class and attributes that shouldn't have changed didn't change.
  expect_identical(attr(sordata, 'cnames'),
                   attr(sorfiltered2, 'cnames'))
  expect_identical(attr(sordata, 'check.names'),
                   attr(sorfiltered2, 'check.names'))
  expect_identical(class(sordata),
                   class(sorfiltered2))

  # Examine the filters attribute.
  expect_equal(attr(sorfiltered2, 'filters')[[1]]$type,
               'proteomicsFilt')
  expect_identical(attr(sorfiltered2, 'filters')[[1]]$threshold,
                   data.frame(min_num_peps = NA,
                              degen_peps = "TRUE"))
  expect_equal(attr(sorfiltered2, 'filters')[[1]]$filtered$e_meta_remove,
               amoral_prots)
  expect_equal(attr(sorfiltered2, 'filters')[[1]]$filtered$e_data_remove,
               amoral_pepes)
  expect_true(is.na(attr(sorfiltered2, 'filters')[[1]]$method))

  # Investigate the data_info attribute.
  expect_equal(
    attr(sorfiltered2, "data_info"),
    list(data_scale_orig = "abundance",
         data_scale = "abundance",
         norm_info = list(is_normalized = FALSE),
         num_edata = length(unique(sorfiltered2$e_data[, 1])),
         num_miss_obs = sum(is.na(sorfiltered2$e_data)),
         prop_missing = (sum(is.na(sorfiltered2$e_data)) /
                           prod(dim(sorfiltered2$e_data[, -1]))),
         num_samps = ncol(sorfiltered2$e_data[, -1]),
         data_types = NULL)
  )

  # Explore the meta_info attribute.
  expect_equal(
    attr(sorfiltered2, "meta_info"),
    list(meta_data = TRUE,
         num_emeta = length(unique(sorfiltered2$e_meta$Protein)))
  )

  # Inspect the sorfiltered2 e_data, f_data, and e_meta data frames.
  expect_equal(dim(sorfiltered2$e_data),
               c(147, 13))
  expect_equal(dim(sorfiltered2$f_data),
               c(12, 2))
  expect_equal(dim(sorfiltered2$e_meta),
               c(147, 4))

  # Apply the proteomics filter just with min_num_peps.
  sorfiltered3 <- applyFilt(filter_object = sorfilter,
                            omicsData = sordata,
                            min_num_peps = 2)

  # Ensure the class and attributes that shouldn't have changed didn't change.
  expect_identical(attr(sordata, 'cnames'),
                   attr(sorfiltered3, 'cnames'))
  expect_identical(attr(sordata, 'check.names'),
                   attr(sorfiltered3, 'check.names'))
  expect_identical(class(sordata),
                   class(sorfiltered3))

  # Examine the filters attribute.
  expect_equal(attr(sorfiltered3, 'filters')[[1]]$type,
               'proteomicsFilt')
  expect_identical(attr(sorfiltered3, 'filters')[[1]]$threshold,
                   data.frame(min_num_peps = 2,
                              degen_peps = "FALSE"))
  expect_setequal(attr(sorfiltered3, 'filters')[[1]]$filtered$e_meta_remove,
                  c(attr(filtered, "filters")[[1]]$filtered$e_meta_remove,
                    amoral_prots))
  expect_equal(attr(sorfiltered3, 'filters')[[1]]$filtered$e_data_remove,
               attr(filtered, 'filters')[[1]]$filtered$e_data_remove)
  expect_true(is.na(attr(sorfiltered3, 'filters')[[1]]$method))

  # Investigate the data_info attribute.
  expect_equal(attr(sorfiltered3, 'data_info'),
               attr(filtered, 'data_info'))

  # Explore the meta_info attribute.
  expect_equal(attr(sorfiltered3, 'meta_info'),
               attr(filtered, 'meta_info'))

  # Inspect the sorfiltered3 e_data, f_data, and e_meta data frames.
  expect_equal(dim(sorfiltered3$e_data),
               dim(filtered$e_data))
  expect_equal(dim(sorfiltered3$f_data),
               dim(filtered$f_data))
  expect_equal(dim(sorfiltered3$e_meta),
               dim(filtered$e_meta))

  # Test scenario when nothing is filtered -------------------------------------

  # Find all proteins that map to 2 or more peptides. The data will be subsetted
  # to just these proteins and their corresponding peptides. This data set will
  # be used to test the proteomics filter when nothing is filtered.
  proKeepers <- proCount[which(proCount$n > 1), ]$Protein
  pepKeepers <- emeta[emeta$Protein %in% proKeepers, ]$Mass_Tag_ID

  lilpdata <- as.pepData(e_data = edata[edata$Mass_Tag_ID %in% pepKeepers, ],
                         f_data = fdata,
                         e_meta = emeta[emeta$Protein %in% proKeepers, ],
                         edata_cname = "Mass_Tag_ID",
                         fdata_cname = "SampleID",
                         emeta_cname = "Protein")

  filter <- proteomics_filter(omicsData = lilpdata)

  # Apply the filter with a value for min_num_peps and degen_peps (FALSE) that
  # will not filter any rows.
  expect_message(noFilta <- applyFilt(filter_object = filter,
                                      omicsData = lilpdata,
                                      min_num_peps = 2),
                 paste("No peptides/proteins were filtered with the values",
                       "specified for the min_num_peps and degen_peps",
                       "arguments.",
                       sep = " "))

  # The output of applyFilt should be the same as the omicsData object used as
  # the input because the filter was not applied. Therefore, the filters
  # attribute should remain how it was before running applyFilt.
  expect_identical(noFilta, lilpdata)

})