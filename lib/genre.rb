class Genre

  attr_accessor :name
  GENRES = []

  def initialize(name)
    @name = name.capitalize
    @songs = []
    @artists = []
    GENRES << self
  end

  def songs
    @songs
  end

  def artists
    @artists
  end

  def self.all
    GENRES
  end

  def self.reset_genres
    GENRES.clear
  end

  def self.search_all genre
    GENRES.detect {|defined_genre| defined_genre.name == genre}
  end

end