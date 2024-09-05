--название и продолжительность самого длинного трека
select t_name, time from tracks
where time = (select max(time) from tracks);

--название треков, продолжительность которых не менее 3,5 мин
select t_name, time from tracks
where time > 3.5;

--названия сборников, вышедших в период с 2018 по 2020 год включительно 
select name from collections
where date >= '2018.01.01' and date <= '2020.01.01';

--испольнители, чье имя состоит из олного слова
select s_name from singers
where not s_name like '% %';
--названия треков, которые содержат слово "мой" или "my"
select t_name from tracks 
where t_name like '%мой%' or t_name like '%my%';

--количество исполнителей в каждом жанре
select g_name, count(s.s_name) from genre g
left join genresingers g2 on g.id = g2.genre_id 
left join singers s on g2.singers_id = s.id 
group by g_name 
order by count(s.s_name) desc;

--количество треко, вошедших в альбомы 2019-2020
select count(t_name) from tracks t
left join albums a on t.albums_id = a.id 
where date > '2019.01.01' and date < '2021.01.01';

--средняя продолжительность треков по каждому альбому 
select a.a_name, avg(time) from tracks t
left join albums a on t.albums_id = a.id 
group by a_name
order by avg(time);

--все исполнители, которые не выпустили альбомы в 2020
select s_name from singers s 
left join albumsingers a on s.id = a.singersid 
left join albums a2 on a.albumsid = a2.id 
where s_name not in (select s_name from albumsingers where date >= '2020.01.01' and date < '2021.01.01' );

--названия сборников, в которых присутствует конкретный исполнитель
select name from collections c 
left join collectiontrack c2 on c2.collections_id  = c.id 
left join tracks t on c2.tracks_id = t.id 
left join albums a on t.album_id = a.id 
left join albumsingers a2 on a.id = a2.albumsid 
left join singers s on a2.singersid = s.id 
where s_name like 'Queen';