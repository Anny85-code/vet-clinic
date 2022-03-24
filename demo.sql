

-- DROP TABLE vets;
Write queries to answer the following:
Who was the last animal seen by William Tatcher?
How many different animals did Stephanie Mendez see?
List all vets and their specialties, including vets with no specialties.
List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
What animal has the most visits to vets?
Who was Maisy Smith's first visit?
Details for most recent visit: animal information, vet information, and date of visit.
How many visits were with a vet that did not specialize in that animal's species?
What specialty should Maisy Smith consider getting? Look for the species she gets the most.

-- SELECT a.name, ve.name, date_of_visit FROM animals a JOIN visits v ON v.animals_id = a.id JOIN vets ve ON v.vets_id = ve.id WHERE ve.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name, COUNT(date_of_visit) FROM animals a JOIN visits v ON v.animals_id = a.id GROUP BY a.name ORDER BY COUNT DESC LIMIT 1;
