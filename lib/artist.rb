require "pry"

class Artist
  attr_accessor :name, :songs
  @@all =[]
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def save

  end

  def print_songs
    @songs.each{|song| puts song.name}
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    return_name = @@all.detect{|artist| artist.name == name}
    return_name ? return_name : self.new(name)
  end

end
