#!/bin/bash
. /app/conda/etc/profile.d/conda.sh
conda activate r-env
jupyter notebook --config="~/.jupyter/jupyter_notebook_config.py"
