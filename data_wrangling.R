# Data wrangling for fish condition analysis

library(tidyverse)
library(hakaiApi)
library(here)

client <- hakaiApi::Client$new()
# Follow stdout prompts to get an API token
#it will link you to the internet, log in then paste the new long url into console.

# Make a data request for chlorophyll data
endpoint <- sprintf("%s/%s", client$api_root, "eims/views/output/chlorophyll?limit=-1")
#use "question mark" limit -1 to get all data entries here

chla <- client$get(endpoint)

write_csv(chla, here("read_data", "chla.csv"))

fish_endpoint <- sprintf("%s/%s", client$api_root, 'eims/views/output/jsp_fish?work_area%26%26{"QUADRA"}&limit=-1')
#use "and" limit -1 to get all data entries here

fish <- client$get(fish_endpoint)

write_csv(fish, here("read_data", "fish.csv"))

