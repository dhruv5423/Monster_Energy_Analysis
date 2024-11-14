# Load necessary libraries
library(dplyr)

# Load the cleaned_price_data CSV
cleaned_price_data <- read.csv("data/cleaned_data/Cleaned_Price_Data_Monster.csv")

# Define the mapping of product IDs to vendors
product_vendor_mapping <- c(
  "693972" = "Voila",
  "881266" = "Galleria",
  "1161730" = "Loblaws",
  "2231150" = "Metro",
  "2770361" = "No Frills",
  "3220004" = "Save On Foods",
  "3899159" = "Walmart"
)

# Add the vendor column to the dataframe
cleaned_price_data <- cleaned_price_data %>%
  mutate(vendor = recode(as.character(product_id), !!!product_vendor_mapping))

# Save the updated CSV
write.csv(cleaned_price_data, "data/cleaned_data/Cleaned_Price_Data_Monster.csv", row.names = FALSE)

# View a sample of the updated dataset
print(head(cleaned_price_data))
