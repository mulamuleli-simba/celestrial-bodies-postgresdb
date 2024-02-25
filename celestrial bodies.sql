CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy(
  galaxy_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  galaxy_types TEXT,
  is_visible_to_naked_eye BOOLEAN,
  description TEXT
);

CREATE TABLE star(
  star_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  distance_from_earth NUMERIC(10,2),
  brightness_of_star NUMERIC(10,3),
  galaxy_id INT NOT NULL,
  FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
  planet_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  planet_types TEXT,
  has_life BOOLEAN,
  star_id INT NOT NULL,
  FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE TABLE moon(
  moon_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  radius_in_km INT,
  has_water BOOLEAN,
  planet_id INT NOT NULL,
  FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE satellite(
  satellite_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  year_launched INT,
  distance_from_earth NUMERIC(10,2),
  planet_id INT NOT NULL,
  FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

INSERT INTO galaxy(
  name, galaxy_types, is_visible_to_naked_eye, description) 
VALUES(
  'Milky Way Galaxy','barred spiral galaxy',True,'This galaxy is our home galaxy and is part of the Local Group of three large galaxies along with smaller galaxies'),
  ('Canis Major Dwarf Galaxy','Irregular Galaxy', False,'It is the closest galaxy from the Milky Way with a distance of about 25,000 light-years from our Solar System.'),
  ('Segue 1', 'dwarf spheroidal galaxy', True,'This galaxy is noticably elongated is attributed possible tidal forces caused by the Milky Way Galaxy'),
  ('Sag DEG', 'elliptical loop-shaped satellite galaxy',False,'It has passed through the core of the Milky Way several times in the past.'),
  ('Bardnard''s Galaxy', 'Irregular barred spiral galaxy',True,'The galaxy is known for being the one where cephid variables were used to know how far away it was from us.'),
  ('Andromeda Galaxy', 'Spiral galaxy',True,'It is the nearest spiral galaxy to us and is sometimes called M31.')
;

INSERT INTO star(
  name, distance_from_earth, brightness_of_star, galaxy_id)
VALUES(
  'Proxima Centauri', 4.24, 11.05, 1),
  ('Kepler-90', 2545, 14.0, 1),
  ('Vega', 25, 0.03, 1),
  ('Barnard''s Star',5.96, 9.53, 1),
  ('Sirius', 8.6, 1.46, 1),
  ('Sun', 0, 26.74, 1),
  ('Sadalsuud', 540, 2.87, 1)
;

INSERT INTO planet(
  name, planet_types, has_life, star_id)
VALUES('Mercury', 'Terrestrial planet', False, 6), 
	('Venus', 'Terrestrial planet', False, 6), 
	('Earth', 'Terrestrial planet', True, 6), 
	('Mars', 'Terrestrial planet', False, 6), 
	('Jupiter', 'Gas giant', False, 6), 
	('Saturn', 'Gas giant', False, 6), 
	('Uranus', 'Ice giant', False, 6), 
	('Neptune', 'Ice giant', False, 6), 
	('Ceres', 'Dwarf planet', False, 6), 
	('Orcus', 'Dwarf planet', False, 6), 
	('Pluto', 'Dwarf planet', False, 6), 
	('Haumea', 'Dwarf planet', False, 6), 
	('Quaoar', 'Dwarf planet', False, 6), 
	('Makemake', 'Dwarf planet', False, 6), 
	('Gonggong', 'Dwarf planet', False, 6), 
	('Eris', 'Dwarf planet', False, 6), 
	('Sedna', 'Trans-Neptunian object', False, 6), 
	('Salacia', 'Trans-Neptunian object', False, 6), 
	('Varda', 'Trans-Neptunian object', False, 6)
  ;


INSERT INTO moon(
  name, radius_in_km, has_water, planet_id)
VALUES('Moon (Luna)',	1737.5,	True,	3),
('Titan',	2576,	True,	6),
('Europa',	1560.8,	True,	5),
('Ganymede',	2634.1,	True,	5),
('Enceladus',	252.1,	True,	6),
('Triton',	1353.4,	True,	8),
('Callisto',	2410.3,	True,	5),
('Io',	1821.6,	True,	5),
('Rhea',	764.3,	True,	6),
('Dione',	561.4,	True,	6),
('Tethys',	531.1,	True,	6),
('Charon',	606,	True,	11),
('Ariel',	578.9,	True,	7),
('Umbriel',	584.7,	True,	7),
('Miranda',	235.8,	True,	7),
('Titania',	788.9,	True,	7),
('Oberon',	761.4,	True,	7),
('Iapetus',	735.6,	True,	6),
('Hyperion', 135,	False,	6),
('Phobos',	11.1,	False,	4)
;


INSERT INTO satellite(
  name, year_launched, distance_from_earth, planet_id)
VALUES('Hubble Space Telescope',	1990,	547, 3),
('International Space Station (ISS)',	1998,	420 ,3),
('Terra',	1999, 705, 3),
('Aqua',	2002,	705,	3),
('Landsat 7', 	1999,	705 ,3),
('Mars Reconnaissance Orbiter (MRO)',	2005, 400,	4),
('Juno',	2011, 8000,	5),
('Cassini',	1997, 1500000, 6),
('Galileo',	1989 , 8000, 5)
;
