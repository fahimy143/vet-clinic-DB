/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = true;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM ANIMALS WHERE name NOT LIKE '%Gabumon%';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified' WHERE species IS NULL;
ROLLBACK;

SELECT species FROM animals;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

DELETE FROM animals;

ROLLBACK;

SELECT species FROM animals;

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT animals;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg > 0 OR weight_kg  > 0;

ROLLBACK TO animals;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

/* How many animals are there? */
SELECT COUNT(*) FROM animals ;

/* How many animals have never tried to escape? */
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

/* What is the average weight of animals? */
SELECT AVG(weight_kg) FROM animals;

/* Who escapes the most, neutered or not neutered animals? */
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;



/* What animals belong to Melody Pond? */
SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon). */
SELECT animals.name FROM animals JOIN species ON animals.species_id  = species.id WHERE species.name = 'Pokemon';
/* List all owners and their animals, remember to include those that don't own any animal. */
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

/* How many animals are there per species? */
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

/* List of all Digimon owned by Jennifer Orwell. */
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/* Who owns the most animals? */
SELECT owners.full_name FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;


/* Who was the last animal seen by William Tatcher? */

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see? */
SELECT COUNT(DISTINCT animals.name) FROM animals JOIN visits ON animals.id = visits.animal_id  JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez';

/* List all vets and their specialties, including vets with no specialties. */
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON specializations.species_id = species.id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

/* What animal has the most visits to vets? */
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;

/* Who was Maisy Smith's first visit? */
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
SELECT animals.name, vets.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id ORDER BY visits.date_of_visit DESC LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species? */
SELECT COUNT(*) FROM visits JOIN vets ON vets.id = visits.vet_id JOIN animals ON animals.id = visits.animal_id JOIN species ON animals.species_id = species.id WHERE vets.id NOT IN (SELECT vets.id FROM vets JOIN specializations ON vets.id = specializations.vet_id JOIN species ON specializations.species_id = species.id WHERE species.id = animals.species_id);

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
SELECT species.name FROM species JOIN animals ON species.id = animals.species_id JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(*) DESC LIMIT 1;



-- next
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits V where V.vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';