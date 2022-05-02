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

-- Who was the last animal seen by William Tatcher?

select a.name_, v.name, date_of_visit from visits as vis join vets as v on vis.vet_id = v.id join animals as a on vis.animal_id = a.id where v.name like 'William Tatcher' order by vis.date_of_visit desc limit(1);

-- How many different animals did Stephanie Mendez see?

select distinct count(*) from visits as vis join vets as v on vis.vet_id = v.id join animals as a on vis.animal_id = a.id where v.name like 'Stephanie Mendez' group by v.name;

-- List all vets and their specialties, including vets with no specialties.

select v.name, sp.name from vets as v left join specialization s on v.id = s.vet_id left join species as sp on sp.id = s.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

select a.name_, vis.date_of_visit, v.name from animals as a join visits as vis on a.id = vis.animal_id join vets as v
  on v.id = vis.vet_id where vis.date_of_visit in ('2020-04-01', '2020-08-30') and v.name like 'Stephanie Mendez';

-- What animal has the most visits to vets?

select a.name_, count(*) as total_visits from visits as vis join animals as a on vis.animal_id = a.id group by a.name_
order by total_visits desc limit (1);

-- Who was Maisy Smith's first visit?

select a.name_, v.name, vis.date_of_visit from visits as vis
join vets as v on vis.vet_id = v.id join animals as a on vis.animal_id = a.id where v.name like 'Maisy Smith'
order by vis.date_of_visit limit (1);

-- Details for most recent visit: animal information, vet information, and date of visit.

select a.name_, v.name, vis.date_of_visit from visits as vis join vets as v on vis.vet_id = v.id join animals as a
on vis.animal_id = a.id order by vis.date_of_visit desc limit (1);

-- How many visits were with a vet that did not specialize in that animal's species?

select count(*) as visits_with_no_specialty_vet from visits as vis join vets as v on vis.vet_id = v.id join animals as a
  on vis.animal_id = a.id left join specialization as sp on v.id = sp.vet_id left join species s on s.id = sp.species_id
where sp.species_id != a.species_id OR s.name IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

select s.name, count(*) as most_visited from visits as vis join animals as a on vis.animal_id = a.id join species as s
  on s.id = a.species_id join vets as v on vis.vet_id = v.id left join specialization as sp on v.id = sp.vet_id
where sp.vet_id IS NULL AND v.name LIKE 'Maisy Smith' group by s.name order by most_visited desc limit (1);

-- Performance auditing

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;

explain analyse SELECT * FROM visits where vet_id = 2;

explain analyse SELECT * FROM owners where email = 'owner_18327@mail.com';