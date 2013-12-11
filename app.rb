require './lib/playlister'
require './lib/parser'
require './lib/artist'
require './lib/song'
require './lib/genre'
require 'bundler'
Bundler.require

class PlaylistApp < Sinatra::Application

  before do
    @playlister = Playlister.new
    @artists = @playlister.all_artists
    @genres = @playlister.all_genres
    @songs = @playlister.all_songs
  end

  get '/home' do
    erb :home
  end

  get '/artists' do
    erb :artists
  end

  get '/artists/:a_name' do
    erb :artist
  end

  get '/genres' do
    erb :genres
  end

  get '/genres/:g_name' do
    erb :genre
  end

  get '/songs' do
    erb :songs
  end

  get '/song' do
    erb :song
  end

end