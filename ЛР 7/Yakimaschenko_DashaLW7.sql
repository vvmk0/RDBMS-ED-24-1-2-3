use WebStor ;

--Task 1--
SELECT DISTINCT O.MFR
FROM dbo.CUSTOMERS AS C
INNER JOIN dbo.ORDERS AS O
ON C.CUST_NUM = O.CUST
WHERE C.COMPANY LIKE '%CORP%'
  AND YEAR(O.ORDER_DATE) = 2008;



--Task 2--
SELECT 
    C.CUST_NUM,
    MONTH(O.ORDER_DATE) AS OrderMonth,
    COUNT(DISTINCT O.ORDER_NUM) AS UniqueOrders
FROM dbo.CUSTOMERS AS C
LEFT JOIN dbo.ORDERS AS O
ON C.CUST_NUM = O.CUST
WHERE (C.COMPANY LIKE '%CORP%' AND YEAR(O.ORDER_DATE) = 2008)
   OR O.ORDER_DATE IS NULL
GROUP BY C.CUST_NUM, MONTH(O.ORDER_DATE)
ORDER BY UniqueOrders DESC;



--Task 3--
SELECT 
    C.CUST_NUM,
    UPPER(C.COMPANY) AS COMPANY_NAME,
    P.DESCRIPTION
FROM dbo.CUSTOMERS AS C
LEFT JOIN dbo.ORDERS AS O
ON C.CUST_NUM = O.CUST
LEFT JOIN dbo.PRODUCTS AS P
ON O.[PRODUCT] = P.PRODUCT_ID
WHERE (C.COMPANY LIKE '%CORP%' AND YEAR(O.ORDER_DATE) = 2008)
   OR O.ORDER_DATE IS NULL;
