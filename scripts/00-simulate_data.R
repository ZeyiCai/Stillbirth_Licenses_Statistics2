#### Preamble ####
# Purpose: Simulates data
# Author: Zeyi Cai
# Date: 23 September 2024 
# Contact: zcloris.cai@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

# Set seed for reproducibility
set.seed(500)

# Define the start and end date
start_date <- as.Date("2011-01-01")
end_date <- as.Date("2024-07-01")

# Set the number of random dates you want to generate
number_of_dates <- 143

data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_dates,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "2011-01-01"
    ),
    STILLBIRTH_LICENSES = rpois(n = number_of_dates, lambda = 10)
  )


#### Write_csv
write_csv(data, file = "raw_data.csv")





