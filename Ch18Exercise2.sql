SELECT garden_bed.plant_id
FROM seeds
RIGHT JOIN garden_bed ON seeds.plant_id = garden_bed.plant_id
WHERE quantity > 0 

UNION

SELECT plant_name FROM plant
LEFT JOIN garden_bed ON plant.plant_id = garden_bed.plant_id;


INSERT INTO seeds
VALUES (3, '2020-08-05', 100, false, (SELECT plant_id FROM plant WHERE (plant_name LIKE 'Hosta')));