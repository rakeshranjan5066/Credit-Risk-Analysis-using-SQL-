# Credit Risk SQL Analysis

## Project Overview

This project analyzes a credit risk dataset using SQL. The goal is to practice foundational SQL while answering business-style questions about loan defaults, borrower profiles, loan grades, interest rates, and loan purpose.

## Dataset

The dataset used in this project is `credit_risk_dataset.csv`.

It contains:

- **32,581 records**
- **12 columns**
- borrower information such as age, income, home ownership, employment length, loan amount, loan interest rate, loan grade, loan purpose, default status, and credit history length

## Table Name Used

For the SQL queries, the CSV should be imported into a table named:

```sql
credit_risk
```

If your database uses a different table name, replace `credit_risk` in the queries with your actual table name.

## Columns Used

| Column | Description |
|---|---|
| `person_age` | Borrower age |
| `person_income` | Borrower annual income |
| `person_home_ownership` | Borrower home ownership status |
| `person_emp_length` | Employment length in years |
| `loan_intent` | Purpose of the loan |
| `loan_grade` | Loan grade assigned to the loan |
| `loan_amnt` | Loan amount |
| `loan_int_rate` | Loan interest rate |
| `loan_status` | Loan status, where `1` indicates default and `0` indicates non-default |
| `loan_percent_income` | Loan amount as a percentage of income |
| `cb_person_default_on_file` | Whether the borrower has a previous default on file |
| `cb_person_cred_hist_length` | Credit history length in years |

## Business Questions

This analysis answers questions such as:

1. How many loans are in the portfolio?
2. What percentage of loans defaulted?
3. Which loan grades have the highest default rates?
4. Which loan purposes are more associated with default?
5. How does income differ between defaulted and non-defaulted loans?
6. How do home ownership and previous default history relate to loan status?
7. How can borrowers be grouped using simple `CASE WHEN` statements?
8. Are there missing values that should be reviewed before deeper analysis?

## Key Dataset Checks

From the dataset review:

- Total records: **32,581**
- Overall default rate: **21.82%**
- Average income: **$66,074.85**
- Average loan amount: **$9,589.37**
- Average interest rate: **11.01%**
- Missing values exist in `person_emp_length` and `loan_int_rate`, so these fields should be reviewed before deeper analysis.

## SQL Skills Demonstrated

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- simple percentage calculations
- simple `CASE WHEN` statements
- basic data quality checks

## Project Structure

```text
Credit-Risk-SQL-Analysis/
├── README.md
├── data/
│   └── credit_risk_dataset.csv
├── sql/
│   └── Credit_Risk_Analysis.sql
```

## How to Use This Project

1. Create a table named `credit_risk` in your SQL database.
2. Import the file `credit_risk_dataset.csv` into that table.
3. Open `sql/Credit_Risk_Analysis.sql`.
4. Run each query one by one.
5. Review the comments above each query to understand the business question.

## Notes

This project is not intended to be a predictive model. It is a SQL analysis project focused on understanding borrower and loan patterns related to default risk.

## Possible Next Steps

Future improvements could include:

- creating a dashboard from the SQL outputs
- adding charts for default rate by loan grade and loan intent
- using Python to clean missing values and validate data quality
- expanding the project into a basic machine learning model after the SQL analysis is fully understood
