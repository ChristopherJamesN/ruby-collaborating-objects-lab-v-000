class Song

  attr_accessor :name, :artist

  def initialize(name="Placeholder")
    @name = name
  end

  def artist_name
    if self.artist == nil
      return nil
    else
      self.artist.name
    end
  end

  def self.new_by_filename(filename)
    song = self.new
    new_filename = filename.split(" - ")
    song.name = new_filename[1]
    new_artist = Artist.find_or_create_by_name(new_filename[0])
    song.artist = new_artist
    song
  end

end
