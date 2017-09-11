class Song

  attr_accessor :name, :artist

  def initialize(name="Placeholder")
    @name = name
  end

  def artist_name=(filename)
    Artist.find_or_create_by_name(filename)
    add_song(@name)
  end

  def self.new_by_filename(filename)
    new_filename = filename.split(" - ")
    song = Song.new(new_filename[1])
    song.artist_name = filename[0]
  end

end
