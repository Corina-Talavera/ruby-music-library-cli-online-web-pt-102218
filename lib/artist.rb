class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
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

  def self.create(artist_name)
    new_artist = new(artist_name)
    new_artist.save
    new_artist
  end

  def add_song(song_obj)
    song_obj.artist = self if song_obj.artist == nil
    @songs << song_obj if @songs.include?(song_obj) == false
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end
end