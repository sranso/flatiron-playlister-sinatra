class Song
  attr_accessor :title, :artist, :genre
  attr_reader :genre

  SONGS = []

  def initialize(title, artist)
    @title = title
    @artist = artist
    @genre
    SONGS << self
  end

  def genre=(genre_obj)
    @genre = genre_obj
    genre_obj.songs << self unless genre_obj.songs.include? self
  end

  def self.all
    SONGS
  end

  def self.search_all(song)
    SONGS.detect {|defined_song| defined_song.title == song}
  end

end