class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre_name)
    new_genre = new(genre_name)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end
end