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

