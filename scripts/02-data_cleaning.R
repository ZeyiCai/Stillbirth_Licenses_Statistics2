#### Preamble ####
# Purpose: Cleans the raw stillbirth data into an analysis dataset
# Author: Zeyi Cai
# Date: 23 September 2024 
# Contact: zcloris.cai@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
# Cleaning the dataset
cleaned_data <- stillbirth_regist_statistics %>%
  # Select relevant columns
  select(CIVIC_CENTRE, STILLBIRTH_LICENSES, TIME_PERIOD) %>%
  # Convert TIME_PERIOD to Date type (assuming monthly data)
  mutate(TIME_PERIOD = as.Date(paste0(TIME_PERIOD, "-01"),
                               format="%Y-%m-%d")) %>%
  # Remove rows with missing values if any
  drop_na()

# View the cleaned dataset (optional)
head(cleaned_data)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

