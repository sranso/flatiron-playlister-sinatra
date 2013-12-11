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
    @artist = params[:a_name].gsub("_", " ")
    @artist_obj = ::Artist.search_all(@artist)
    erb :artist
  end

  get '/genres' do
    erb :genres
  end

  get '/genres/:g_name' do
    @genre = params[:g_name].gsub("_", " ")
    @genre_obj = ::Genre.search_all(@genre)
    erb :genre
  end

  get '/songs' do
    erb :songs
  end

  get '/songs/:s_title' do
    @song = params[:s_title].gsub("_", " ")
    @song_obj = ::Song.search_all(@song)
    erb :song
  end

end