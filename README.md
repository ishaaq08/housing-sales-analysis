# About the Project

- The project was concerned with the **House Property Sales Time Series** data consisting of 25,000 rows as provided by [Kaggle](https://www.kaggle.com/datasets/htagholdings/property-sales).
- The RDBMS employed was Microsoft SQL Server utilising the T-SQL syntax. 

# Analysis

the analysis focused on answering 4 main questions:

1. Which date corresponds to the highest number of sales?
2. Find out the postcode with the highest average price per sale? (Using Aggregate Functions)
3. Which year witnessed the lowest number of sales?
4. Use the window function to deduce the top six postcodes by year's price.

# Methodology           

- The analysis commenced through downloading the CSV file.
- As a **BULK INSERT** was used, the table was first created ensuring that the column names and table format were congruent with the csv format.
- Once the data was extracted and loaded into the database the analysis could take place.

The techniqiues used throughout this project include:
- Aggregate functions: MAX, COUNT
- BULK INSERT
- Window Functions: RANK() 
