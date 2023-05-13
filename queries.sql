/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth > '2016-01-01' AND date_of_birth < '2019-01-01';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon') 
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/*update the animals table by setting the species column to unspecified*/
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

/*Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
Update the animals table by setting the species column to pokemon for all animals that don't have species already set.*/

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

/*Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.*/

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;

/*
Delete all animals born after Jan 1st, 2022.
Create a savepoint for the transaction.
Update all animals' weight to be their weight multiplied by -1.
Rollback to the savepoint
Update all animals' weights that are negative to be their weight multiplied by -1.
Commit transaction 
*/

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT update_table;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO update_table;
SELECT * FROM animals;
COMMIT;

/* How many animals are there? */

SELECT COUNT(*) FROM animals;

/* How many animals have never tried to escape? */

SELECT COUNT (*) FROM animals WHERE escape_attempts = 0;

/* What is the average weight of animals? */

SELECT AVG (weight_kg) FROM animals;

/* Who escapes the most, neutered or not neutered animals? */

SELECT COUNT (*) FROM animals WHERE neutered = true;
SELECT COUNT (*) FROM animals WHERE neutered = false;

/* What is the minimum and maximum weight of each type of animal? */

SELECT MIN(weight_kg) FROM animals;
SELECT MAX(weight_kg) FROM animals;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth > '1990-01-01' AND date_of_birth < '2000-01-01';

/* What animals belong to Melody Pond? */

SELECT name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 4;

/* List of all animals that are pokemon (their type is Pokemon). */

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;

/* List all owners and their animals, remember to include those that don't own any animal. */

SELECT full_name, name FROM owners FULL JOIN animals ON  owners.id = animals.owners_id;

/* How many animals are there per species? */

SELECT COUNT(*) FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT COUNT(*) FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 2;

/* List all Digimon owned by Jennifer Orwell. */

SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id JOIN species ON animals.species_id = species.id WHERE species.id = 2 AND owners.id = 2;

/* List all animals owned by Dean Winchester that haven't tried to escape. */

SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 5 AND animals.escape_attempts = 0;

/* Who owns the most animals? */

SELECT COUNT (*) FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 1;
SELECT COUNT (*) FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 2;
SELECT COUNT (*) FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 3;
SELECT COUNT (*) FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 4;
SELECT COUNT (*) FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 5;
SELECT COUNT (*) FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 6;

/* Who was the last animal seen by William Tatcher? */

SELECT animals.name 
FROM animals 
JOIN visits 
ON animals.id = visits.animals_id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.id = 1 
AND visits.visit_date = (
    SELECT MAX(visit_date) 
    FROM visits 
    WHERE vets_id = 1
);

/* How many different animals did Stephanie Mendez see? */

SELECT COUNT (*) 
FROM animals 
JOIN visits 
ON animals.id = visits.animals_id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.id = 3;

/* List all vets and their specialties, including vets with no specialties. */

SELECT vets.name, species.name 
FROM vets 
FULL JOIN specializations 
ON vets.id = specializations.vet_id 
FULL JOIN species 
ON species.id = specializations.species_id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */

SELECT animals.name 
FROM animals 
JOIN visits 
ON animals.id = visits.animals_id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.id = 3 
AND visits.visit_date > '2020-05-01' 
AND visits.visit_date < '2020-08-30';

/* What animal has the most visits to vets? */

SELECT animals.name as Animals_Name, count(visits.visit_date) as counts
FROM animals, visits
WHERE animals.id = visits.animals_id
GROUP BY Animals_name 
ORDER BY counts desc limit 1;

/* Who was Maisy Smith's first visit? */

SELECT animals.name 
FROM animals 
JOIN visits 
ON animals.id = visits.animals_id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.id = 2 
AND visits.visit_date = (
    SELECT MIN(visit_date) 
    FROM visits 
    WHERE vets_id = 2
);


/* Details for most recent visit: */

SELECT animals.name,vets.name,visit_date 
FROM animals 
JOIN visits 
ON animals.id = visits.animals_id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE  visits.visit_date = (
    SELECT MAX(visit_date) 
    FROM visits
);

/* How many visits were with a vet that did not specialize in that animal's species? */

SELECT vets.name 
as Vet_Name, count(visits.visit_date) 
from vets, visits 
where vets.id = visits.vets_id 
and vets.id 
not in(
    select vets_id 
    from specializations
    ) 
group by Vet_Name;

/* What specialty should Maisy Smith consider getting */

SELECT vets.name 
as Vet_Name, species.name 
as Species_Name, count(visits.visit_date) 
as visit_count 
from vets, visits, species, animals 
where  vets.name = 'Maisy Smith' 
and vets.id = visits.vets_id 
and species.id = animals.species_id 
and animals.id = visits.animals_id 
group by Vet_Name, Species_Name 
order by visit_count 
desc limit 1;