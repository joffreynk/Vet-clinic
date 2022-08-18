/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Agumon', 'Feb 3, 2020', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Gabumon', 'Nov 15, 2018', 2, TRUE, 8);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Pikachu', 'Jan 7, 2021', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, TRUE, 11);

/*
update records: DAY 2
*/

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Charmander', 'Feb 8, 2020', 0, FALSE, -11);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Plantmon', 'Nov 15, 2021', 2, TRUE, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Squirtle', 'Apr 2, 1993', 3, FALSE, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Angemon', 'Jun 12, 2005', 1, TRUE, -45);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Boarmon', 'Jun 7, 2005', 7, TRUE, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Blossom', 'Oct 13, 1998', 3, TRUE, 17);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, TRUE, 22);

/*
  Vet clinic database: query multiple tables: DAY 3
*/

INSERT INTO owners (fulll_name, age) VALUES ('Sam Smith',34), ('Jennifer Orwell',19), ('Bob',45), ('Melody Pond',77), ('Dean Winchester', 14), ('Jodie Whittaker',38);

INSERT INTO spicies (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET spicies_id = (SELECT spicies.id FROM spicies WHERE spicies.name = 'Digimon') WHERE animals.name LIKE '%mon';
UPDATE animals SET spicies_id = (SELECT spicies.id FROM spicies WHERE spicies.name = 'Pokemon') WHERE animals.name NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.fulll_name = 'Sam Smith') WHERE animals.name = 'Agumon';
UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.fulll_name = 'Jennifer Orwell') WHERE animals.name = 'Gabumon' OR animals.name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.fulll_name = 'Bob') WHERE animals.name = 'Devimon' OR animals.name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.fulll_name = 'Melody Pond') WHERE animals.name = 'Charmander' OR animals.name = 'Squirtle' OR animals.name = 'Blossom';
UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.fulll_name = 'Dean Winchester') WHERE animals.name = 'Angemon' OR animals.name = 'Boarmon';


/*
  Vet clinic database: add "join table" for visits: DAY 4
*/

-- Add tada into vets table

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'Jun 8, 2008');

-- Add data into specializations table

INSERT INTO specializations (vet_id, spicies_id) VALUES (SELECT id FROM vets WHERE name = 'William Tatcher', SELECT id FROM spicies WHERE name = 'Pokemon');
INSERT INTO specializations (vet_id, spicies_id) VALUES (SELECT id FROM vets WHERE name = 'Stephanie Mendez', SELECT id FROM spicies WHERE name = 'Pokemon');
INSERT INTO specializations (vet_id, spicies_id) VALUES (SELECT id FROM vets WHERE name = 'Stephanie Mendez', SELECT id FROM spicies WHERE name = 'Digimon');
INSERT INTO specializations (vet_id, spicies_id) VALUES (SELECT id FROM vets WHERE name = 'Jack Harkness', SELECT id FROM spicies WHERE name = 'Digimon');

-- Add data into visits table

INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'William Tatcher', SELECT id FROM animals WHERE name = 'Agumon', 'May 24, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Stephanie Mendez', SELECT id FROM animals WHERE name = 'Agumon', 'Jul 22, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Jack Harkness', SELECT id FROM animals WHERE name = 'Gabumon', 'Feb 2, 2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Pikachu', 'Jan 5, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Pikachu', 'Mar 8, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Pikachu', 'May 14, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Stephanie Mendez', SELECT id FROM animals WHERE name = 'Devimon', 'May 4, 2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Jack Harkness', SELECT id FROM animals WHERE name = 'Charmander', 'Feb 24, 2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Plantmon', 'Dec 21, 2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'William Tatcher', SELECT id FROM animals WHERE name = 'Plantmon', 'Aug 10, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Plantmon', 'Apr 7, 2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Stephanie Mendez', SELECT id FROM animals WHERE name = 'Squirtle', 'Sep 29, 2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Jack Harkness', SELECT id FROM animals WHERE name = 'Angemon', 'Oct 3, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Jack Harkness', SELECT id FROM animals WHERE name = 'Angemon', 'Nov 4, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Boarmon', 'Jan 24, 2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Boarmon', 'May 15, 2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Boarmon', 'Feb 27, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Maisy Smith', SELECT id FROM animals WHERE name = 'Boarmon', 'Aug 3, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'Stephanie Mendez', SELECT id FROM animals WHERE name = 'Blossom', 'May 24, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (SELECT id FROM vets WHERE name = 'William Tatcher', SELECT id FROM animals WHERE name = 'Blossom', 'Jan 11, 2021');
