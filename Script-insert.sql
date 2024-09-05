--имена исполнителей/групп
insert into singers(s_name)
values ('Queen');

insert into singers(s_name)
values ('Michael Jackson');

insert into singers(s_name)
values ('Frank Sinatra');

insert into singers(s_name)
values ('The Beatles');

--жанры
insert into genre(g_name)
values ('Rock');

insert into genre(g_name)
values ('Pop');

insert into genre(g_name)
values ('Jazz');

--Альбомы 
insert into albums(a_name, date)
values ('The Game', '1980.06.27');

insert into albums(a_name, date)
values ('Abbey Road', '1969.09.26');

insert into albums(a_name, date)
values ('Thriller', '1982.11.30');

--треки
insert into tracks(t_name, time, album_id)
values ('Another one bites the dust', 3.35, 1);

insert into tracks(t_name, time, album_id)
values ('Save me', 3.48, 1);

insert into tracks(t_name, time, album_id)
values ('Come together', 4.19, 2);

insert into tracks(t_name, time, album_id)
values ('Something', 3.02, 2);

insert into tracks(t_name, time, album_id)
values ('Billie Jean', 4.53, 3);

insert into tracks(t_name, time, album_id)
values ('Beat it', 4.18, 3);

--коллекции 
insert into collections(name, date)
values ('The plantinum collection', '2000.11.13');

insert into collections(name, date)
values ('The beatles collection', '1978.11');

insert into collections(name, date)
values ('Number Ones', '2003.11.18');

insert into collections(name, date)
values ('The essential Michael Jackson', '2005.07.19');

--присваивание исполнителей к жанрам 
insert into genresingers(genre_id, singers_id)
values (1, 1);

insert into genresingers(genre_id, singers_id)
values (1, 4);

insert into genresingers(genre_id, singers_id)
values (2, 2); 

insert into genresingers(genre_id, singers_id)
values (3, 3);

--присваивание исполнителей к альбомам 
insert into albumsingers(albumsid, singersid)
values (1, 1);

insert into albumsingers(albumsid, singersid)
values (2, 4);

insert into albumsingers(albumsid, singersid)
values (3, 2);

--присваивание треков к сборникам 
insert into collectiontrack(tracks_id, collections_id)
values (1, 1);

insert into collectiontrack(tracks_id, collections_id)
values (2, 1);

insert into collectiontrack(tracks_id, collections_id)
values (3, 2);

insert into collectiontrack(tracks_id, collections_id)
values (4, 2);

insert into collectiontrack(tracks_id, collections_id)
values (5, (3, 4));

insert into collectiontrack(tracks_id, collections_id)
values (6, (3, 4));



