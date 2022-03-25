

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

-- SELECT a.name, COUNT(date_of_visit) FROM animals a JOIN visits v ON v.animals_id = a.id GROUP BY a.name ORDER BY COUNT DESC LIMIT 1;

-- SELECT a.name, ve.name, date_of_visit FROM visits v JOIN vets ve ON v.vets_id = ve.id JOIN animals a ON v.animals_id = a.id ORDER BY date_of_visit DESC LIMIT 1;

-- SELECT date_of_visit, ve.name, s.id, sp.name, a.name FROM visits v JOIN animal a ON a.id=v.animals_id JOIN  vets ve ON v.vets_id = ve.id JOIN species sp ON  .species_idJOIN specializations s ON sp.id=s.species_id;

SELECT date_of_visit, ve.name as vetname, a.name as animalsname, sp.name as speciesname FROM visits v JOIN animals a ON a.id = v.animals_id JOIN vets ve ON ve.id = v.vets_id JOIN species sp ON sp.id = a.species_id;

(SELECT ve.name, sp.name as specialization FROM vets ve JOIN specializations s ON s.vets_id=ve.id JOIN species sp ON s.species_id=sp.id);

-- SELECT COUNT(*) FROM visits JOIN animals ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN specializations ON specializations.vets_id = visits.vets_id WHERE animals.species_id != specializations.species_id;
