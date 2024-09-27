#### Preamble ####
# Purpose: Tests data
# Author: Zeyi Cai
# Date: 23 September 2024 
# Contact: zcloris.cai@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Test data ####
data <- read_csv("data/raw_data/raw_data.csv")
data <- read_csv("data/analysis_data/analysis_data.csv")

# Test for negative numbers
data$STILLBIRTH_LICENSES |> min() <= 0

# Test for NAs
all(is.na(data$STILLBIRTH_LICENSES))
