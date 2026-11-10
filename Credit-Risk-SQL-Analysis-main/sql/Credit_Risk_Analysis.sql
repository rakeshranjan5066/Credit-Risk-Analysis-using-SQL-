-- Credit Risk Analysis using SQL
-- Dataset: credit_risk_dataset.csv
-- Suggested table name: credit_risk
--
-- Notes:
-- loan_status = 1 means the loan defaulted
-- loan_status = 0 means the loan did not default

------------------------------------------------------------
-- Business Question 1:
-- How many loans are included in the portfolio?
------------------------------------------------------------

SELECT
    COUNT(*) AS total_loans
FROM credit_risk;


------------------------------------------------------------
-- Business Question 2:
-- What percentage of loans defaulted?
------------------------------------------------------------

SELECT
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaulted_loans,
    SUM(CASE WHEN loan_status = 0 THEN 1 ELSE 0 END) AS non_defaulted_loans,
    ROUND(
        SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate_pct
FROM credit_risk;


------------------------------------------------------------
-- Business Question 3:
-- Which loan grades have the highest default rates?
------------------------------------------------------------

SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaulted_loans,
    ROUND(
        SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate_pct
FROM credit_risk
GROUP BY loan_grade
ORDER BY default_rate_pct DESC;


------------------------------------------------------------
-- Business Question 4:
-- Which loan purposes are more associated with default?
------------------------------------------------------------

SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaulted_loans,
    ROUND(
        SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate_pct
FROM credit_risk
GROUP BY loan_intent
ORDER BY default_rate_pct DESC;


------------------------------------------------------------
-- Business Question 5:
-- How do income, loan amount, and interest rate differ
-- between defaulted and non-defaulted loans?
------------------------------------------------------------

SELECT
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(AVG(person_income), 2) AS avg_income,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate
FROM credit_risk
GROUP BY loan_status
ORDER BY loan_status;


------------------------------------------------------------
-- Business Question 6:
-- How do home ownership and previous default history
-- relate to loan status?
------------------------------------------------------------

SELECT
    person_home_ownership,
    cb_person_default_on_file,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaulted_loans,
    ROUND(
        SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate_pct
FROM credit_risk
GROUP BY person_home_ownership, cb_person_default_on_file
ORDER BY default_rate_pct DESC;


------------------------------------------------------------
-- Business Question 7:
-- How can borrowers be grouped into simple risk-related
-- segments using CASE WHEN statements?
------------------------------------------------------------

SELECT
    CASE
        WHEN person_income < 30000 THEN 'Low income'
        WHEN person_income >= 30000 AND person_income < 70000 THEN 'Middle income'
        ELSE 'High income'
    END AS income_band,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate,
    ROUND(
        SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate_pct
FROM credit_risk
GROUP BY
    CASE
        WHEN person_income < 30000 THEN 'Low income'
        WHEN person_income >= 30000 AND person_income < 70000 THEN 'Middle income'
        ELSE 'High income'
    END
ORDER BY default_rate_pct DESC;


------------------------------------------------------------
-- Business Question 8:
-- Are there missing values in key fields that should be
-- reviewed before deeper analysis?
------------------------------------------------------------

SELECT
    SUM(CASE WHEN person_age IS NULL THEN 1 ELSE 0 END) AS missing_person_age,
    SUM(CASE WHEN person_income IS NULL THEN 1 ELSE 0 END) AS missing_person_income,
    SUM(CASE WHEN person_emp_length IS NULL THEN 1 ELSE 0 END) AS missing_emp_length,
    SUM(CASE WHEN loan_amnt IS NULL THEN 1 ELSE 0 END) AS missing_loan_amount,
    SUM(CASE WHEN loan_int_rate IS NULL THEN 1 ELSE 0 END) AS missing_interest_rate,
    SUM(CASE WHEN loan_status IS NULL THEN 1 ELSE 0 END) AS missing_loan_status
FROM credit_risk;
