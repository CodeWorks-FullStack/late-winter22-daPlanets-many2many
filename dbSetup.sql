CREATE TABLE IF NOT EXISTS accounts(
  id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
  name varchar(255) COMMENT 'User Name',
  email varchar(255) COMMENT 'User Email',
  picture varchar(255) COMMENT 'User Picture'
) default charset utf8 COMMENT '';

CREATE TABLE IF NOT EXISTS planets(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  size int NOT NULL,
  temperature int NOT NULL 
) default charset utf8 COMMENT '';

INSERT INTO planets
(name, size, temperature)
VALUES
('earth', 27000, 98);
INSERT INTO planets
(name, size, temperature)
VALUES
('mars', 12000, 0);
INSERT INTO planets
(name, size, temperature)
VALUES
('venus', 26000, 1000);

SELECT * FROM planets;

CREATE TABLE IF NOT EXISTS species(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  dangerlevel VARCHAR(255) NOT NULL
) default charset utf8 COMMENT '';

INSERT INTO species
(name, type, dangerlevel)
VALUES
('the chad', 'drives a powerstroke', 0);
INSERT INTO species
(name, type, dangerlevel)
VALUES
('squirrel', 'flying', 10);
INSERT INTO species
(name, type, dangerlevel)
VALUES
('cat', 'fluffy', 2);

SELECT * FROM species;

-- many to many table below

CREATE TABLE IF NOT EXISTS planetspecies(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  planetId int,
  speciesId int,

  FOREIGN KEY(planetId) REFERENCES planets(id),
  FOREIGN KEY(speciesId) REFERENCES species(id)
) default charset utf8 COMMENT '';

INSERT INTO planetspecies
(planetId, speciesId)
VALUES
(1, 2);
INSERT INTO planetspecies
(planetId, speciesId)
VALUES
(2, 3);
INSERT INTO planetspecies
(planetId, speciesId)
VALUES
(3, 1);

SELECT * FROM planetspecies;


SELECT 
-- Here we dictate exactly what colums we are wanting to select from the tables we are joining
s.id AS speciesId,
s.name,
s.dangerlevel
-- The table we are pulling data from
FROM planetspecies ps
-- What other tables do we want to pull in
JOIN species s on s.id = ps.speciesId
JOIN planets p on p.id = ps.planetId
-- Specifying exactly what id we are looking for
WHERE ps.id = 1;