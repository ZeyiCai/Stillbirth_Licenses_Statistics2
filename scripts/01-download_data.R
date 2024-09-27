#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Zeyi Cai
# Date: 23 September 2024 
# Contact: zcloris.cai@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
# Install necessary packages
install.packages("opendatatoronto")
install.packages("tidyverse")
library(opendatatoronto)
library(tidyverse)

# Retrieve a list of all available data packages from the OpenDataToronto portal
packages <- list_packages(500)
# Display the list of available packages
packages

#### Download data ####
# Search for a specific package on OpenDataToronto by keyword ("Stillbirth Registration Statistics")
stillbirth_regist_packages <- search_packages("Stillbirth Registration Statistics")
stillbirth_regist_packages
# Retrieve a list of all resources (datasets) available within the found package
stillbirth_regist_resources <- stillbirth_regist_packages %>%
  list_package_resources()
# Display the list of resources available in the "Stillbirth Registration Statistics" package
stillbirth_regist_resources

#### Save data ####
# Download the .csv dataset
stillbirth_regist_statistics <- stillbirth_regist_resources[2,] %>%
  get_resource()
stillbirth_regist_statistics

write_csv(stillbirth_regist_statistics, "data/raw_data/raw_data.csv")


