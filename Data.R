#####################
### Preliminaries ###
#####################
# Clearing workspace
rm(list = ls())

# Loading source code
require(openair)
require(tidyverse)

#######################
### Reading in data ###
#######################
# Getting London monitors
sites <- importMeta(all = TRUE) %>%
  # Filter for specific sites
  filter(site %in% c("London Marylebone Road", "London N. Kensington")) %>%
  # Removing duplicates
  unique()

# Downloading pollutant/weather data
dat <- importAURN(site = unique(sites$code),
                  year = 2021:2023,
                  meta = FALSE,
                  data_type = 'hourly',
                  verbose = FALSE) 

######################
### Saving dataset ###
######################
# Saving database 
write_csv(dat, 
          file = paste('London2_21_23.csv', sep = ''))
write_csv(sites, 
          file = paste('GL_metadata.csv', sep = ''))











