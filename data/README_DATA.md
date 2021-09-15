# README_DATA.md

## General note

+ These datafiles are explictly excluded from the repo using the `.gitignore`
+ No datafiles should ever be comitted to the repo
+ All files to be reproduced from raw using the appropriate notebooks & scripts

## Directory structure

`raw/`
  `verbatim/`
    + These are raw data files **verbatim** exactly as supplied from client
    + We run hashes against these to prove they are unchanged
    + Files typically in `*xls*` or `.*db` or `.*sv` formats and very dirty
  `extracted/`
    + These are raw data files **extracted** from the initial dump that make it
      easier to work with the data e.g. pull a table from an Excel file
    + Files typically in `.csv` formats and content still dirty
  `cleaned/`
    + These are raw files following an initial **clean** to address simple
      issues with datatypes, and elements (missing data, invalid values)
    + Files typically in parquet format for optimised storage

`prepared/`
    + These are fully **prepared** files for use in analysis and modelling
    + Files typically in parquet format for optimised storage

## Directory listing (latest)

```sh

```

---
**Oreum OÜ &copy; 2021**