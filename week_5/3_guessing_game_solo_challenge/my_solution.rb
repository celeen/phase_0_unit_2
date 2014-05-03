# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: Initially, the answer, then guesses, in addition a question to see what the solved state is
# Output: the state of the guess (:high, :low, or :correct) and the state of the solved variable (true or false)
# Steps:
# define a class, GuessingGame
# define the initialize method, which takes one variable, the answer of the game
#initialize has two variables, @answer, set to equal answer, and @solved, set to false
# define method #guess, which takes one argument, an integer, 
# Unless guess number == @answer, solved? = false
#else solved? = true
# returns one of three options:
# if argument integer is equal to @answer, returns :correct, changes @solved to true
# if argument integer is lower than @answer, returns :low
#if argument integer is higher than @answer, returns :high
# define method #solved?, which returns @solved




# 3. Initial Solution

# class GuessingGame
#   def initialize(answer)
#     @answer = answer
#     @solved = false
#   end
  
#   def guess(number)
#   	unless number == @answer
#   		@solved = false
#   	else @solved = true
#   	end
#   	if number < @answer
#   		return :low
#   	elsif number> @answer
#   		return :high
#   	elsif number == @answer
#   		return :correct
#   	end
#   end
  		

#   def solved?
#   	return @solved
#   end
# end




# 4. Refactored Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end
  
  def guess(number)
  	number == @answer ? @solved = true : @solved = false
  	return :low if number < @answer
  	return :high if number> @answer
  	return :correct if number == @answer
  end
  		

  def solved?
  	return @solved
  end
end





# 1. DRIVER TESTS GO BELOW THIS LINE
game = GuessingGame.new(5)

# p "GuessingGame.new should take one argument."
# p "method #guess is defined"
# p "method #guess takes a single argument"

p "Returns \":high\" when guess is too high."
	
	p game.guess(6) == :high

p "Returns \":low\" when guess is too low."
	
	p game.guess(4) == :low

p "Returns \":correct\" when guess is correct"
	
	p game.guess(5) == :correct

p "Guessing the correct answer changes @solved to \'true\'."
	
	game.guess(5)

	p game.solved? == true

p "Guessing incorrectly does not alter @solved state from \'false\'."

	game.guess(4)

	p game.solved? == false

p "Game#solved should reflect the last guess."
	
	game.guess(5)

	game.guess(4)

	p game.solved? == false

# p "Metheod #solved is defined"
# p "Method #solved expects no arguments"

p "#solved returns false by default"

	new_game = GuessingGame.new(10)

	p new_game.solved? == false






# 5. Reflection 

#Am I really done with this exercise already? I am worried about finishing some of the others, but if I were to spend more time on this, I might want to add argument errors to ensure that only integers get input.

#I am wondering if there is an even more succinct way to write the if statements; a ternary won't work there because there are three options rather than two.

#At one point, I rewrote the method guess so that @solved was changed appropriately within each if statement. But it didn't pass! I am not sure why.
