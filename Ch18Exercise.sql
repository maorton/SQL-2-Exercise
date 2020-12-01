CREATE TABLE plant (
	plant_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    plant_name VARCHAR(100),
    zone INTEGER,
    season VARCHAR(20)
);

CREATE TABLE seeds (
	seed_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    expiration_date DATE,
    quantity INTEGER,
    reorder BOOL,
    plant_id INTEGER,
    FOREIGN KEY(plant_id) REFERENCES plant(plant_id)
);

CREATE TABLE garden_bed (
	space_number INTEGER PRIMARY KEY AUTO_INCREMENT,
    date_planted DATE,
    doing_well BOOL,
    plant_id INTEGER,
    FOREIGN KEY(plant_id) REFERENCES plant(plant_id)
);

SELECT garden_bed.plant_id
FROM seeds
INNER JOIN garden_bed ON seeds.plant_id = garden_bed.plant_id
WHERE quantity > 0;

SELECT seeds.plant_id
FROM seeds
LEFT JOIN garden_bed ON seeds.plant_id = garden_bed.plant_id
WHERE quantity > 0;

SELECT garden_bed.plant_id
FROM garden_bed
RIGHT JOIN seeds ON garden_bed.plant_id = seeds.plant_id
WHERE quantity > 0;

SELECT * FROM seeds LEFT JOIN garden_bed ON seeds.plant_id = garden_bed.plant_id
UNION
SELECT * FROM seeds RIGHT JOIN garden_bed ON seeds.plant_id = garden_bed.plant_id;