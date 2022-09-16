/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(250),
    age INT
);

CREATE TABLE species (
    Id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);


CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    age INT,
    date_of_graduation DATE,
    primary key (id)
);

CREATE TABLE specializations(
    vets_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id)
);

CREATE TABLE visits(
    vets_id INT REFERENCES vets(id),
    animals_id INT REFERENCES animals(id),
    visit_date DATE
);