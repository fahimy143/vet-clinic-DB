/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, True, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, True, 5.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, False, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, True, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, True, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, False, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, False, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, True, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, True, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, True, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditton', '1999-08-31', 2, True, 16.3);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

BEGIN;

UPDATE animals set species_id = 1 WHERE name LIKE '%mon';

UPDATE animals set species_id = 2 WHERE name NOT LIKE '%mon';

COMMIT ;

BEGIN;

UPDATE animals set owner_id = 1 where name = 'Agumon';

UPDATE animals set owner_id = 2 where name = 'Gabumon';

UPDATE animals set owner_id = 2 where name = 'Pikachu';

UPDATE animals set owner_id = 3 where name = 'Devimon';

UPDATE animals set owner_id = 3 where name = 'Plantmon';

UPDATE animals set owner_id = 4 where name = 'Charmander';

UPDATE animals set owner_id = 4 where name = 'Squirtle';

UPDATE animals set owner_id = 4 where name = 'Blossom';

UPDATE animals set owner_id = 5 where name = 'Angemon';

UPDATE animals set owner_id = 5 where name = 'Boarmon';

COMMIT;

BEGIN;

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

COMMIT;

BEGIN;

INSERT INTO specializations (species_id, vet_id)
    VALUES (
        (SELECT id FROM species WHERE name = 'Pokemon'),
        (SELECT id FROM vets WHERE name = 'William Tatcher')
    );

INSERT INTO specializations (species_id, vet_id)
    VALUES (
        (SELECT id FROM species WHERE name = 'Pokemon'),
        (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
    );

INSERT INTO specializations (species_id, vet_id)
    VALUES (
        (SELECT id FROM species WHERE name = 'Digimon'),
        (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
    );

INSERT INTO specializations (species_id, vet_id)
    VALUES (
        (SELECT id FROM species WHERE name = 'Digimon'),
        (SELECT id FROM vets WHERE name = 'Jack Harkness')
    );

COMMIT;


BEGIN;

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES(
        (SELECT id FROM animals WHERE name = 'Agumon'),
        (SELECT id FROM vets WHERE name = 'William Tatcher'),
        '2020-05-24'
        );


INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Agumon'),
        (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
        '2020-07-22'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Gabumon'),
        (SELECT id FROM vets WHERE name = 'Jack Harkness'),
        '2020-02-02'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2020-01-05'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2020-03-08'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2020-05-14'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Devimon'),
        (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
        '2020-05-04'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Charmander'),
        (SELECT id FROM vets WHERE name = 'Jack Harkness'),
        '2020-02-24'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2019-12-21'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'William Tatcher'),
        '2020-08-10'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2021-04-07'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Squirtle'),
        (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
        '2019-09-29'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Angemon'),
        (SELECT id FROM vets WHERE name = 'Jack Harkness'),
        '2020-10-03'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Jack Harkness'),
        '2020-11-04'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2019-01-24'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2019-05-15'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2020-02-27'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Maisy Smith'),
        '2020-08-03'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Blossom'),
        (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
        '2020-05-24'
    );

INSERT INTO visits (animal_id, vet_id, date_of_visit)
    VALUES (
        (SELECT id FROM animals WHERE name = 'Blossom'),
        (SELECT id FROM vets WHERE name = 'William Tatcher'),
        '2020-01-11'
    );

COMMIT;