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
        p albums = repo.all
        expect(albums.length).to eq 4
    end

    it "returns albums by the given id" do
        repo = AlbumRepository.new
        albums = repo.all
        expect(repo.find(1)).to eq ['Enter Sandman']
    end

end