require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test')

# Perform a SQL query on the database and get the result set.
sql_artist = 'SELECT id, name, genre FROM artists;'
result_artist = DatabaseConnection.exec_params(sql_artist, [])

# Print out each record from the result set .
result_artist.each do |record|
  p record
end

sql_album = 'SELECT id, title, release_year, artist_id FROM albums;'
result_album = DatabaseConnection.exec_params(sql_album, [])

result_album.each do |record|
  p record
end

sql_album = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = 3;'
result_album = DatabaseConnection.exec_params(sql_album, [])

result_album.each do |record|
  p record
end

