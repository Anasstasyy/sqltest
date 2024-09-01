create table if not exists genre (
id serial primary key,
name varchar(40) not null
);

create table if not exists singers (
id serial primary key,
name varchar(80) not null
);

create table if not exists genresingers (
genre_id integer references singers(id),
singers_id integer references genre(id),
constraint pk primary key (genre_id, singers_id)
);

create table if not exists albums (
id serial primary key,
name varchar(50) not null,
date integer not null
);

create table if not exists albumsingers (
albumsid integer references singers(id),
singersid integer references albums(id),
constraint pn primary key (albumsid, singersid)
);

create table if not exists tracks (
id serial primary key,
name varchar(80) not null,
time integer not null,
album_id integer not null references albums(id)
);

create table if not exists collections (
id serial primary key,
dates integer not null,
name varchar(70) not null
);

create table if not exists collectiontrack (
tracks_id integer references tracks(id),
collections_id integer references collections(id)
);



