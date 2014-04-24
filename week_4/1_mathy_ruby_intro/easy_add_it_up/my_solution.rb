# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

#define "total" as a method
#give 'total' an argument
#body of code should
#cycle each array member
#into a seperate variable,
#adding the next to the varialbe total each time
#return total


# 2. Initial Solution
def total (array) 
	sum = 0
	array.each do |x|
		sum += x
	end
	return sum
end

def sentence_maker (array)
	array[0].capitalize!
	return "#{array.join(" ")}."
end



# 3. Refactored Solution
#These methods are pretty simple; I have already used short, inclusive methods within them. I am not aware of any way to make them clearer or more concise at this time.
def total (array) 
	sum = array.reduce(:+)
	return sum
end

def sentence_maker (array)
	array[0].capitalize!
	return "#{array.join(" ")}."
end

# 4. Reflection 
#I am fortunate enough to have learned about the join method at a meetup earlier this year. (Also, the javascript materials mentioned a similar function for javascript.) I have scoured Ruby Docs for a way to shorten my first method, but I cannot find a pre-existing method that will create the sum.