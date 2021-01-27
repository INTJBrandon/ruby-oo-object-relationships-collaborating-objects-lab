require 'pry'
class MP3Importer
    attr_accessor :path
    def initialize(path)
        self.path = path

    end

    def files
        paths = Dir.entries(path)
        songs = paths.select {|path| path.include?(".mp3")}
        songs

    end

    def import
        songs = self.files
        songs.each do |song|
            Song.new_by_filename(song)
        end
    end
    
end