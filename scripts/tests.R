# Load required libraries
library(tidyverse)
library(testthat)

# Load the data
raw_product_data <- read_csv("data/raw_data/Raw_Grocer_Product_Data.csv")
cleaned_price_data <- read_csv("data/cleaned_data/Cleaned_Price_Data_Monster.csv")
count_data <- read_csv("data/cleaned_data/Monster_energy_count_vendor.csv")

# Define test functions for the actual data
test_actual_data <- function() {
  
  # Test 1: Check columns in raw_product_data
  test_that("Raw product data contains required columns", {
    expect_true(all(c("id", "concatted", "vendor", "product_name", 
                      "units", "brand", "detail_url", "sku", "upc") %in% colnames(raw_product_data)))
  })
  
  # Test 2: Check for missing values in raw_product_data
  test_that("Raw product data does not contain missing values in critical columns", {
    expect_false(any(is.na(raw_product_data$id)))
    expect_false(any(is.na(raw_product_data$vendor)))
    expect_false(any(is.na(raw_product_data$product_name)))
  })
  
  # Test 3: Check columns in cleaned_price_data
  test_that("Cleaned price data contains required columns", {
    expect_true(all(c("product_id", "nowtime", "current_price", 
                      "normalized_price", "vendor") %in% colnames(cleaned_price_data)))
  })
  
  # Test 4: Check for valid vendors in cleaned_price_data
  test_that("Vendors in cleaned_price_data match valid vendor names", {
    valid_vendors <- c("Voila", "Galleria", "Loblaws", "Metro", "No Frills", "Save On Foods", "Walmart")
    expect_true(all(cleaned_price_data$vendor %in% valid_vendors))
  })
  
  # Test 5: Check for valid price ranges in cleaned_price_data
  test_that("Prices in cleaned_price_data are within reasonable ranges", {
    expect_true(all(cleaned_price_data$current_price >= 0))
    expect_true(all(cleaned_price_data$normalized_price >= 0))
  })
  
  # Test 6: Check columns in count_data
  test_that("Count data contains required columns", {
    expect_true(all(c("grocer_name", "monster_energy_count") %in% colnames(count_data)))
  })
  
  # Test 7: Check for valid grocer names in
  