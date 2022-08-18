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

/*
  Vet clinic database: query multiple tables: DAY 3
*/

SELECT owners.fulll_name, animals.name animals FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.fulll_name = 'Melody Pond';
SELECT animals.name animals FROM animals JOIN spicies ON animals.spicies_id = spicies.id WHERE spicies.name = 'Pokemon';
SELECT owners.fulll_name owners, animals.name animals FROM owners LEFT JOIN animals ON animals.spicies_id = owners.id;
SELECT spicies.name spicies, COUNT(animals.name) FROM animals JOIN spicies ON animals.spicies_id = spicies.id GROUP BY spicies.name;
SELECT animals.name animals FROM animals JOIN owners ON animals.owner_id = owners.id JOIN spicies ON spicies.id = animals.spicies_id WHERE owners.fulll_name = 'Jennifer Orwell' AND spicies.name = 'Digimon';
SELECT animals.name animals FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.fulll_name = 'Dean Winchester' AND animals.escape_attemps = 0;
SELECT owners.fulll_name owners, count(animals.name) FROM owners JOIN animals ON animals.owner_id = owners.id GROUP BY owners.fulll_name ORDER BY COUNT(animals.name) DESC LIMIT 1;

/*
  Vet clinic database: add "join table" for visits: DAY 4
*/

SELECT LAST(animals.name) animal FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE Vet.name = 'William Tatcher';

SELECT COUNT(animals.name) animals FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE Vet.name = 'Stephanie Mendez' GROUP BY animals.name;

SELECT vet.id, vet.name vet_name, vet.age vet_age, vet.date_of_graduation vet_date_of_graduation , spicies.name specializations_animal  FROM vet LEFT JOIN specializations ON vet.id = specializations.vet_id LEFT JOIN spicies ON specializations.spicies_id = spicies.id;

SELECT animals.name animals FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vet ON vet.id = visits.vet_id WHERE vet.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN 'April 1, 2020' AND 'August 30, 2020';

SELECT animals.name animals, COUNT(animals.name) visited_times FROM animals JOIN visits.animal_id = animals.id JOIN vet ON vet.id = visits.vet_id GROUP BY animals.name;

SELECT FIRST(animals.name) animal FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE Vet.name = 'Maisy Smith';







SELECT vet.id, vet.name vet_name, vet.age vet_age, vet.date_of_graduation vet_date_of_graduation , spicies.name specializations_animal  FROM vet LEFT JOIN specializations ON vet.id = specializations.vet_id LEFT JOIN spicies ON specializations.spicies_id = spicies.id;

