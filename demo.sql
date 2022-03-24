

-- DROP TABLE vets;












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




SELECT vets.name AS vet_name, spe.name AS spe_name FROM vets FULL JOIN specializations s ON s.vets_id = vets.id LEFT JOIN species spe ON s.species_id = spe.id;
SELECT vt.name AS vet_name, a.name AS anis_name, date_of_visit FROM visits v JOIN animals a ON v.animals_id = a.id JOIN vets vt ON v.vets_id = vt.id WHERE vt.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
SELECT name, COUNT(date_of_birth) FROM animals a JOIN visits v ON a.id = v.animals_id GROUP BY a.name ORDER BY count DESC LIMIT 1;
SELECT a.name, vt.name, date_of_visit FROM visits v JOIN vets vt ON v.vets_id = vt.id JOIN animals a ON v.animals_id = a.id WHERE vt.name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;
SELECT a.name AS ani_name, vt.name AS vet_name, date_of_visit FROM visits v JOIN animals a ON v.animals_id = a.id JOIN vets vt ON v.vets_id = vt.id ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(sp.name), sp.name FROM visits v JOIN animals a ON v.animals_id = a.id JOIN species sp ON a.species_id = sp.id JOIN vets vt ON v.vets_id = vt.id WHERE vets_id = 2 GROUP BY(sp.name) limit 1;
SELECT COUNT(*) AS species FROM visits v FULL OUTER JOIN vets vt ON v.vets_id = vt.id FULL OUTER JOIN specializations s ON s.vets_id = vt.id WHERE species_id IS NULL;