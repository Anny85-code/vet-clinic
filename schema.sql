CREATE TABLE animals (
 id INT GENERATE ALWAYS AS IDENTITY,
 name VARCHAR(30),
 date_of_birth DATE,
 escape_attempts INT,
 neutered BOOLEAN,
 weight_kg DECIMAL
);

