module Concerns::Findable
  def find_by_name(song_name)
    all.detect do |song|
      song.name == song_name
    end
  end

  def find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      create(song_name)
    end
  end
end