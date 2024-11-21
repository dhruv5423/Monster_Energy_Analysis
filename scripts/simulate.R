# Load necessary libraries
library(tidyverse)
library(lubridate)
library(here)

# Simulate Raw Product Data
set.seed(123)  # For reproducibility
raw_product_data <- tibble(
  id = 1:1000,
  concatted = paste0("Vendor_", sample(LETTERS[1:5], 1000, replace = TRUE), "~Product_", sample(1:500, 1000, replace = TRUE)),
  vendor = sample(c("Walmart", "Metro", "No Frills", "Voila", "Galleria", "Save On Foods", "Loblaws"), 1000, replace = TRUE),
  product_name = paste0("Product_", sample(1:500, 1000, replace = TRUE)),
  units = paste0(sample(200:500, 1000, replace = TRUE), "ml"),
  brand = sample(c("Monster", "Generic Brand", "Premium Brand"), 1000, replace = TRUE),
  detail_url = paste0("http://example.com/product_", 1:1000),
  sku = sample(10000:99999, 1000, replace = TRUE),
  upc = sample(1000000:9999999, 1000, replace = TRUE)
)

# Simulate Price Data
product_ids <- c(693972, 881266, 1161730, 2231150, 2770361, 3220004, 3899159)

cleaned_price_data <- expand.grid(
  product_id = product_ids,
  nowtime = seq(ymd_hms("2024-06-01 00:00:00"), ymd_hms("2024-06-30 23:59:00"), by = "2 days")
) %>%
  mutate(
    current_price = round(runif(n(), 2.5, 5), 2),
    normalized_price = current_price,  # Add logic for normalization if needed
    vendor = case_when(
      product_id == 693972 ~ "Voila",
      product_id == 881266 ~ "Galleria",
      product_id == 1161730 ~ "Loblaws",
      product_id == 2231150 ~ "Metro",
      product_id == 2770361 ~ "No Frills",
      product_id == 3220004 ~ "Save On Foods",
      product_id == 3899159 ~ "Walmart"
    )
  )

# Simulate Monster Product Offerings Count
count_data <- tibble(
  grocer_name = c("Walmart", "Metro", "No Frills", "Voila", "Galleria", "Save On Foods", "Loblaws"),
  monster_energy_count = sample(10:60, 7, replace = TRUE)
)

# Save the Simulated Data
write_csv(raw_product_data, here("data", "simulated_data", "Simulated_Raw_Grocer_Product_Data.csv"))
write_csv(cleaned_price_data, here("data", "simulated_data", "Simulated_Cleaned_Price_Data_Monster.csv"))
write_csv(count_data, here("data", "simulated_data", "Simulated_Monster_Energy_Count.csv"))

