CREATE TABLE animals (
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(30),
 date_of_birth DATE,
 escape_attempts INT,
 neutered BOOLEAN,
 weight_kg DECIMAL,
 PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species varchar(100);
ALTER TABLE animals DROP COLUMN species;


CREATE TABLE owners (
 id SERIAL PRIMARY KEY,
full_name VARCHAR(200),
age INT
);

CREATE TABLE species (
 id SERIAL PRIMARY KEY,
 name VARCHAR(200)
);

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species;
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners;

CREATE TABLE vets (
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(250),
 age INT,
 date_of_graduation DATE,
 PRIMARY KEY (id)
);
