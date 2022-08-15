/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN 'Jan 1, 2016' AND 'DEC 31, 2019';

SELECT name from animals WHERE neutered= TRUE AND  escape_attemps < 3;

SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT (name, escape_attemps) from animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = TRUE;

SELECT * from animals WHERE name != 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
