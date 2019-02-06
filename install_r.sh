#!/bin/bash
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o conda.sh

echo "###########################"
echo "# Installing conda... #"
echo "###########################"

bash conda.sh -b -p $HOME/conda
# export PATH="/app/conda/bin:$PATH"

echo ". /app/conda/etc/profile.d/conda.sh" >> ~/.bash_profile
. /app/conda/etc/profile.d/conda.sh

echo "###########################"
echo "# Entering conda...   #"
echo "###########################"

conda activate base
conda update -n base -c defaults conda
conda info

echo "###########################"
echo "# Installing mro-base...  #"
echo "###########################"

conda create -n mro_env r-base

# echo "CAT activation file:"
# cat /app/conda/envs/mro_env/etc/conda/activate.d/activate-binutils_linux-64.sh
conda activate mro_env

echo "Installed R packages:"
conda list
