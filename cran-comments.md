**Dealt with error relating to missing package `pmartRdata` in Suggests.**  Package moved to drat repository and DESCRIPTION updated to use `Additional_repositories`.  Submission to https://win-builder.r-project.org/ still seems to be unable to install this packages on R-devel, however rhub checks on Windows Server/R-devel pass.

**Added vignettes to .Rbuildignore to avoid warnings.**  Vignettes take a long time to run and are published to a github pages.

**Notes Fixed**
- Documentation lines with > 100 characters.
- Fixed documented but not used arguments.
- Removed C++11 specification
- Consolidated non-standard top level file `disclaimer.txt` into README
- Suppressed long running examples

**Remaining Notes**
In rhub checks, package size exceeds 5mb due to the 'lib' directory, which contains the compiled C++ code.  This is required for the package to function.  Previous submission did not appear to contain this note.

**Files being written to disk**
Fixed tests writing to the ~/Downloads folder.  It was also noted that there were other files being written to src/R/.svn/pristine/.... however we can't see how our code would write to this location, I'm unable to find these files on ubuntu/debian containers.
