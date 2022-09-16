/* Populate database with sample data. */

insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8.0);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Picachu', '2021-01-07', 1, FALSE, 15.04);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', '2017-05-12', 2, TRUE, 11.0);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(5, 'Charmande', '2020-02-08', 0, FALSE, -11);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(6, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(7, 'Plantmon', '2021-11-15', 2, TRUE, -5.7);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(8, 'Angemon', '2005-06-12', 1, TRUE, -45);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES(9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES(10, 'Blossom', '1998-10-13', 3, TRUE, 17);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(11, ' Ditto', '2022-05-14', 4, TRUE, 22);
INSERT INTO owners(id, full_name, age) VALUES(1, 'Sam Smith', 34);

UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name = 'Gabumon' OR name = 'Picachu';
UPDATE animals SET owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
INSERT INTO species(name, id) VALUES('pokemon', 1);
INSERT INTO species(name, id) VALUES('digimon', 2);
INSERT INTO owners(id, full_name, age) VALUES(1, 'Sam Smith', 34);
INSERT INTO owners(id, full_name, age) VALUES(2, 'Jennifer Orwel', 19);
INSERT INTO owners(id, full_name, age) VALUES(3, 'Bob', 45);
INSERT INTO owners(id, full_name, age) VALUES(4, 'Melody Pond', 77);
INSERT INTO owners(id, full_name, age) VALUES(5, 'Dean Winchester', 14);
INSERT INTO owners(id, full_name, age) VALUES(6, 'Jodie Whittaker', 38);


INSERT INTO vets(id, name, age, date_of_graduation)
VALUES(1, 'William Tatcher', 45, '2020-04-23');
INSERT INTO vets(id, name, age, date_of_graduation)
VALUES(2, 'Maisy Smith', 26, '2019-01-17');
INSERT INTO vets(id, name, age, date_of_graduation)
VALUES(3, 'Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets(id, name, age, date_of_graduation)
VALUES(4, 'Jack Harkness', 38, '2008-06-08');