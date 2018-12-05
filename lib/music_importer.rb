require 'pry'
 class MusicImporter
  attr_reader :path
  attr_accessor :path
   def initialize(path)
    @path = path
  def initialize(file_path)
    @path = file_path
  end
   def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
    mp3_path = Dir.open(self.path)
    mp3_files = mp3_path.map { |file| file }
    2.times {mp3_files.shift}
    mp3_files
  end
   def import
    files.each{|f| Song.create_from_filename(f)}
    self.files.each do |file|
      file = file.split(' - ')
      song_name = file[1]
      artist = Artist.find_or_create_by_name(file[0])
      genre = Genre.find_or_create_by_name(file[2].split('.')[0])
      Song.create(song_name, artist, genre) 
    end
  end
end