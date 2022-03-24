CREATE TABLE animals (
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(30),
 date_of_birth DATE,
 escape_attempts INT,
 neutered BOOLEAN,
 weight_kg DECIMAL,
 PRIMARY KEY (id)
);

ALTER TABLE animals ADD COLUMN species varchar(100);

