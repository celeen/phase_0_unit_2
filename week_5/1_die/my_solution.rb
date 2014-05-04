# U2.W5: Die Class 1: Numeric
#Ask about Argument Error check?

# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: sides, roll method, initialize
# Output: an object in the Die class with specified number of sides, and the ability to call roll on the object, which returns a random number between 1 and the number of sides. Also, an argument error if the number of sides specified is less than 1
# Steps:
#define a new class, Die, which takes one argument, sides
#def initialization method as pointing the argument, sides, to an instance method @sides
#raise an argument error if the number of sides is less than or equal to 1
#def a method sides that returns the number of sides
#def a method roll which returns a random number between 1 and the number of sides


# 3. Initial Solution

class Die
  def initialize(sides)
  	if sides < 1
  		raise ArgumentError.new("A die should have sides!")
  	end
  	@sides = sides
  end
  
  def sides
  	 return @sides
  end
  
  def roll
    return rand(1..@sides)
  end
end



# 4. Refactored Solution
#I refactored the driver tests more than the code. HAH! Still getting used to how to write them well. I can't wait to start in rpsec!
class Die
  def initialize(sides)
    if sides < 1
      raise ArgumentError.new("A die should have sides!")
    end
    @sides = sides
  end
  
  def sides
    @sides
  end
  
  def roll
  rand(1..@sides)
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE
p "Test 1: new die takes one argument, number of sides"
die = Die.new(100)
p die.sides == 100

p "Test 2 : if sides < 1, argument error is raised"
begin
  Die.new(0) 
rescue 
puts $!.message == "A die should have sides!"
end

p "Test 3: roll method returns random number between 1 and (sides)"
p (1..die.sides).include? (die.roll)








# 5. Reflection 

#I couldn't figure out how to write the tests to test for an argument exception for a minute, but then I found these two links:

#http://www.ruby-doc.org/core-2.1.1/Exception.html#method-i-message
#http://stackoverflow.com/questions/21353945/is-there-a-way-to-test-argument-errors-from-within-a-method-to-return-true-or-fa

#I am so happy that exception count as their own class! I mean, of course they do, everything has a class, right? I still don't completely understand what's going on there. I think I will attend some office hours and ask.