require_relative 'album'

class AlbumRepository

    def all
        albums = []

        sql = 'SELECT id, title, release_year, artist_id FROM albums;'

        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']

            albums << album
            
        end

        return albums

    end

    def create(album)

        sql = 'INSERT INTO albums(title, release_year, artist_id) VALUES($1, $2, $3);'

        params = [album.title, album.release_year, album.artist_id]

        result_set = DatabaseConnection.exec_params(sql, params)

        return all

    end

    def delete(id)

        sql = 'DELETE FROM albums WHERE id = $1;'

        params = [id]

        result_set = DatabaseConnection.exec_params(sql, params)

        return all

    end

    def update(album)

        sql = 'UPDATE albums SET title = $1, release_year = $2, artist_id = $3 WHERE id = $4;'

        params = [album.title, album.release_year, album.artist_id, album.id]

        result_set = DatabaseConnection.exec_params(sql, params)

        return all[3]

    end

    def find(title)

        albums = []

        sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE title = $1;'

        params = [title]

        result_set = DatabaseConnection.exec_params(sql, params)

        result_set.each do |record|
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']

            albums << album
        end
        
        return albums.map { |album| "#{album.title} - #{album.release_year} - #{album.artist_id}" }

    end

end