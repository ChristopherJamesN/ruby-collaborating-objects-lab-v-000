class Song

  attr_accessor :name, :artist

  def initialize(name="Placeholder")
    @name = name
  end

  def artist_name=(name)
    new_artist=Artist.find_or_create_by_name(name)
    self.artist=new_artist
    new_artist.add_song(self)
  end

  def self.new_by_filename(filename)
    new_filename = filename.split(" - ")
    song = Song.new
    song.name=new_filename[1]
    song.artist_name = new_filename[0]
    song
  end

  def artist=(artist)
    @artist = artist
  end

end
