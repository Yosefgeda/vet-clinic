/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR;

CREATE TABLE owners (
    id SERIAL PRIMARY KEY, 
    full_name VARCHAR, 
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY, 
    name VARCHAR
);

/* Make sure that id is set as autoincremented PRIMARY KEY */

ALTER TABLE animals ALTER COLUMN id SERIAL;

/* Remove column species */

BEGIN;
ALTER TABLE animals DROP species;
COMMIT;

/* Add column species_id which is a foreign key referencing species table */

ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

/* Add column owner_id which is a foreign key referencing the owners table */

ALTER TABLE animals ADD COLUMN owners_id INTEGER REFERENCES owners(id);

/* Create a table named vets with the following columns: */

 CREATE TABLE vets (
    id SERIAL PRIMARY KEY, 
    name VARCHAR, 
    age INTEGER, 
    date_of_graduation DATE
);

/* Create a "join table" called specializations */

CREATE TABLE specializations (
    vet_id INTEGER, 
    species_id INTEGER, 
    FOREIGN KEY (vet_id) REFERENCES vets(id), 
    FOREIGN KEY (species_id) REFERENCES species(id)
);

/* Create a "join table" called visits */

CREATE TABLE visits (
    animals_id INTEGER,
    vets_id INTEGER,
    visit_date DATE,
    FOREIGN KEY (animals_id) REFERENCES Aanimals(id), 
    FOREIGN KEY (vets_id) REFERENCES vets(id)
);
