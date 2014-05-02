# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: an array of labels
# Output: one of those array members
# Steps:
#define a class, Die
#define the method initialize, which takes one argument, a non-empty array
#raise an argument error if the array is empty
#set set the input argument to a local variable, @label

#define a method, sides, which will return the number of sides on the die
#return the length of the array @labels plus one
#define the method roll, which will return a random member of the input array



# 3. Initial Solution

class Die
  def initialize(labels)
  	if labels.length < 1
  		raise ArgumentError.new("A die should have sides!")
  	end
  	@labels = labels
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels.sample
  end
end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# p "Test 1: Initialize Method Takes One Argument"
# die = Die.new(["A","B","C","D","E"])
# p is_array(die)

p "Test 2: An Argument Error is raised of the array argument is empty"
	
begin
	Die.new([]) 
rescue ArgumentError => e
	a = e.message
end
puts a == "A die should have sides!"
	

p "Test 3: Method #sides should return number of sides given upon initialization"
	labels = ["A","B","C","D","E"]
	die = Die.new(labels)
p	die.sides == labels.length

p "Test 4: Method #roll returns a single label  if one label is passed in"
	die = Die.new(["A"])
	p die.roll == "A"

p "Test 5: Method #roll returns every possible possible label for a sufficiently large number of rolls"
	
	possible_values = ('A'..'Z').to_a.shuffle.first(15)
	die = Die.new(possible_values)
	output = Array.new(10000) {die.roll}.uniq

	p output.sort == possible_values.sort





# 5. Reflection 
#uniq! and sample! These are the amazing array methods I learned about today. (exclamation points added for writing emphasis, and are not indicative of method destructivity)

#Also ironed out how to (a)rescue an exception, (b) compare that exception to something with a boolean and, although it doesn't pertain to this particular excercise (c) print that exception simply and move on.

#I read a couple blog posts/stackoverflow posts:
#http://coderrr.wordpress.com/2008/11/07/the-simple-way-to-print-exceptions-in-ruby/
#http://stackoverflow.com/questions/21353945/is-there-a-way-to-test-argument-errors-from-within-a-method-to-return-true-or-fa
#I didn't understand the first until I read the second. And then I thought I understood the second AND the first, so I implimented the second, and it didn't work. It just returned false. I still don't understand why; but this situation looks a lot the same as last week's mad libs/homework cheater program, so I am assuing that I just need to learn more nuance surrounding p/puts and returns and how that all happens.
#I then implimented the way described in the stackoverflow post, and it worked.
#My thrilling conclusion is that if all you need to do is print the exception, or it's position and move on, then the first blog's method is the way to go. They argue that there's really no need to store it in a seperate variable.
#But if you want to call that variable later, you should probably store it in a seperate variable. In the second example, I am more sure of what I am comparing. And also, it works.
