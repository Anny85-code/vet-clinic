SELECT * FROM animals WHERE name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth, name FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals; 
ROLLBACK;
SELECT * FROM animals; 

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals; 

BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
COMMIT;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT before_january;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO before_january;
SELECT * FROM animals;
UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 1;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name, species, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

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

SELECT full_name, COUNT(name) FROM animals, owners WHERE animals.owners_id = owners.id GROUP BY full_name ORDER BY count DESC limit 1;

SELECT vets.name, date_of_visit, animals.name FROM animals JOIN visits ON visits.animals_id = animals.id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

SELECT species.name FROM specializations s JOIN vets ON s.vets_id = vets.id JOIN visits ON visits.vets_id = vets.id JOIN species ON s.species_id = species.id WHERE vets.name = 'Stephanie Mendez' GROUP BY species.name;

SELECT vets.name, spe.name FROM vets FULL OUTER JOIN specializations s ON s.vets_id = vets.id  LEFT JOIN species spe ON spe.id = s.species_id;

SELECT a.name, ve.name, date_of_visit FROM animals a JOIN visits v ON v.animals_id = a.id JOIN vets ve ON v.vets_id = ve.id WHERE ve.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name, COUNT(date_of_visit) FROM animals a JOIN visits v ON v.animals_id = a.id GROUP BY a.name ORDER BY COUNT DESC LIMIT 1;

SELECT a.name, ve.name, date_of_visit FROM visits v JOIN vets ve ON v.vets_id = ve.id JOIN animals a ON v.animals_id = a.id WHERE ve.name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;

SELECT a.name, ve.name, date_of_visit FROM visits v JOIN vets ve ON v.vets_id = ve.id JOIN animals a ON v.animals_id = a.id ORDER BY date_of_visit DESC LIMIT 1;
