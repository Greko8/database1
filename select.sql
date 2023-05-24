-- задание 2. Запросы
-- Название и продолжительность самого длительного трека
select name, duration from track
order by duration desc 
limit 1;

-- Название треков, продолжительность которых не менее 3,5 минут
select name from track
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
select name from collection
where year between 2018 and 2020;

-- Исполнители, чьё имя состоит из одного слова.
select name from singer
where name not like '% %';

-- Название треков, которые содержат слово «мой» или «my».
select name from track
where string_to_array(lower(name), ' ') && array['my','мой'];

--Задание 3
-- Количество исполнителей в каждом жанре.
select g.name, count(distinct singer_id) from genre_singer gs
right join genre g on gs.genre_id = g.id
group by g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
select count(distinct t.id) from track t
left join album a on a.id = t.album_id
where a.year between 2019 and 2020;

-- Средняя продолжительность треков по каждому альбому.
select a.name, avg(t.duration) from track t
left join album a on a.id = t.album_id
group by a.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
select name from singer
where name not in (
select s.name from singer s 
join singer_album sa on s.id = sa.singer_id
join album a on a.id = sa.album_id
where a.year = '2020'
);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select c.name from collection c 
join collection_track ct on c.id = ct.collection_id
join track t on t.id = ct.track_id
join album a on a.id = t.album_id
join singer_album sa on a.id = sa.album_id
join singer s on s.id = sa.singer_id
where s.name = 'БИ-2';

--задание 4
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select distinct a.name from album a
join singer_album sa on a.id = sa.album_id
join singer s on s.id = sa.singer_id
join genre_singer gs on gs.singer_id = s.id
group by a.name, gs.singer_id
having count(gs.genre_id) > 1;


-- Наименования треков, которые не входят в сборники.
select t.name from track t 
left join collection_track ct on t.id = ct.track_id
where ct.track_id is null;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
select s.name from singer s 
join singer_album sa on s.id = sa.singer_id 
join album a on sa.album_id = a.id 
join track t on a.id = t.album_id 
where t.duration = (SELECT MIN(duration) FROM track);

-- Названия альбомов, содержащих наименьшее количество треков.
select a.name, count(distinct t.id) track_q from track t
join album a on t.album_id = a.id
group by a.name
having count(distinct t.id) = (select min(track_q) from (select a.name, count(distinct t.id) track_q from track t
join album a on t.album_id = a.id
group by a.name
order by track_q asc) mct);
