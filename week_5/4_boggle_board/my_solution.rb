# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [by myself, with: ].

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
#define a method that creates a word from the boggle board, create_word
#method takes to arguments, a nested array containing the layout of the board, and a series of board coordinates as a splat argument, so that they are added to an array
#Map the coordinates array to the boggle board so that
#the first coordinate becomes the index of the first layer of arrays, and the second coordinate indexes the nested arrays.
#After #map is ended, join the letters pulled with no seperator


# Initial Solution
def create_word(board, *coords) 
	coords.map { |coord| board[coord.first][coord.last]}.join("") 
end

# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE
p "Input coordinates [2,1], [1,1], [1,2], [0,3] create the word \'code\'."
puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]) == "code"
p "Input coordinates [0,1], [0,2], [1,2] create the word \'rad\'."
puts create_word(boggle_board, [0,1], [0,2], [1,2]) == "rad"
p "Input coordinates [2,2], [3,1], [3,2], [3,3] create the word \'lake\'."
puts create_word(boggle_board, [2,2], [3,1], [3,2], [3,3]) == "lake"


# Reflection 
#I would not have guessed that accessing nested arrays requires two seperate indexes in a row. My guess would have been that the index of the nexted array would be nexted in the index of the outer array. Good to know. I also discovered/remembered the splat argument! Just a quick web search solved that one pretty easily. Handy stuff.
#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# define a method get_row that returns the specified array element, or row of the boggle board
# method get_row takes two arguments, a boggle board, and a row number
# returns the element inside the array index that corresponds to the row number


# Initial Solution
# def get_row(board, row)
# 	return board[row]
# end

# Refactored Solution
#We could define a class, boggle_board, and create a new object, and run the method on that object. That might look something like this:

class BoggleBoard
	def initialize(array)
		@board = array
	end

	def get_row(row)
		@board[row]
	end
end

# DRIVER TESTS GO BELOW THIS LINE
# p "Method #get_row takes a row number as an argument and returns all elements in the row"
# p get_row(boggle_board, 2) == ["e", "c", "l", "r"]

# refactored driver code:
p "Method #get_row takes a row number as an argument and returns all elements in the row"
board = BoggleBoard.new([["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]])
p board.get_row(2) == ["e", "c", "l", "r"]


# Reflection 
# This one seems too easy. I can kind of imagine the contexts in which a method like this would come in handy, though. What if the boggle board isn't already a defined variable, or isn't a defined variable that's directly accessible at that point in the program?
#But also, on a more personal level. I am kind of amazed at how much harder jacascript was for me. I suppose I didn't spend months studying javascript before the unit, so it shouldn't be too surprising.

#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
# define a method get_col that will access the speficied column of a boggle board
#it takes two arguments, a boggle board as an array, and a column number
# map through each row of the board array, returning the indexed array member that matches the column number given

# Initial Solution
# def get_col(board, col)
# 	board.map {|row| row[col]}
# end

# Refactored Solution
# again, I'm not sure quite what to do here except for perhaps put it in the class context.

class BoggleBoard
	def initialize(array)
		@board = array
	end

	def get_row(row)
		@board[row]
	end

	def get_col(col)
		@board.map {|row| row[col]}
	end
end

# DRIVER TESTS GO BELOW THIS LINE
# p "Method get_col returns the column of the boggle board given"
# p get_col(boggle_board, 2) == ["a", "d", "l", "k"]
#refactored driver code:
p "Method get_col returns the column of the boggle board given"

board = BoggleBoard.new([["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]])
p board.get_col(2) == ["a", "d", "l", "k"]

# Reflection 

# This has been an interesting excercise showing the dynamics of nexted arrays, and also osme of the finer points of classes vs. lack-of-classes. Having classes gives a bit more control over what your finding, and in a larger program, I imagine, can help you keep your code dry by only needing to define certain variable once, and by being able to keep multiple objects of the same type around throughout the program.