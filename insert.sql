-- заполнение таблицы. Задание 1

INSERT INTO singer (name) 
VALUES('Scooter'), ('Eminem'), ('Rammstein'), ('Алиса'), ('БИ-2'), ('Руки Вверх'), ('Deep Purple');

INSERT INTO genre (name) 
VALUES('Rap'), ('Techno'), ('Rock'), ('Pop');

INSERT INTO album (name, year) 
VALUES('Горизонт событий', '2017'), ('No Time To Chill', '1997'), ('Mutter', '2001'), ('The Slim Shady LP', '1999'), ('Без тормозов', '1999'), ('Whoosh!', '2020'), ('Шабаш', '1991');

INSERT INTO singer_album (singer_id, album_id)
VALUES(1, 2), (2, 4), (3, 3), (5, 1), (6, 5), (7, 6), (4, 7);

INSERT INTO track (name, duration, album_id) 
VALUES('Zwitter', '257', 3), ('Ich Will', '217', 3), ('We are the greatest', '194', 2), ('Летчик', '351', 1), ('Лайки', '211', 1), ('My name is', '268', 4), ('Rock Bottom', '214', 4), ('Ну где же вы, девчонки', '277', 5), ('Remission Possible', '98', 6), ('Мое поколение', '240', 7);

INSERT INTO genre_singer (genre_id, singer_id)
VALUES(2,1), (1, 2), (3, 3), (3, 4), (3, 5), (4, 6), (3,7), (4,1), (4, 2), (4, 5), (2, 6);

INSERT INTO collection (name, year) 
VALUES('My rock', 2021), ('Russian rock', 2019), ('1990s', 1999), ('Hits', 2005), ('Russian', 2020), ('Drive', 2005);

INSERT INTO collection_track (collection_id, track_id) 
VALUES(1,1), (1,2), (1,4), (1,9), (2,4), (2,5), (3,3), (3,6), (3,7), (4,2), (4,3), (4,2), (4,6), (4,8), (5,4), (5,5), (5,8), (6,1), (6,8);
