# Platform.sh Jupyter Notebook Server example with R

This repository serves as a (for now, internal) example of how to use R on Platform.sh.

This project spins up a Jupyter Notebook server with has both Python and R kernels available.

# ⚠ WARNING: SAMPLE ONLY ⚠

This project should never be used for a production site in its current state. It has no individual
user access control, and the notebooks will be deleted and replaced with the default sample
notebooks on a daily basis.

The key points to look at here for using this as an R example are the build hook in `.platform.app.yaml`
and the installation script at `install_r.sh`.
