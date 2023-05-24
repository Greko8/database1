CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Singer (
	id SERIAL PRIMARY KEY,
	genre_id INTEGER NOT NULL REFERENCES Genre(id),
	singer_id INTEGER NOT NULL REFERENCES Singer(id)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer_album (
	id SERIAL PRIMARY KEY,
	singer_id INTEGER NOT NULL REFERENCES Singer(id),
	album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection_track (
	id SERIAL PRIMARY KEY,
	collection_id INTEGER NOT NULL REFERENCES Collection(id),
	track_id INTEGER NOT NULL REFERENCES Track(id)
);