#!/bin/bash
echo "Sourcing conda.sh..."
. /app/conda/etc/profile.d/conda.sh
echo "Acivating base conda env..."
conda activate r-env
echo "Running Jupyter Notebook..."
jupyter notebook --config="~/.jupyter/jupyter_notebook_config.py"
