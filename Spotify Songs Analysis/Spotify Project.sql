create database project;
use project;

-- Create Spotify data table
CREATE TABLE spotify_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_title VARCHAR(255),
    artist VARCHAR(255),
    album VARCHAR(255),
    release_date DATE,
    genre VARCHAR(255)
);

-- Insert 50 entries into the table
INSERT INTO spotify_data (song_title, artist, album, release_date, genre) VALUES
('Shape of You', 'Ed Sheeran', '÷ (Divide)', '2017-01-06', 'Pop'),
('Blinding Lights', 'The Weeknd', 'After Hours', '2019-11-29', 'R&B'),
('Uptown Funk', 'Mark Ronson ft. Bruno Mars', 'Uptown Special', '2014-11-10', 'Funk, Pop'),
('Sicko Mode', 'Travis Scott', 'ASTROWORLD', '2018-08-03', 'Hip Hop'),
('Dance Monkey', 'Tones and I', 'The Kids Are Coming', '2019-05-10', 'Pop'),
('Old Town Road (Remix)', 'Lil Nas X ft. Billy Ray Cyrus', '7 EP', '2019-04-05', 'Country Rap'),
('Happier', 'Marshmello ft. Bastille', 'Joytime II', '2018-08-17', 'Dance, Pop'),
('Someone You Loved', 'Lewis Capaldi', 'Divinely Uninspired to a Hellish Extent', '2018-11-08', 'Pop, Indie'),
('Sunflower', 'Post Malone ft. Swae Lee', 'Spider-Man: Into the Spider-Verse', '2018-10-18', 'Hip Hop'),
('Rockstar', 'Post Malone ft. 21 Savage', 'Beer Bongs & Bentleys', '2017-09-15', 'Hip Hop'),
('Bad Guy', 'Billie Eilish', 'When We All Fall Asleep, Where Do We Go?', '2019-03-29', 'Pop'),
('Despacito (Remix)', 'Luis Fonsi & Daddy Yankee ft. Justin Bieber', 'Vida', '2017-04-17', 'Pop, Latin'),
('See You Again', 'Wiz Khalifa ft. Charlie Puth', 'Furious 7: Original Motion Picture Soundtrack', '2015-03-10', 'Hip Hop'),
('Closer', 'The Chainsmokers ft. Halsey', 'Collage', '2016-07-29', 'EDM, Pop'),
('7 Rings', 'Ariana Grande', 'Thank U, Next', '2019-01-18', 'Pop, R&B'),
('Savage Love (Laxed - Siren Beat)', 'Jawsh 685, Jason Derulo', 'Savage Love (Laxed - Siren Beat)', '2020-06-11', 'Dance, Pop'),
('Hello', 'Adele', '25', '2015-10-23', 'Pop, Soul'),
('Memories', 'Maroon 5', 'Memories', '2019-09-20', 'Pop, Rock'),
('Senorita', 'Shawn Mendes, Camila Cabello', 'Shawn Mendes', '2019-06-21', 'Pop'),
('Roar', 'Katy Perry', 'Prism', '2013-08-10', 'Pop'),
('Cheap Thrills', 'Sia ft. Sean Paul', 'This Is Acting', '2015-12-17', 'Pop'),
('Radioactive', 'Imagine Dragons', 'Night Visions', '2012-10-29', 'Rock, Alternative'),
('Thinking Out Loud', 'Ed Sheeran', 'x', '2014-09-24', 'Pop, Soul'),
('Sorry', 'Justin Bieber', 'Purpose', '2015-10-23', 'Pop, R&B'),
('Don''t Let Me Down', 'The Chainsmokers ft. Daya', 'Collage', '2016-02-05', 'EDM, Pop'),
('Believer', 'Imagine Dragons', 'Evolve', '2017-02-01', 'Pop, Rock'),
('All of Me', 'John Legend', 'Love in the Future', '2013-08-12', 'R&B, Soul'),
('I Don''t Care', 'Ed Sheeran, Justin Bieber', 'No.6 Collaborations Project', '2019-05-10', 'Pop'),
('Girls Like You', 'Maroon 5 ft. Cardi B', 'Red Pill Blues', '2018-05-30', 'Pop'),
('New Rules', 'Dua Lipa', 'Dua Lipa', '2017-06-02', 'Pop'),
('Photograph', 'Ed Sheeran', 'x', '2014-06-20', 'Pop'),
('Stressed Out', 'Twenty One Pilots', 'Blurryface', '2015-04-28', 'Pop, Rock'),
('What Do You Mean?', 'Justin Bieber', 'Purpose', '2015-08-28', 'Pop, R&B'),
('Love Yourself', 'Justin Bieber', 'Purpose', '2015-11-09', 'Pop, R&B'),
('Havana', 'Camila Cabello ft. Young Thug', 'Camila', '2018-08-03', 'Pop, Latin'),
('Humble', 'Kendrick Lamar', 'DAMN.', '2017-03-30', 'Hip Hop'),
('Love Me Like You Do', 'Ellie Goulding', 'Fifty Shades of Grey: Original Motion Picture Soundtrack', '2015-01-07', 'Pop'),
('Can''t Feel My Face', 'The Weeknd', 'Beauty Behind the Madness', '2015-06-08', 'R&B'),
('Better Now', 'Post Malone', 'Beerbongs & Bentleys', '2018-04-27', 'Hip Hop'),
('Stay', 'Zedd & Alessia Cara', 'Stay', '2017-02-23', 'EDM, Pop'),
('Work', 'Rihanna ft. Drake', 'ANTI', '2016-01-27', 'Pop, R&B'),
('Watermelon Sugar', 'Harry Styles', 'Fine Line', '2019-12-13', 'Pop, Rock'),
('Without Me', 'Halsey', 'Without Me', '2018-10-04', 'Pop, R&B'),
('Perfect', 'Ed Sheeran', '÷ (Divide)', '2017-03-03', 'Pop'),
('Let Her Go', 'Passenger', 'All the Little Lights', '2012-07-24', 'Folk, Indie'),
('Can''t Hold Us', 'Macklemore & Ryan Lewis ft. Ray Dalton', 'The Heist', '2011-08-16', 'Hip Hop'),
('Counting Stars', 'OneRepublic', 'Native', '2013-06-14', 'Pop, Rock'),
('Titanium', 'David Guetta ft. Sia', 'Nothing but the Beat', '2011-08-08', 'EDM, Pop'),
('The Box', 'Roddy Ricch', 'Please Excuse Me For Being Antisocial', '2019-12-06', 'Hip Hop');

select*from spotify_data;

SELECT *
FROM spotify_data
LIMIT 5;

SELECT artist, SUM(CASE WHEN genre = 'Pop' THEN 1 ELSE 0 END) AS pop_count,
             SUM(CASE WHEN genre = 'R&B' THEN 1 ELSE 0 END) AS rnb_count
FROM spotify_data
GROUP BY artist;

SELECT CASE 
           WHEN release_date BETWEEN '2010-01-01' AND '2015-12-31' THEN '2010-2015'
           WHEN release_date BETWEEN '2016-01-01' AND '2020-12-31' THEN '2016-2020'
           ELSE 'Before 2010 or After 2020'
       END AS release_range,
       COUNT(*)
FROM spotify_data
GROUP BY release_range;

SELECT song_title, artist, album, release_date, genre,
       SUM(id) OVER (ORDER BY release_date) AS running_total
FROM spotify_data;


SELECT song_title, artist, album, release_date, genre,
       AVG(id) OVER (ORDER BY release_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM spotify_data;


SELECT song_title, artist, album, release_date, genre,
       release_date - LAG(release_date) OVER (ORDER BY release_date) AS release_date_delta
FROM spotify_data;

SELECT *
FROM spotify_data
WHERE genre IN (SELECT DISTINCT genre FROM spotify_data WHERE artist = 'Ed Sheeran');



SELECT COUNT(*) AS duplicate_count
FROM (
    SELECT song_title, artist, album, release_date, genre
    FROM spotify_data
    GROUP BY song_title, artist, album, release_date, genre
    HAVING COUNT(*) > 1
) AS duplicates;


SELECT artist, SUM(CASE WHEN genre = 'Pop' THEN 1 ELSE 0 END) AS pop_count,
             SUM(CASE WHEN genre = 'R&B' THEN 1 ELSE 0 END) AS rnb_count
FROM spotify_data
GROUP BY artist;

SELECT CASE 
           WHEN release_date BETWEEN '2010-01-01' AND '2015-12-31' THEN '2010-2015'
           WHEN release_date BETWEEN '2016-01-01' AND '2020-12-31' THEN '2016-2020'
           ELSE 'Before 2010 or After 2020'
       END AS release_range,
       COUNT(*)
FROM spotify_data
GROUP BY release_range;

SELECT song_title, artist, album, release_date, genre,
       SUM(id) OVER (ORDER BY release_date) AS running_total
FROM spotify_data;


SELECT song_title, artist, album, release_date, genre,
       AVG(id) OVER (ORDER BY release_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM spotify_data;

SELECT song_title, artist, album, release_date, genre,
       release_date - LAG(release_date) OVER (ORDER BY release_date) AS release_date_delta
FROM spotify_data;


SELECT song_title, artist, album, release_date, genre,
       EXTRACT(YEAR FROM release_date) - EXTRACT(YEAR FROM LAG(release_date) OVER (ORDER BY release_date)) AS year_diff
FROM spotify_data;


SELECT song_title, artist, album, release_date, genre,
       COUNT(*) OVER () AS series_length
FROM spotify_data;


#advanced sql queries
SELECT genre, COUNT(*) AS num_songs
FROM spotify_data
GROUP BY genre;

SELECT artist, COUNT(*) AS num_songs
FROM spotify_data
GROUP BY artist
ORDER BY num_songs DESC
LIMIT 5;

SELECT AVG(YEAR(release_date)) AS avg_release_year
FROM spotify_data;


SELECT MIN(release_date) AS oldest_song, MAX(release_date) AS newest_song
FROM spotify_data;

SELECT Max(release_date) AS oldest_song, Min(release_date) AS newest_song
FROM spotify_data;

SELECT MIN(release_date) AS oldest_song, Min(release_date) AS newest_song
FROM spotify_data;

SELECT Max(release_date) AS oldest_song, MAX(release_date) AS newest_song
FROM spotify_data;



SELECT *
FROM spotify_data
WHERE YEAR(release_date) = 2019
ORDER BY release_date;


SELECT YEAR(release_date) AS release_year, COUNT(*) AS num_songs
FROM spotify_data
GROUP BY release_year
ORDER BY release_year;


SELECT AVG(LENGTH(genre) - LENGTH(REPLACE(genre, ',', '')) + 1) AS avg_num_genres
FROM spotify_data;


SELECT *
FROM spotify_data
WHERE genre LIKE '%Pop%' AND release_date > '2018-01-01';


SELECT SUM(LENGTH(song_title)) AS total_characters
FROM spotify_data;

SELECT album, COUNT(DISTINCT genre) AS num_unique_genres
FROM spotify_data
GROUP BY album
ORDER BY num_unique_genres DESC
LIMIT 3;
