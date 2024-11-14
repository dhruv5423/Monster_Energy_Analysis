SELECT 
    product_id,
    nowtime,
    current_price,
    CASE
        WHEN current_price LIKE '%/%' THEN 
            CAST(SUBSTR(current_price, INSTR(current_price, '/') + 2) AS REAL) / 
            CAST(SUBSTR(current_price, 1, INSTR(current_price, '/') - 1) AS REAL)
        ELSE 
            CAST(current_price AS REAL)
    END AS normalized_price
FROM 
    raw
WHERE 
    product_id IN (3899159, 3220004, 2770361, 2231150, 1161730, 881266, 693972)
ORDER BY 
    product_id, nowtime;
