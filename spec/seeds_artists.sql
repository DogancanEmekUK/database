TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY;

INSERT INTO artists(name, genre) VALUES ('Metallica', 'Heavy Metal');
INSERT INTO artists(name, genre) VALUES ('Rammstein', 'Industrial Metal');
INSERT INTO artists(name, genre) VALUES ('Disturbed', 'Heavy Metal');
INSERT INTO artists(name, genre) VALUES ('Hans Zimmer', 'Soundtrack');

INSERT INTO albums(title, release_year, artist_id) VALUES ('Enter Sandman', '1991', 1);
INSERT INTO albums(title, release_year, artist_id) VALUES ('Feuer Frei', '2006', 2);
INSERT INTO albums(title, release_year, artist_id) VALUES ('Ten Thousand Fists', '2008', 3);
INSERT INTO albums(title, release_year, artist_id) VALUES ('Cornfields', '2014', 4);