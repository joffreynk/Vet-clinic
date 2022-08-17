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