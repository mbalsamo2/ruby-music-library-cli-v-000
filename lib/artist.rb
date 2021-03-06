require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def genres
  collection = @songs.map do |instance|
      instance.genre
    end
    collection.uniq
  end

end
