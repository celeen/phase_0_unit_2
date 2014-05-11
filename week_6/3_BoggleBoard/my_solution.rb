# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself, with: ].


# 2. Pseudocode



# 3. Initial Solution

class BoggleBoard
  attr_reader :boggle_board, :num_rows, :num_cols
  def initialize(boggle_board)
    @boggle_board = boggle_board
    @num_rows = boggle_board.length
    @num_cols = boggle_board[0].length
  end
  
  def create_word(*coords)
    coords.map { |coord| @boggle_board[coord.first][coord.last] }.join("")
  end
  
  def get_row(row)
    @boggle_board[row]
  end

  def get_col(col)
    @boggle_board.transpose[col]
  end
  
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)

# DRIVER TESTS
def assert
  raise "Assertion failed!" unless yield
end
assert { boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock" }
assert { boggle_board.get_row(2) == ["e", "c", "l", "r"] }
assert { boggle_board.get_col(1) == ["r", "o", "c", "a"] }
(0...boggle_board.num_rows).to_a.each { |row| puts boggle_board.get_row(row).join }
(0...boggle_board.num_cols).to_a.each { |col| puts boggle_board.get_col(col).join }
assert { boggle_board.get_row(3)[2] == "k" }

# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:


# implement tests for each of the methods here:


# 5. Reflection 