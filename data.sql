/* Populate database with sample data. */

insert into animals(id,name_,date_of_birth,escape_attempts,neutered,weight_kg) values (1, 'Agumon', '03-02-2020', 0, TRUE, 10.23);

insert into animals(id,name_,date_of_birth,escape_attempts,neutered,weight_kg) values (2, 'Gabumon', '15-11-2018', 2, TRUE, 8);

insert into animals(id,name_,date_of_birth,escape_attempts,neutered,weight_kg) values (3, 'Pikachu', '07-01-2021', 1, false, 15.04);

insert into animals(id,name_,date_of_birth,escape_attempts,neutered,weight_kg) values (4, 'Devimon', '12-05-2017', 5, true, 11);

insert into animals(name_,date_of_birth,escape_attempts,neutered,weight_kg) values ('Charmander', '28-02-2020', 0, FALSE, -11);

insert into animals(name_,date_of_birth,escape_attempts,neutered,weight_kg) values ('Plantmon', '15-11-2021', 2, TRUE, -5.7);

insert into animals(name_,date_of_birth,escape_attempts,neutered,weight_kg) values ('Squirtle', '02-04-1993', 3, FALSE, -12.13);

insert into animals(name_,date_of_birth,escape_attempts,neutered,weight_kg) values ('Angemon', '12-06-2005', 1, TRUE, -45);

insert into animals(name_,date_of_birth,escape_attempts,neutered,weight_kg) values ('Boarmon', '07-07-2005', 7, TRUE, 20.4);

insert into animals(name_,date_of_birth,escape_attempts,neutered,weight_kg) values ('Blossom', '13-10-1998', 3, TRUE, 17);

insert into animals(name_,date_of_birth,escape_attempts,neutered,weight_kg) values ('Ditto', '14-05-2022', 4, TRUE, 22);

BEGIN;

UPDATE animals SET species = 'unspecified';

SELECT * from animals;

ROLLBACK;

SELECT * from animals;

BEGIN;

UPDATE animals SET species = 'digimon' WHERE name_ LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT TRANSACTION;

select * from animals

BEGIN;

DELETE from animals;

select * from animals;

ROLLBACK;

select * from animals;

BEGIN;

DELETE from animals where date_of_birth > '01-01-2022'

SAVEPOINT after_deleting_animals_with_bod_greaterthan_01_01_2022;

UPDATE animals set weight_kg = weight_kg * -1;

ROLLBACK TO after_deleting_animals_with_bod_greaterthan_01_01_2022;

UPDATE animals set weight_kg = weight_kg * -1 where weight_kg < 1;

COMMIT;

select * from animals;

-- Inserting data into owners table

insert into owners (full_name,age) values
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

insert into species(name) values ('Pokemon'), ('Digimon');

update animals set species_id = 2 where name_ like '%mon';

update animals set species_id = 1 where name_ not like '%mon';

-- Updating animals table with respective owners reference id's

insert into species(name) values ('Pokemon'), ('Digimon');

update animals set species_id = 2 where name_ like '%mon';

update animals set species_id = 1 where name_ not like '%mon';

update animals set owners_id = 1 where name_ = 'Agumon';

update animals set owners_id = 2 where name_ = 'Gabumon' or name_ = 'Pikachu';

update animals set owners_id = 3 where name_ in ('Devimon', 'Plantmon');

update animals set owners_id = (select id from owners  where full_name = 'Melody Pond') where name_ in ('Charmander', 'Squirtle', 'Blossom');

update animals set owners_id = 5 where name_ in ('Angemon', 'Boarmon');

-- Inserting data into vets table

insert into vets(name, age, date_of_graduation) values
    ('William Tatcher', 45, '23-04-2000'),
    ('Maisy Smith', 26, '17-01-2019'),
    ('Stephanie Mendez', 64, '04-05-1981'),
    ('Jack Harkness', 38, '08-06-2008');

  -- Inserted data inot specialization table.

  insert into specialization (species_id, vet_id) values (1,1), ( 1,3), (2,3), (2,4);

  -- Inserting data into visits

  INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES
(8, 1, '2020-05-24'),
(8, 3, '2020-07-22'),
(9, 4, '2021-02-02'),
(10, 2, '2020-01-05'),
(10, 2, '2020-03-08'),
(10, 2, '2020-05-14'),
(11, 3, '2021-05-04'),
(1, 4, '2021-02-24'),
(2, 2, '2019-12-21'),
(2, 1, '2020-08-10'),
(2, 2, '2021-04-07'),
(3, 3, '2019-09-29'),
(4, 4, '2020-10-03'),
(4, 4, '2020-11-04'),
(5, 2, '2019-01-24'),
(5, 2, '2019-05-15'),
(5, 2, '2020-02-27'),
(5, 2, '2020-08-03'),
(6, 3, '2020-05-24'),
(6, 1, '2021-01-11');