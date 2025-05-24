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
    ranger_id INT, 
    FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id),
    species_id INT, 
    FOREIGN KEY(species_id) REFERENCES species(species_id),
    location TEXT,
    sighting_time DATE,
    notes TEXT
);
