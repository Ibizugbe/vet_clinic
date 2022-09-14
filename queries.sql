/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered IS TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name IN ('Gabumon') = FALSE;
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
UPDATE animals  SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;

UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;

UPDATE ANIMALS  SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(id) FROM animals;
SELECT COUNT(id) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;