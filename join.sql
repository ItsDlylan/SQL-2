-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT *
FROM invoice
	JOIN invoice_line il
ON il.invoice_id = invoice.invoice_id
WHERE il.unit_price > .99;



-- Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT i.invoice_date "date", c.first_name "FirstName", c.last_name "lastName", i.total "total"
FROM invoice i
JOIN customer c
ON i.customer_id = c.customer_id;


-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers.
-- Support reps are on the employee table.
SELECT c.first_name "customer First", c.last_name "Customer Last", e.first_name "Support Rep FirstName", e.last_name "Support Rep LastName"
FROM customer c
JOIN employee e 
ON c.support_rep_id = e.employee_id;


-- Get the album title and the artist name from all albums.
SELECT al.title, ar.name
FROM album al
JOIN artist ar
ON al.artist_id = ar.artist_id;
-- Get all playlist_track track_ids where the playlist name is Music.
SELECT p.name "Playlist Name", pl.track_id "Track ID"
FROM playlist p
JOIN playlist_track pl
ON p.playlist_id = pl.playlist_id
WHERE p.name = 'Music';

-- Get all track name`s for `playlist_id.
SELECT t.name "Track Name", p.playlist_id "from PlayList ID"
FROM track t
JOIN playlist_track pl
ON t.track_id = pl.track_id
JOIN playlist p
ON pl.playlist_id = p.playlist_id;

-- Get all track name`s and the playlist `name that they’re on ( 2 joins ).
SELECT t.name "Track Name", p.name "In Playlist"
FROM track t
JOIN playlist_track pl
ON t.track_id = pl.track_id
JOIN playlist p
ON pl.playlist_id = p.playlist_id;

-- Get all track name`s and album `title`s that are the genre `Alternative & Punk ( 2 joins ).

SELECT t.name "Track Name", a.title "Album", g.name "Genre"
FROM track t
JOIN genre g
ON t.genre_id = g.genre_id
JOIN album a
ON t.album_id = a.album_id
WHERE g.name = 'Alternative & Punk';


