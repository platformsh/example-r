# Platform.sh R Shiny Server example

This repository serves as an example of how to deploy R Shiny apps on Platform.sh.

This project spins up an example Shiny app using conda as a package manager.

# Summary

This project demonstrates how an R environment can be configured on Platform.sh. A Shiny app is served as a result, but any arbitrary R packages can be run this way.

- In `.platform.app.yaml`, the `build` hook runs an `install_r.sh` file using Bash.
- In `install_r.sh`, a Conda package management environment is configured and R is installed.
- In `start_command.sh`, the Conda virtual environment configured in the build hook is activated prior to running the public-facing web server.
- In `start_shinyapp.R` server configuration for the Shiny app is set and the Shiny app is run.
- the `shinyapp` folder contains the Shiny app according to the R Shiny standards.
