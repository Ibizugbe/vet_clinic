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

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
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

UPDATE animals SET species_id = 1 WHERE species_id IS NULL;
UPDATE animals  SET species_id = 2 WHERE name LIKE '%mon%';

SELECT name, full_name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE full_name = 'Melody Pond';
SELECT A.name, S.name FROM animals A JOIN species S ON A.species_id = S.id WHERE S.name = 'pokemon';
SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owners_id = owners.id;
SELECT species.name, COUNT(animals.species_id) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species.name;
SELECT animals.name from animals JOIN owners ON owners.id = animals.owners_id JOIN species on species.id = animals.species_id WHERE animals.species_id = '2' AND animals.owners_id = '2';
SELECT animals.name from animals JOIN owners ON owners.id = animals.owners_id WHERE animals.escape_attempts = '0' AND animals.owners_id = '5';
SELECT full_name, COUNT(owners_id) FROM owners JOIN animals on owners.id = animals.owners_id GROUP BY full_name ORDER BY COUNT (owners_id) desc limit 1;



select * from animals where id = (select animals_id from visits where vets_id = 1 order by visit_date desc limit 1);
select count(distinct animals_id) from visits where vets_id = 3;
select V.name, S.species_id from vets V left join specializations S on V.id = S.vets_id;
select A.name from animals A join visits V on A.id = V.animals_id where V.vets_id = 3 and V.visit_date between '2020-04-01' and '2020-08-30';
select A.name, count(V.animals_id) from animals A join visits V on A.id = V.animals_id group by A.name order by count(V.animals_id) desc limit 1;
select A.name from animals A join visits V on A.id = V.animals_id where V.vets_id = 2 order by V.visit_date asc limit 1;
select A.name, V.visit_date, V.vets_id from animals A join visits V on a.id = V.animals_id order by V.visit_date desc limit 1;
select count(*) from visits V join specializations S on V.vets_id = S.vets_id where V.animals_id = S.species_id;
select S.species_id from specializations S join visits V on S.vets_id = V.vets_id where V.vets_id = 2 group by S.species_id order by count(S.species_id) desc limit 1;