require_relative 'artist'

class ArtistRepository

    def all
        artists = []

        sql = 'SELECT id, name, genre FROM artists;'

        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            artist = Artist.new
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']

            artists << artist
            
        end

        return artists

    end

    def find(id)
        artists = []

        sql = 'SELECT id, name, genre FROM artists WHERE id = 1;'

        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            artist = Artist.new
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']

            artists << artist
            
        end

        return artists.map { |artist| artist.name }

    end

end