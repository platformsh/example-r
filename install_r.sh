#!/bin/bash

###########################
# Install conda...
###########################

# Download the latest Miniconda3 release and name the file `conda.sh`
#
# Miniconda is a standalone package manager, while Anaconda is the package manager
# plus a large selection of bundled packages. Because we want R packages rather
# than Python packages, we will just use Miniconda to get the package manager.
# If you wish to install Anaconda instead of Miniconda, replace the URL below as needed.
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
echo "conda activate" >> ~/.bash_profile

###########################
# Configure conda...
###########################

# Enter the base conda environment and prepare to configure it
conda activate base

# Update conda itself
conda update -n base -c defaults conda

# Print out debugging information
# conda info

###########################
# Install R
###########################

# Based on the instructions given here: https://docs.anaconda.com/anaconda/user-guide/tasks/use-r-language/#creating-a-new-environment-with-r-instead-of-mro
#
# NOTE: When using conda to install R packages, you will need to add r- before
# the regular CRAN or MRAN name. For instance, if you want to install rbokeh,
# you will need to use `conda install r-rbokeh`.
#
# NOTE: MRO is not currently compatible with Debian, so vanilla R should be installed.
#
# `conda create` is used to create a new virtual environment for package installation
#
# The `-n` flag gives the environment its name.
# `r-base` installs the bare minimum necessary to run R.
# `r-essentials` installs over 400 of the most commonly used R packages
conda create -n r-env r-essentials r-base

# Activate the freshly created environment
conda activate r-env

# Install additional packages if desired
# conda install r-rbokeh

# List the packages that were installed in this environment
conda list
