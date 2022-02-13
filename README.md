# README.md

## Oreum Template Project `oreum_template`

2022Q1

Template project structure for R&D work primarily for client projects, based
on the widely used concept of
[cookiecutter-data-science](https://drivendata.github.io/cookiecutter-data-science/).

To re-use: replace string `oreum_template` with your `project_name`.

### Contents

1. Instructions for Manual Installation of the Environment
2. Automatic Installation
3. Additional Config and Testing
4. Data Standards
5. Notebook Standards
6. Code Standards
7. General Notes

### Notes

+ We use a scientific Python stack for scripting / package development and
interactive Jupyter Notebooks for reproducible research
+ The project is hosted privately on Oreum Industries Github at
[oreum_template](https://github.com/oreum-industries/oreum_template)
+ Project began on <DATE>
+ The README.md is MacOS and POSIX oriented
+ See LICENSE.md for licensing and copyright details
+ See CONTRIBUTORS.md for list of contributors

---

## 1. Instructions for Manual Installation of the Environment

This project is intended for interactive development and execution and is
manually installed.

### 1.1 Pre-req: Continuum Anaconda Python 3.9.* 64bit

Download latest from:
[https://www.continuum.io/downloads](https://www.continuum.io/downloads)

### 1.2 Git clone the repo

Assumes `git` already installed

```zsh
$> git clone https://github.com/oreum-industries/oreum_template
$> cd oreum_template
```

### 1.3 Create virtual environment

Notes:

+ This compound method uses `conda` for main environment and packages,
and `pip` for selected additional packages handled better by pip than conda.
+ Packages might not be the very latest because we want stability for `pymc3`
which is usually in a state of flux, esp w.r.t `theano` and `aesara`.
+ See [cheat sheet of conda commands](https://conda.io/docs/_downloads/conda-cheatsheet.pdf)
+ Use `direnv` on MacOS to automatically run file `.envrc` upon directory open
+ Jupyterlab extensions need [NodeJS](https://nodejs.org/en/) on system

#### 1.3.1 Main environment and packages using conda

```zsh
$> conda update -n base -c defaults conda
$> conda env create --file condaenv_oreum_template.yml
$> conda activate oreum_template
```

#### 1.3.2 Additional packages using pip

Note:

+ This includes `oreum_core` which contains several package dependencies
+ This will create a new file at project root `LICENSES_THIRD_PARTY.md`

```zsh
$> ./pip_install.sh
```

#### 1.3.3 Install graphviz to local system, OS dependent

Note:

+ Graphviz required for pymc3 'drawing' the model graph
+ Instruction is for MacOS using `brew`

```zsh
brew install graphviz
```

#### 1.3.4 Optional jupyterlab extensions

Note:

+ Adds spellchecking and nicer dark-mode theme

```zsh
$> ./jupyter_install.sh
```

### 1.4 Configs for Local Development

Some notes to help configure local development environment

#### 1.4.1 Git config `~/.gitconfig`

```yaml
[user]
    name = <YOUR NAME>
    email = <YOUR EMAIL ADDRESS>
```

#### 1.4.2 Jupyter config

Assumes `jupyter` installed, sets defaults

```zsh
$> jupyter notebook --generate-config
$> jupyter qtconsole --generate-config
$> jupyter nbconvert --generate-config
```

#### 1.4.3 Local theano config `~/.theanorc`

```yaml
[global]
device=cpu
```

### 1.5 Misc

None

---

## 2. Automatic Installation

Pending creation of `makefile`. This will install onto a Linux server.

---

## 3. Additional Config and Testing

### 3.1 Test installation of scientific packages

Optional tests to confirm good installation of:
BLAS / MKL, numpy, scipy, pymc3, theano

#### 3.1.1 BLAS / MKL config

View the BLAS / MKL install

```zsh
$> python -c "import numpy as np; np.__config__.show()"
```

Example output...

```zsh
blas_mkl_info:
    libraries = ['mkl_rt', 'pthread']
    library_dirs = ['/Users/jon/opt/anaconda3/envs/oreum_template/lib']
    define_macros = [('SCIPY_MKL_H', None), ('HAVE_CBLAS', None)]
    include_dirs = ['/Users/jon/opt/anaconda3/envs/oreum_template/include']
blas_opt_info:
    libraries = ['mkl_rt', 'pthread']
    library_dirs = ['/Users/jon/opt/anaconda3/envs/oreum_template/lib']
    define_macros = [('SCIPY_MKL_H', None), ('HAVE_CBLAS', None)]
    include_dirs = ['/Users/jon/opt/anaconda3/envs/oreum_template/include']
lapack_mkl_info:
    libraries = ['mkl_rt', 'pthread']
    library_dirs = ['/Users/jon/opt/anaconda3/envs/oreum_template/lib']
    define_macros = [('SCIPY_MKL_H', None), ('HAVE_CBLAS', None)]
    include_dirs = ['/Users/jon/opt/anaconda3/envs/oreum_template/include']
lapack_opt_info:
    libraries = ['mkl_rt', 'pthread']
    library_dirs = ['/Users/jon/opt/anaconda3/envs/oreum_template/lib']
    define_macros = [('SCIPY_MKL_H', None), ('HAVE_CBLAS', None)]
    include_dirs = ['/Users/jon/opt/anaconda3/envs/oreum_template/include']
Supported SIMD extensions in this NumPy install:
    baseline = SSE,SSE2,SSE3
    found = SSSE3,SSE41,POPCNT,SSE42,AVX,F16C,FMA3,AVX2,AVX512F,AVX512CD,AVX512_SKX,AVX512_CLX,AVX512_CNL,AVX512_ICL
    not found = AVX512_KNL    
```

#### 3.1.2 numpy

```zsh
$> python -c "import numpy as np; np.test()"
```

Example output...

```zsh
-- Docs: https://docs.pytest.org/en/stable/warnings.html
========================================================================================================================================================================= short test summary info ==========================================================================================================================================================================
FAILED distutils/tests/test_system_info.py::TestSystemInfoReading::test_overrides - AssertionError: assert ['/Users/jon/...ep-model/lib'] == ['/var/folder.../tmpoqbcc85d']
ERROR f2py/tests/test_module_doc.py::TestModuleDocString::test_module_docstring - ImportError: dlopen(/var/folders/53/4yp0hxld5ysc7b5_fq7rxsy00000gn/T/tmpfpcj431r/_test_ext_module_5418.cpython-39-darwin.so, 2): Symbol not found: __gfortran_os_error_at
1 failed, 15521 passed, 84 skipped, 1253 deselected, 19 xfailed, 3 xpassed, 1 warning, 1 error in 198.12s (0:03:18)
```

#### 3.1.3 scipy

```zsh
$> python -c "import scipy as sp; sp.test()"
```

Example output...

```zsh
-- Docs: https://docs.pytest.org/en/stable/warnings.html
================================================================================================================================== 32765 passed, 2098 skipped, 11134 deselected, 105 xfailed, 9 xpassed, 41 warnings in 435.04s (0:07:15) ==================================================================================================================================

```

#### 3.1.4 pymc3

```zsh
$> python -c "import pymc3 as pm; pm.test()"
```

This takes a while and involves a lot of writing model runs to STDOUT. Let it
run, this is important to confirm tests pass.

Example output...

```zsh
Ran 1132 tests in 3613.540s
```

---

## 4. Data Standards

See `data/README_DATA.md`

---

## 5. Notebook Standards

General best practices for naming / ordering / structure:

+ Every Notebook is:
    + Designed to be fully executable end-to-end
    + Designed to behave as living documentation
    + Named starting with a 3-digit reference with group-based ordering to
    indicate logical flow, e.g:
        + `000` series: Overview, discussion, presentational documents
        + `100` series: Data Curation
        + `200` series: Exploratory Data Analysis
        + `300` series: Model Architecture and Data Transformations
        + `400` series: Model Execution, Evaluation and Inference
        + `500` series: Model Prediction
        + `600`, `700`, `800` series: used for specific extensions if needed
        + `900` series: Demos, Notes, Worked Explanations
+ Live Notebooks are:
    + Present in the root project directory `/`
    + Part of the final R&D project flow, and required in order to reproduce
    the eventual findings & observations
    + Guaranteed to be up to date with the latest code in `src/`
+ Rendered Notebooks are:
    + Present as rendered PDFs in `notebook_renders/`
+ Archived Notebooks are:
    + Present in `notebook_archive/`
    + No longer required except for historical review and comparison
    + May have fallen behind the latest local code and/or methods

---

## 6. Code Standards

This is primarily a Research & Development (R&D) project, but we strive to meet
and exceed (even define) best practices for code quality, documentation and
reproducibility for modern data science projects.

Preferred structure:

+ `config/` for config files
+ `sql/` for SQL files
+ `src/` for all other code, usually Python custom functions & classes, e.g.

```zsh
src/
    calc.py      # custom calc utils 
    curate.py    # custom data curation utils
    model.py     # assuming this is a pymc3 modelling project, models go here
```

Best practices to make this project usable by all (developer, statstician, biz):

+ Logical structuring of code files with modularization and reusability
+ Small purposeful classes with abstracted object inheritance,
and terse single-purpose functions
+ Variable and data parameterization throughout and use of config files to
inject globals
+ Informative naming for classes / functions / variables / data, and
human-readable code
+ Specific and general error handling
+ Logging with rotation / archival
+ Detailed docstrings and type-hinting
+ Inline comments to explain complicated code / concepts to developers
+ Adherence to a consistent style guide and syntax, and use of linters
+ Well-organized Notebooks with logical ordering and “run-all” internal flow,
and plenty of explanatory text and commentary to guide the reader
+ Use of virtual environments and/or containers
+ Build scripts for continuous integration and deployment
+ Unit tests and automated test scripts
+ Documentation to allow full reproducibility and maintenance
+ Commits have meaningful messages and small, iterative, manageable diffs to
allow code review
+ Adherence to conventional branching structures and management of stale
branches
+ Merges into master managed via pull requests (PRs) comprised of specific
commits, and the PR linked to specific issue tickets
+ PRs setup to trigger manual code reviews and automated hooks to code
formatting, unit testing, continuous integration (inc. automated integration
and regression testing) and continuous deployment
+ New releases managed with tagging, fixed binaries, changelogs

---

## 7. General Notes

None

---
Oreum OÜ &copy; 2022
