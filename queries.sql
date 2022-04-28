/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name_ LIKE '%mon';

select name_ from animals where date_of_birth between '2016-01-01' and  '2019-01-01';

select name_ from animals where neutered = True and escape_attempts < 3;

select date_of_birth from animals where name_ = 'Agumon' or name_ = 'Pikachu';

select name_, escape_attempts from animals where weight_kg > 10.5;

select * from animals where neutered = true;

select * from animals where not name_ = 'Gabumon'; 

select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

-- How many animals are there?
select count(id) from animals;

-- How many animals have never tried to escape?

select count(id) from animals where escape_attempts = 0;

-- What is the average weight of animals?

select avg(weight_kg) from animals;

-- Who escapes the most, neutered or not neutered animals?

select neutered, max(escape_attempts) from animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?

select species, min(weight_kg), max(weight_kg) from animals group by species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

select species, avg(escape_attempts) from animals where date_of_birth between '01-01-1990' and '31-12-2000' group by species;

-- What animals belong to Melody Pond?

select * from animals join owners on animals.owners_id = owners.id where owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).

select * from animals join species on animals.species_id = species.id where species.name = 'Pokemon'

-- List all owners and their animals, remember to include those that don't own any animal.

select o.full_name as name, a.name_ as name from owners as o left join animals as a on o.id = a.owners_id;


-- How many animals are there per species?

select s.name as type, count(a.id ) as total from species as s left join animals as a on s.id = a.species_id group by s.name;

-- List all Digimon owned by Jennifer Orwell.

select a.name_ as name , o.full_name as owners_name from animals as a  join owners as o on a.owners_id = o.id where o.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.

select a.name_ as animal_name, a.escape_attempts as escapes, o.full_name as owner from animals as a join owners as o on a.owners_id = o.id where (o.full_name = 'Dean Winchester' and a.escape_attempts = 0);

-- Who owns the most animals?

select count(a.id) as total_animals, o.full_name as owner from animals as a join owners as o on a.owners_id = o.id group by o.full_name order by total_animals desc limit (1);