/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-03-02', 0, true, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals VALUES (5, 'Charmander', '2020-02-8', 0, false, -11);
INSERT INTO animals VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals VALUES (7, 'Squirtle', '1993-04-2', 3, false, -12.13);
INSERT INTO animals VALUES (8, 'Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals VALUES (9, 'Boarmon', '2005-06-7', 7, true, 20.4);
INSERT INTO animals VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

/* Insert the following data into the owners table */

INSERT INTO owners VALUES (1, 'Sam Smith', 34);
INSERT INTO owners VALUES (2, 'Jennifer Orwell', 19);
INSERT INTO owners VALUES (3, 'Bob', 45);
INSERT INTO owners VALUES (4, 'Melody Pond', 77);
INSERT INTO owners VALUES (5, 'Dean Winchester', 14);
INSERT INTO owners VALUES (6, 'Jodie Whittaker', 38);

/* Insert the following data into the species table */

INSERT INTO species VALUES (1, 'Pokemon');
INSERT INTO species VALUES (2, 'Digimon');

/* Modify your inserted animals so it includes the species_id value */

UPDATE animals SET species_id = '1' WHERE species_id IS NULL;
UPDATE animals SET species_id = '2' WHERE name LIKE '%mon';

/* Modify your inserted animals to include owner information (owner_id) */

UPDATE animals SET owners_id = '1' WHERE name = 'Agumon';
UPDATE animals SET owners_id = '2' WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id = '3' WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = '4' WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = '5' WHERE name IN ('Angemon', 'Boarmon');

/* Insert the following data for vets: */

INSERT INTO vets VALUES (1, 'William Tatcher', 45, '2000-04-23');
INSERT INTO vets VALUES (2, 'Maisy Smith', 26, '2019-01-17');
INSERT INTO vets VALUES (3, 'Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets VALUES (4, 'Jack Harkness', 38, '2008-01-08');

/* Insert the following data for specialties */

INSERT INTO specializations VALUES (1,1);
INSERT INTO specializations VALUES (3,1);
INSERT INTO specializations VALUES (3,2);
INSERT INTO specializations VALUES (4,2);

/* Insert the following data for visits */

INSERT INTO visits VALUES (1,1,'2020-05-24');
INSERT INTO visits VALUES (1,3,'2020-07-22');
INSERT INTO visits VALUES (2,4,'2021-02-02');
INSERT INTO visits VALUES (3,2,'2020-01-05');
INSERT INTO visits VALUES (3,2,'2020-03-08');
INSERT INTO visits VALUES (3,2,'2020-05-14');
INSERT INTO visits VALUES (4,3,'2021-05-04');
INSERT INTO visits VALUES (5,4,'2021-02-24');
INSERT INTO visits VALUES (6,2,'2019-12-21');
INSERT INTO visits VALUES (6,1,'2020-08-10');
INSERT INTO visits VALUES (6,2,'2021-04-29');
INSERT INTO visits VALUES (7,3,'2019-09-29');
INSERT INTO visits VALUES (8,4,'2020-10-03');
INSERT INTO visits VALUES (8,4,'2020-11-04');
INSERT INTO visits VALUES (9,2,'2019-01-24');
INSERT INTO visits VALUES (9,2,'2019-05-15');
INSERT INTO visits VALUES (9,2,'2020-01-27');
INSERT INTO visits VALUES (9,2,'2020-08-03');
INSERT INTO visits VALUES (10,3,'2020-05-24');
INSERT INTO visits VALUES (10,1,'2021-01-11');
