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