SELECT *
FROM customer;

--Total customers
SELECT COUNT(*) AS total_customers
FROM customer;

--Churn distribution
SELECT "Churn", COUNT(*) AS customer_count
FROM customer
group by "Churn";

--Churn percentage
SELECT
    "Churn",
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer),
        2
    ) AS percentage
FROM customer
GROUP BY "Churn";

--Churn vs Contract
SELECT "Churn","Contract",COUNT(*) AS total_customers
FROM customer
GROUP BY "Churn", "Contract"
ORDER BY "Contract";

--Churn rate by contract
SELECT
    "Contract",
    ROUND(
        SUM(CASE WHEN "Churn"='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS churn_rate
FROM customer
GROUP BY "Contract";

--Do customers who churn pay more?
SELECT
    "Churn",
    AVG("MonthlyCharges") AS avg_monthly_charge
FROM customer
GROUP BY "Churn";

--Do long-term customers churn less?
select "Churn", ROUND(AVG("tenure"),2) As avg_tenure
from customer
group by "Churn";

--
SELECT
    "PaymentMethod",
    "Churn",
    COUNT(*) AS customers
FROM customer
GROUP BY     "PaymentMethod", "Churn"
ORDER BY     "PaymentMethod" ;

SELECT
    "InternetService",
    ROUND(
        SUM(CASE WHEN "Churn"='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS churn_rate
FROM customer
GROUP BY "InternetService"
ORDER BY churn_rate DESC;
