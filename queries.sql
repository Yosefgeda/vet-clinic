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