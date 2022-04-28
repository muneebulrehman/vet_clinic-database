/* Database schema to keep the structure of entire database. */

CREATE table animals(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_ varchar(255) NOT NULL,
    date_of_birth DATE NOT null,
    escape_attempts INT NOT null,
    neutered boolean NOT null,
    weight_kg Decimal Not null
)

ALTER TABLE animals ADD species varchar(255);

create table owners (
    id serial primary key not null,
    full_name varchar(255),
    age int not null
)

create table species (
    id serial primary key not null,
    name varchar(255) not null
)

alter table animals drop species;

alter table animals add species_id int;

alter table animals add foreign key (species_id) references species(id);

alter table animals add owners_id int;

alter table animals add foreign key (owners_id) references owners(id);