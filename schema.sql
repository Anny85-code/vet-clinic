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

CREATE TABLE specializations (
	vets_id                INT NOT NULL,
 species_id             INT NOT NULL,
 FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (vets_id, species_id)
);

CREATE TABLE visits (
 id                     SERIAL PRIMARY KEY,
	animals_id             INT NOT NULL,
	vets_id                INT NOT NULL,
 date_of_visit          DATE NOT NULL,
	FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE
);