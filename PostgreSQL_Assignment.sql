-- Active: 1747646679115@@127.0.0.1@5432@conservation_db
CREATE DATABASE conservation_db;

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name TEXT,
    region TEXT
);

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name TEXT,
    scientific_name TEXT,
    discovery_date DATE,
    conservation_status Text
);
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    species_id INT,
    FOREIGN KEY (species_id) REFERENCES species (species_id),
    ranger_id INT, 
    FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id),
    location TEXT,
    sighting_time DATE,
    notes TEXT
);

INSERT INTO rangers(ranger_id, name, region)
VALUES (1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

INSERT INTO species(species_id,common_name,scientific_name,discovery_date,conservation_status)
VALUES (1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger' , 'Panthera tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus','1758-01-01', 'Endangered');

INSERT INTO sightings(sighting_id, species_id, ranger_id, location, sighting_time, notes)
VALUES (1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-- Problem-01
INSERT INTO rangers(ranger_id,name, region)
VALUES(4,'Derek Fox', 'Coastal Plains');

-- Problem-02
SELECT count(DISTINCT species_id) as unique_species_count FROM sightings;

-- Problem-03
SELECT * from sightings
    WHERE location LIKE '%Pass%';



-- Problem-04
Select name,count(*) as total_sightings from sightings
 JOIN rangers USING(ranger_id)
 GROUP BY name;
