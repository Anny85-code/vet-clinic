-- SELECT * FROM animals WHERE name like '%mon';
-- SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
-- SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
-- SELECT date_of_birth, name FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
-- SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
-- SELECT * FROM animals WHERE neutered = true;
-- SELECT * FROM animals WHERE name != 'Gabumon';
-- SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- BEGIN TRANSACTION;
-- UPDATE animals
-- SET species = 'unspecified';
-- SELECT * FROM animals; 
-- ROLLBACK;
-- SELECT * FROM animals; 

-- BEGIN TRANSACTION;
-- UPDATE animals SET species = 'digimon' WHERE name like '%mon';
-- UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
-- COMMIT;
-- SELECT * FROM animals; 

-- BEGIN TRANSACTION;
-- DELETE FROM animals;
-- SELECT * FROM animals;
-- ROLLBACK;
-- COMMIT;
-- SELECT * FROM animals;

-- BEGIN TRANSACTION;
-- DELETE FROM animals WHERE date_of_birth > '2022-01-01';
-- SELECT * FROM animals;
-- SAVEPOINT before_january;
-- UPDATE animals SET weight_kg = weight_kg * -1;
-- ROLLBACK TO before_january;
-- SELECT * FROM animals;
-- UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 1;
-- COMMIT;
-- SELECT * FROM animals;

-- SELECT COUNT(name) FROM animals;
-- SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
-- SELECT AVG(weight_kg) FROM animals;
-- SELECT name, species, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

-- SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
-- SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT full_name, name
FROM (
  SELECT name, full_name FROM animals, owners WHERE animals.owners_id = owners.id
) t
WHERE full_name = 'Melody Pond';

SELECT animal, species
FROM (
  SELECT animals.name AS Animal, species.name AS Species FROM animals, species WHERE animals.species_id = species.id
) t
WHERE species = 'Pokemon';

SELECT name, full_name FROM animals FULL OUTER JOIN owners ON animals.owners_id = owners.id;

SELECT species, COUNT(species) FROM (SELECT animals.name AS Animal, species.name AS Species FROM animals INNER JOIN species ON animals.species_id = species.id)_ GROUP BY species;

SELECT full_name, name
FROM (
  SELECT name, full_name FROM animals, owners WHERE animals.owners_id = owners.id
) t
WHERE full_name = 'Jennifer Orwell' AND name LIKE '%mon';

SELECT full_name, name, escape_attempts FROM(SELECT full_name, name, escape_attempts FROM animals INNER JOIN owners ON animals.owners_id = owners.id) t WHERE full_name = 'Dean Winchester' AND escape_attempts < 0;
