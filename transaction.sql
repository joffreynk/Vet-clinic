BEGIN;
UPDATE animals SET spicies = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET spicies = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET spicies = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > 'Jan 1, 2022';
SAVEPOINT setWeight;
UPDATE animals SET weight_kg =  -1;
ROLLBACK TO setWeight;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
