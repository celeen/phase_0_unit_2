# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge [by myself- it's a solo challenge].

#create a class "Song"
#initialize new "song" object with two arguments: a song_title and an artist
#define a method #play which prints the name of the song

# Pseudocode
#create a  class "Playlist"
#initialize new playlist object with one splat argument, list_of_songs
#define a method, #add, which takes one argument, song, and
#which pushes "song" to end of playlist array
#define a method #num_of_tracks
#which return the length of the array
#define a method #remove
#which pops, and then deletes the last member of the array, or alternately, the named member
#define a method #includes? which takes one argument, a song_name
#returns true or false for whether the array includes specified member
#define a method #play_all
#which "plays" all song on the playlist, in order, in this case by printing their names as a part of a pretty string
#define a method #display which returns a numbered list of playlist members



# Initial Solution
class Song
	attr_reader :title, :artist

	def initialize(title, artist)
		@title = title
		@artist = artist
	end

	def play
		p "#{@title}, by #{@artist}."
	end
end

class Playlist
	attr_reader :list_of_songs

	def initialize(*list_of_songs)
		@list_of_songs = list_of_songs
	end

	def add(*songs)
		songs.each do |song|
			@list_of_songs << song
		end
	end

	def num_of_tracks
		p @list_of_songs.length
	end

	def remove(song = @list_of_songs.pop)
		@list_of_songs.delete(song)
	end

	def includes?(song_name)
		@list_of_songs.include?(song_name)
	end

	def play_all
		@list_of_songs.each do |song|
			song.play
		end
	end

	def display_all
		number = 1
		@list_of_songs.each do |song|
			p "#{number}. #{title}, #{artist}"
			number += 1
		end
	end
end








# Refactored Solution






# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display

def assert
	raise "Oh Noes! The Errors!" unless yield
	puts true
end

puts "Song.new creates a song"
assert { one_by_one.class == Song }

puts "Playlist.new creates a new playlist"
assert { my_playlist.class == Playlist }

puts "#add will add single or multiple songs to playlist"
puts "#remove will remove specified song"
assert { my_playlist.list_of_songs == [one_by_one, world_so_cold, going_under, lying_from_you] }
my_playlist.remove
puts "#remove will remove last song from playlist if none specified"
assert { my_playlist.list_of_songs == [one_by_one, world_so_cold, going_under] }

puts "#num_of_tracks returns number of songs on the playlist"
assert { my_playlist.num_of_tracks == 3 }

puts "#play prints the title and artist of the song as a string"
assert { going_under.play == "Going Under, by Evanescence." }

puts "#includes? returns true if playlist includes named song"
assert { my_playlist.includes?(one_by_one) == true }







# Reflection 