-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT *
FROM invoice_line
WHERE invoice_id IN(
	SELECT invoice_id FROM invoice WHERE unit_price > '.99'
);

-- Get all playlist tracks where the playlist name is Music.
SELECT playlist_track_id
FROM playlist_track
WHERE playlist_id IN (
 	SELECT playlist_id FROM playlist WHERE name = 'Music'
);
-- Get all track names for playlist_id 5.
SELECT t.name "Track Name"
FROM track t
WHERE track_id IN (
  SELECT track_id FROM playlist_track WHERE playlist_id = '5'
);
-- Get all tracks where the genre is Comedy.
SELECT t.name "Track Name"
FROM track t
WHERE genre_id IN (
  	SELECT genre_id FROM genre as g WHERE name = 'Comedy'
);

-- Get all tracks where the album is Fireball.
SELECT t.name "Track Name"
FROM track t
WHERE album_id IN (
  SELECT album_id FROM album WHERE title = 'Fireball'
);

-- Get all tracks for the artist Queen ( 2 nested subqueries ).
SELECT t.name "Queen Song"
FROM track t 
WHERE album_id IN (
  SELECT album_id FROM album WHERE artist_id IN (
    SELECT artist_id FROM artist WHERE name = 'Queen'
));