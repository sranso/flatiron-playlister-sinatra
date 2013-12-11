class Song
  attr_accessor :title, :artist
  attr_reader :genre

  SONGS = []

  def initialize(title, artist)
    @title = title
    @genre
    @artist = artist
    SONGS << self
  end

  def genre=(genre_obj)
    @genre = genre_obj
    genre_obj.songs << self unless genre_obj.songs.include? self
  end

  def self.all
    SONGS
  end

end