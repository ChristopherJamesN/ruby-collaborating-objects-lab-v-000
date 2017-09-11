class Song

  attr_accessor :name, :artist

  def initialize(name="Placeholder")
    @name = name
  end

  def artist_name(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist.name
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    song = self.new
    new_filename = filename.split(" - ")
    song.name = new_filename[1]
    song.artist_name=(filename[0])
  end

end
