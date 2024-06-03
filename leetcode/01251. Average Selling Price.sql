SELECT p.product_id, COALESCE(ROUND(SUM(p.price::numeric * us.units::numeric) / SUM(us.units), 2),0) as average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS us ON p.product_id = us.product_id
    AND (us.purchase_date BETWEEN p.start_date AND p.end_date)
GROUP BY p.product_id;