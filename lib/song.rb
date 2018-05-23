require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    song.save
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song1 = Song.find_by_name(name)
    if song1 == nil
      Song.create_by_name(name)
    else
      song1
    end
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_string)
    song_array = file_string.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1].gsub(".mp3", "")

    new_song = self.new_by_name(name)
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(file_string)
    song_array = file_string.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1].gsub(".mp3", "")

    new_song = self.create_by_name(name)
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    all.clear
  end
end
