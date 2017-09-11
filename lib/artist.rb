class Artist

  attr_accessor :name
  @@song_count=0
  @@all = []

  def initialize(name="Placeholder")
    @songs = []
    @name = name
  end

  def add_song(song)
    @songs << song
    song.artist = self
    @@song_count += 1
  end

  def add_song_by_name(name)
    song = Song.new(name)
    @songs << song
    song.artist = self
    @@song_count += 1
  end

  def self.song_count
    @@song_count
  end

  def songs
    @songs
  end

  def save
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(self.name) == true
      self
    else
      artist = Artist.new(name)
      artist.save
      artist
    end
  end

  def print_songs
    @songs.each do |song|
      puts "#{song.name}"
    end
  end

end
