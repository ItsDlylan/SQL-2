
-- Find a count of how many tracks there are per genre. Display the genre name with the count.
SELECT COUNT(*), g.name "Genre"
FROM track t
JOIN genre g 
ON t.genre_id = g.genre_id
GROUP BY g.name;


-- Find a count of how many tracks are the “Pop” genre and how many tracks are the “Rock” genre.
SELECT COUNT(*) "number of songs", g.name "Genre"
FROM track t 
JOIN genre g 
ON t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

-- Find a list of all artists and how many albums they have.

SELECT COUNT(*), ar.name "Artist"
FROM artist ar
JOIN album al
ON ar.artist_id = al.artist_id
GROUP BY ar.name;
