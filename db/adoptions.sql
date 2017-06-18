DROP TABLE adoptions;
DROP TABLE owners;
DROP TABLE animals;


CREATE TABLE owners
(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE animals
(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
admission_date DATE,
adoptable BOOLEAN,
CREATE TABLE adoptions
(
id SERIAL4 PRIMARY KEY,
date_of_adoption DATE,
owner_id INT4 references owners(id),
animal_id INT4 references animals(id)
);