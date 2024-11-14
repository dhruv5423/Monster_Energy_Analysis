SELECT 
    product_id,
    nowtime,
    current_price
FROM 
    raw
WHERE 
    product_id IN (3899159, 3220004, 2770361, 2231150, 1161730, 881266, 693972)
ORDER BY 
    product_id, nowtime;
