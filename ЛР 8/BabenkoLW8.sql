﻿SELECT CUST_NUM
FROM [dbo].[CUSTOMERS]
WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS]);

SELECT DISTINCT O.CUST
FROM [dbo].[ORDERS] O
WHERE O.CUST IN (
    SELECT C.CUST_NUM
    FROM [dbo].[CUSTOMERS] C
    WHERE C.CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS])
);

SELECT O.CUST
FROM [dbo].[ORDERS] O
WHERE O.ORDER_DATE = (
    SELECT MAX(O2.ORDER_DATE)
    FROM [dbo].[ORDERS] O2
    WHERE O2.CUST IN (
        SELECT C.CUST_NUM
        FROM [dbo].[CUSTOMERS] C
        WHERE C.CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS])
    )
)
AND O.CUST IN (
    SELECT C.CUST_NUM
    FROM [dbo].[CUSTOMERS] C
    WHERE C.CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS])
);
