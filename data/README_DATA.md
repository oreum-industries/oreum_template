# README_DATA.md

## General Note

+ This is an R&D project that moves rapidly and doesn't assume system
integration or DB access, so we typically expect to work on static datasets
stored locally for development
+ These datasets are explictly excluded from the repo using the `.gitignore`
+ Datafiles should _never_ be committed to the repo
+ All files used in the analysis are to be reproduced from raw using the
  appropriate notebooks & scripts
  
## Directory structure

+ `raw/verbatim/`
    + These are raw data files verbatim exactly as supplied from the client
    + We run hashes against these using `hash_verbatim_files.sh` to assign an
      SHA1 hash with datetime to help with data lineage and governance
    + These files are typically receieved in `.xls*` or `.*db` or `.*sv` formats
      and are usually very dirty

+ `raw/extracted/`
    + These are raw data files extracted from the initial dump to make it
      easier to work with the data e.g. to pull a table from an Excel file
    + These files are typically in `.csv` format and content still dirty
    + NOTE: In the rare case that we have direct DB access, we draw static
      datasets from the DB using SQL scripts in `sql/`, controlled by Python
      scripts in `src/` and store the results here in `raw/extracted/` in `.csv`
      or `.parquet` format. We assume that we can always recover the static
      data from the DB, hence we call it "extracted" and not "verbatim".

+ `raw/cleaned/`
    + These are raw files following an initial clean to address simple issues
      with datatypes and elements (missing data, invalid values)
    + These files are typically in `.parquet` format for optimised storage

+ `prepared/`
    + These are fully prepared files for use in analysis and modelling
    + These files are typically in `.parquet` format for optimised storage.