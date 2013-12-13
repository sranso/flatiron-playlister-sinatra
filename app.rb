require './lib/playlister'
require './lib/parser'
require './lib/artist'
require './lib/song'
require './lib/genre'
require 'open-uri'
require 'nokogiri'
require 'bundler'
Bundler.require

class PlaylistApp < Sinatra::Application
  Playlister.new

  get '/' do
    erb :home
  end

  get '/artists' do
    erb :artists
  end

  get '/artists/:a_name' do
    @artist = params[:a_name].gsub("_", " ")
    @artist_obj = ::Artist.search_all(@artist)
    @download = open("http://ws.spotify.com/search/1/artist?q=#{@artist.gsub(" ", "_").gsub("$", "s")}").read
    @xml = Nokogiri::XML(@download)
    @artist_uri = @xml.search("artist")[0]["href"]
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
    @download = open("http://ws.spotify.com/search/1/track?q=#{@song.gsub(" ", "_")}").read
    @xml = Nokogiri::XML(@download)
    @song_uri = @xml.search("track")[0]["href"]
    erb :song
  end

end