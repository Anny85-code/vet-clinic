

-- DROP TABLE vets;





INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23'),('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vets_id, species_id) VALUES(1, 1),(3, 2),(3, 1),(4,2);

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(1, 1, '2020-05-24'),(1, 3, '2020-07-22'),(2, 4, '2021-02-02'),(3, 2, '2020-01-05'),(3, 2, '2020-03-08'),(3, 2, '2020-05-14'),(4, 3, '2021-05-14'),(5, 4, '2021-02-24'),(6, 2, '2019-12-21'),(6, 1, '2020-08-10'),(6, 2, '2021-04-07'),(7, 3, '2019-09-29'),(8, 4, '2020-03-10'),(8, 4, '2020-11-04'),(9, 2, '2019-01-24'),(9, 2, '2019-05-15'),(9, 2, '2020-02-27'),(9, 2, '2020-08-03'),(10, 3, '2020-05-24'),(10, 1, '2021-01-11');



-- Write queries to answer the following:
-- Who was the last animal seen by William Tatcher?
-- How many different animals did Stephanie Mendez see?
-- List all vets and their specialties, including vets with no specialties.
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
-- What animal has the most visits to vets?
-- Who was Maisy Smith's first visit?
-- Details for most recent visit: animal information, vet information, and date of visit.
-- How many visits were with a vet that did not specialize in that animal's species?
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.