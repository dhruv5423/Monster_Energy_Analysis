library(dplyr)
library(knitr)
library(kableExtra)

# Rename the columns to more user-friendly names
cleaned_price_data <- cleaned_price_data %>%
  rename(
    `Product ID` = product_id,
    `Date & Time` = nowtime,
    `Current Price` = current_price,
    `Normalized Price` = normalized_price,
    `Vendor` = vendor
  )

# Display the table with updated column names
head(cleaned_price_data, 2) %>%
  kable(caption = "Sample of Cleaned Price Data with Updated Column Names") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"))