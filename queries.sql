/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN 'Jan 1, 2016' AND 'DEC 31, 2019';

SELECT name from animals WHERE neutered= TRUE AND  escape_attemps < 3;

SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT (name, escape_attemps) from animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = TRUE;

SELECT * from animals WHERE name != 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*
update animals table: DAY 2
*/

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attemps = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT count(escape_attemps), neutered FROM animals GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg), spicies FROM animals GROUP BY spicies;
SELECT AVG(escape_attemps), spicies FROM animals WHERE date_of_birth BETWEEN 'Jan 1, 1990' AND 'Dec 31, 2000' GROUP BY spicies;
