/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

\c vet_clinic;

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(250),
  date_of_birth date,
  escape_attemps INT,
  neutered boolean,
  weight_kg float
);

/* 
update table to add column: DAY 2
*/

ALTER TABLE animals ADD spicies varchar(250) NULL;

/*
  Vet clinic database: query multiple tables: DAY 3
*/

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  fulll_name varchar(250) not NULL,
  age INT
);

CREATE TABLE spicies(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(250) not NULL
);

ALTER TABLE animals DROP spicies;

ALTER TABLE animals ADD spicies_id INT REFERENCES spicies(id);
ALTER TABLE animals ADD  owner_id  INT REFERENCES owners(id);


/*
  Vet clinic database: add "join table" for visits: DAY 4
*/

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(250),
  age INT,
  date_of_graduation date
);

CREATE TABLE specializations(
  vet_id INT NOT NULL,
  spicies_id INT NOT NULL,
  PRIMARY KEY(vet_id, spicies_id)
);

CREATE TABLE visits(
  vet_id INT NOT NULL,
  animal_id INT NOT NULL,
  date_of_visit date NOT NULL,
  PRIMARY KEY(vet_id, animal_id, date_of_visit)
);

ALTER TABLE visits ADD FOREIGN KEY(animal_id) REFERENCES animals(id);
ALTER TABLE visits ADD FOREIGN KEY(vet_id) REFERENCES vets(id);

ALTER TABLE specializations ADD FOREIGN KEY(spicies_id) REFERENCES spicies(id);
ALTER TABLE specializations ADD FOREIGN KEY(vet_id) REFERENCES vets(id);


/*
  Vet clinic database: database performance audit: group work DAY 1
*/

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
