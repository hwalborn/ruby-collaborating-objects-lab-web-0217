require 'pry'
class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir[@path + "/*"]
    @files.map!{|song| song.split("#{path}/").join}
  end

  def import
    files.each {|song|
      artist = song.split(" - ")[0]
      title = song.split(" - ")[1]
      Artist.find_or_create_by_name(artist)
      Artist.all.find{|artist_object| artist_object.name == artist}.songs << title

      # binding.pry
    }
  end
end
