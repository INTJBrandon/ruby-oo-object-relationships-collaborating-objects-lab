require 'pry'
class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do |song| song.artist == self
        end
    end

    def self.find_or_create_by_name(name)
        if artist = self.all.find {|artist| artist.name == name}
            artist
        else
            Artist.new(name)
        end
    end

    def print_songs
    songs.each {|song| puts song.name}
  end
end