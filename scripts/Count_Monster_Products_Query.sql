SELECT 
    vendor AS grocer_name,
    COUNT(*) AS monster_energy_count
FROM 
    product
WHERE 
    concatted LIKE '%Monster%' 
    AND (
        concatted LIKE '%Energy%' OR
        concatted LIKE '%Ultra%' OR
        concatted LIKE '%Java%' OR
        concatted LIKE '%Punch%' OR
        concatted LIKE '%Rehab%' OR
        concatted LIKE '%Zero%' OR
        concatted LIKE '%Assault%' OR
        concatted LIKE '%Pipeline%' OR
        concatted LIKE '%Reserve%' OR
        concatted LIKE '%Juice%' OR
        concatted LIKE '%Mega%' OR
        concatted LIKE '%Pacific%' OR
        concatted LIKE '%Peachy%' OR
        concatted LIKE '%Watermelon%' OR
        concatted LIKE '%Mango%' OR
        concatted LIKE '%Blue%' OR
        concatted LIKE '%Fiesta%' OR
        concatted LIKE '%Paradise%' OR
        concatted LIKE '%Gold%' OR
        concatted LIKE '%Rosa%' OR
        concatted LIKE '%Sunrise%' OR
        concatted LIKE '%Strawberry%'
    )
    AND concatted NOT LIKE '%Cookie%'
    AND concatted NOT LIKE '%Cereal%'
    AND concatted NOT LIKE '%Snack%'
    AND concatted NOT LIKE '%Mamee%'
    AND concatted NOT LIKE '%General Mills%'
    AND concatted NOT LIKE '%Betty Crocker%'
    AND concatted NOT LIKE '%Pillsbury%'
GROUP BY 
    vendor
ORDER BY 
    monster_energy_count DESC;
