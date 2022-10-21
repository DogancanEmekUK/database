require 'album_repository'

RSpec.describe AlbumRepository do

    def reset_albums_table
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_albums_table
    end

    it "returns all albums" do
        repo = AlbumRepository.new
        albums = repo.all
        expect(albums.length).to eq 12
    end

    it "adds an album to the table" do
        repo = AlbumRepository.new

        album = Album.new
        album.title = 'Death Magnetic'
        album.release_year = '2008'
        album.artist_id = 1

        repo.create(album)
        expect(repo.all.length).to eq 13
    end

    it "deletes an album by the given name" do
        repo = AlbumRepository.new
        repo.delete(3)
        expect(repo.all.length).to eq 11
    end

    it "returns albums by the given title" do
        repo = AlbumRepository.new
        albums = repo.all
        expect(repo.find(1)).to eq ["Doolittle - 1989 - 1"]
    end

end