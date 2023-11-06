- Dealt with error relating to missing package `pmartRdata` in Suggests.  Package moved to drat repository and DESCRIPTION updated to use `Additional_repositories`.
- Added vignettes to .Rbuildignore to avoid warnings.  Vignettes take a long time to run and are published to a github pages.

**Notes Fixed**
- Documentation lines with > 100 characters.
- Removed C++11 specification
- Consolidated non-standard top level file `disclaimer.txt` into README

**Files being written to disk**
Fixed tests writing to the ~/Downloads folder.  It was noted that there were other files being written to src/R/.svn/pristine/.... however we can't see how our code would write to this location, I'm unable to find these files on ubuntu/debian containers.