require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        arr = filename.split(" - ")
        song_name = arr[1]
        artist = arr[0]
        song = self.new(song_name)
        song.artist = Artist.new(artist)
        song
      end

    def artist_name=(name)
        new_artist = Artist.find_or_create_by_name(name)
        self.artist = new_artist
    end


end