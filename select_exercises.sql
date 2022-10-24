## select_exercises
USE albums_db
/*  3a. 31 rows in albums table
	3b. 240 unique artist names
	3c. primary key 'id'
	3d. oldest album release date is 1967 and recent is 2000
*/

SELECT *
FROM albums;

SELECT 
	release_date
FROM albums;
/*  4a. Dark Side of The Moon and The Wall
	4b. 1967
	4c. Grunge, Alternative Rock
	4d. The Bodyguard, Jagged Little Pill, Come On Over, Falling 	Into You, Let's Talk About Love, Dangerous, The Immaculate 		Collection, Titanic: Music from the Motion Picture, 			Metallica, Nevermind, Supernatural
	4e. Grease: The Original Soundtrack from the motion picture, 	bad, sgt. pepper's lonely hearts club band, dirty dancing, 		let's talk about love, dangerous, the immaculate collection, 	abbey road, born in the USA, brothers in arms, titanic: music	from the motion picture, nevermind, the wall
	4f. The beatles - 1, the beatles - sgt pepper's lonely hearts 	club, the beatles - abbey road, bruce springsteen - born in 	the usa, santana - supernatural. these results do not include 	Hard rock or Progressive rock as they are not in the string 	specified ('Rock') 
*/
## 4a query	below
SELECT artist, name
FROM albums
WHERE artist = 'Pink Floyd';
## 4b query below
SELECT release_date
FROM albums
WHERE name = "sgt. Pepper's Lonely Hearts Club Band";
## 4c query below
SELECT genre
FROM albums
WHERE name = 'Nevermind';
## 4d query below
SELECT name
FROM albums_db.albums
WHERE release_date BETWEEN 1990 AND 1999;
## 4e query below
SELECT name, sales
FROM albums_db.albums
WHERE sales < 20;
## 4f query below
SELECT genre, artist, name
FROM albums_db.albums
WHERE genre = 'Rock';