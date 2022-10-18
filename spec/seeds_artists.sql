TRUNCATE TABLE artists RESTART IDENTITY;
-- TRUNCATE TABLE albums RESTART IDENTITY;

INSERT INTO artists(name, genre) VALUES ('Metallica', 'Heavy Metal');
INSERT INTO artists(name, genre) VALUES ('Rammstein', 'Industrial Metal');
INSERT INTO artists(name, genre) VALUES ('Disturbed', 'Heavy Metal');
INSERT INTO artists(name, genre) VALUES ('Hans Zimmer', 'Soundtrack');
-- INSERT INTO albums(title, release_year, artist_id) VALUES('Enter Sandman', 1991, 1);