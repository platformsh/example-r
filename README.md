# Platform.sh Jupyter Notebook Server example with R

This repository serves as an example of how to use R on Platform.sh.

This project spins up a Jupyter Notebook server with has both Python and R kernels available.

## ⚠ WARNING ⚠  DO NOT USE AS-IS IN PRODUCTION ⚠ WARNING ⚠

***This project should never be used for a production site in its current state.*** It has no individual user access control, and the notebooks will be deleted and replaced with the default sample notebooks on a daily basis. Jupyter Notebook is not intended for multi-user sites.

**If you wish to use this project to run a personal, single-user instance of Jupyter Notebook on Platform.sh,** make sure to properly set the authentication settings in the `default_config.py` file. The current state is a wide open Notebook that should be protected with Platform.sh's built in HTTP access control settings.

**If you wish to use this as a base template for an R project, please modify the `start_command.sh` file to remove the `jupyter notebook` command.**

# Summary

This project can demonstrate how an R environment can be configured on Platform.sh. Jupyter Notebook is used as a running example, but any arbitrary R packages can be run this way.

- In `.platform.app.yaml`, the `build` hook runs an `install_r.sh` file using Bash.
- In `install_r.sh`, a Conda package management environment is configured and R is installed.
- In `start_command.sh`, the Conda virtual environment configured in the build hook is activated prior to running the public-facing web server.
