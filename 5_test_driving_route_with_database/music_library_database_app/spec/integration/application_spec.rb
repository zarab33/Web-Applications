require "spec_helper"
require "rack/test"
require_relative '../../app'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application }

  def reset_albums_table
    seed_sql = File.read('spec/seeds/albums_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

   def reset_artists_table
    seed_sql = File.read('spec/seeds/artists_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_albums_table
    reset_artists_table
  end

  context 'GET /albums/' do
    it 'should return info about all albums' do
      response = get('/albums/')

      expect(response.status).to eq(200)
      expect(response.body).to include('Doolittle')
      expect(response.body).to include('Release year: 1989')
      expect(response.body).to include('Artist: Pixies')
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end
  end

  context 'GET /albums/:id' do
    it 'should get info about the album by id 1' do
      response = get('/albums/1')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Doolittle</h1>')
      expect(response.body).to include('Release year: 1989')
      expect(response.body).to include('Artist: Pixies')
    end
  

    it 'should get info about the album by id 2' do
        response = get('/albums/2')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>Surfer Rosa</h1>')
        expect(response.body).to include('Release year: 1988')
        expect(response.body).to include('Artist: Pixies')
      end
  end

  context 'GET /albums' do
    it "should return a list of albums" do
      response = get("/albums")

      expected_response = ("Doolittle, Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring")

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
      
    end
  end

  context 'POST /albums' do
    it "should create a new album" do
      response = post('/albums', title: 'Voyage',
                      release_year: '2022',
                      artist_id: '2')

      expect(response.status).to eq(200)
      expect(response.body).to eq('')

      response = get('/albums')

      expect(response.body).to include('Voyage')
    end
  end

   context 'GET /artists' do
    it 'should return a list of artists' do
      response = get('/artists')

      expected_response = ('Pixies, ABBA, Taylor Swift, Nina Simone')

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end


  context 'POST /artists' do
    it 'should create a new artist' do
      response = post('/artists', name: 'Wild nothing', genre: 'Indie')

      expect(response.status).to eq(200)
      expect(response.body).to eq('')

      response = get('/artists')

      expected_response = 'Pixies, ABBA, Taylor Swift, Nina Simone, Wild nothing'

      expect(response.body).to eq(expected_response)
    end
  end
end



 