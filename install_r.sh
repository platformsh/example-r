#!/bin/bash

###########################
# Install conda...
###########################

# Download the latest Miniconda3 release and name the file `conda.sh`
#
# Miniconda is a standalone package manager, while Anaconda is the package manager
# plus a large selection of bundled packages. Because we want R packages rather
# than Python packages, we will just use Miniconda to get the package manager.
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o conda.sh

# Run the downloaded `conda.sh` script using bash
#
# — The `-b` flag runs the installer in batch mode, which automatically accepts the
# license agreement and makes no PATH modifications.
# — The `-p` flag specifies where the package manager will actually be installed
#
# More information on silent mode installation: https://conda.io/projects/conda/en/latest/user-guide/install/macos.html#installing-in-silent-mode
# (Note: In the above link, the `export PATH` command should not be included here.)
bash conda.sh -b -p $HOME/conda

# Sourcing this `conda.sh` file puts the `conda` command in our path for the
# duration of this script.
. /app/conda/etc/profile.d/conda.sh

# Add the above command to `.bash_profile` so that it is available during SSH sessions
echo ". /app/conda/etc/profile.d/conda.sh" >> ~/.bash_profile

###########################
# Configure conda...
###########################

# Enter the base conda environment and prepare to configure it
conda activate base

# Update conda itself
conda update -n base -c defaults conda

# Print out debugging information
conda info

###########################
# Install R
###########################

# Based on the instructions given here: https://docs.anaconda.com/anaconda/user-guide/tasks/use-r-language/#creating-an-environment-with-mro-and-r-essentials
#
# This installs MRO rather than vanilla R:
#
#    "Microsoft R Open is the enhanced distribution of R from Microsoft Corporation.
#    It is a complete open source platform for statistical analysis and data science.
#    The current version, Microsoft R Open 3.5.1, is based on (and 100% compatible with) R-3.5.1,
#    the most widely used statistics software in the world, and is therefore fully
#    compatibility with all packages, scripts and applications that work with that version of R."

# NOTE: When using conda to install R packages, you will need to add r- before
# the regular CRAN or MRAN name. For instance, if you want to install rbokeh,
# you will need to use `conda install r-rbokeh`.

# `conda create` is used to create a new virtual environment for package installation
#
# The `-n` flag gives the environment its name.
# `mro-base` installs the bare minimum necessary to run R.
# `r-essentials` installs over 400 of the most commonly used R packages
conda create -n mro_env r-essentials r-base

# Activate the freshly created environment
conda activate mro_env

# List the packages that were installed in this environment
conda list
