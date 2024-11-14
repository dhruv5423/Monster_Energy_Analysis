# Monster_Energy_Analysis
Investigation into Monster Energy products offered at various Canadian grocers and the price progression of their products.

## Overview

This repo provides the necessary code and files to replicate this Monster Energy Analysis for Canadian Grocers. The Raw Price Data file is over 550mb, and so was not included in this repo. Here is a link to download the raw price data, from Jacob Filipp as part of Project Hammer: https://jacobfilipp.com/hammer/. 

## File Structure 

This repo is structured as per the following:

- `data/raw_data` contains the Raw Product Data file, and the Raw Selection File, which filtrs the data for Monster Zero Ultra 473ml prodcuts.
- `data/cleaned_data` include the cleaned price data for the selected products, and was mutated to include a column of vendors associated with the products.
- `llm_usage` contains a text file disclosing the usage of ChatGPT Data Analayt to complete this project
- `paper` contains the qmd file and the references.bib file used to create a pdf output of the paper
- `scripts` include the SQL scripts executed in DB Browswer for SQLite to select and clean the data, as well as an R script used to mutate the cleaned price data to include vendors for each product

## Statement on LLM Usage: 
Aspects of this paper was written with the help of ChatGPT Data Analyst. The full chat history can be found in llm_usage/llm.txt. 
