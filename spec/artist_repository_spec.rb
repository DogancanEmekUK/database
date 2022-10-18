require 'artist_repository'

RSpec.describe ArtistRepository do

    def reset_artists_table
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_artists_table
    end

    it "returns all artists" do
        repo = ArtistRepository.new
        artists = repo.all
        expect(artists.length).to eq 4
    end

    it "returns artists by the given genre" do
        repo = ArtistRepository.new
        artists = repo.all
        expect(repo.find(4)).to eq artists[3]
    end

end