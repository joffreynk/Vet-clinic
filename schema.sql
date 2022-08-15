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