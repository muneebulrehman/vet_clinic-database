/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name_ LIKE '%mon';

select name_ from animals where date_of_birth between '2016-01-01' and  '2019-01-01';

select name_ from animals where neutered = True and escape_attempts < 3;

select date_of_birth from animals where name_ = 'Agumon' or name_ = 'Pikachu';

select name_, escape_attempts from animals where weight_kg > 10.5;

select * from animals where neutered = true;

select * from animals where not name_ = 'Gabumon'; 

select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;
