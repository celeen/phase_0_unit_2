# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

#Define method "get grade"
#Method "get grade" takes an argument, an array
#Compute Average score:
#define a variable "sum" which is equal to 0
#for each member of the array add that member the current value of "sum"
#set variable equal to "average"
#"average" equals "sum" divided by the array length
#Translate to letter grade:
#if average is between 90 and 100,
#return "A"
#if average is between 80 and 89,
#return "B"
#if 'average' is between 70 and 79,
#return "C"
#if 'average' is between 60 and 69,
#return "D"
#if 'average' is below 59,
#return "F"


# 2. Initial Solution
def get_grade (array)
	sum = 0
	array.each {|x| sum += x}
	average = sum/array.length
	case average
	when 90..100
		return "A"
	when 80..89
		return "B"
	when 70..79
		return "C"
	when 60..69
		return "D"
	else 
		return "F"
	end
end



# 3. Refactored Solution
#Again, this was a relatively simple exercise. I found myself refactoring to a certain extent as I went. For example, the sum configuration has been refactored since the first exercise... I will change that in that file. I have a feeling that when I come back to this, I will tihnk of ways to refactor.


# 4. Reflection 
#I decided to figure out case instead of using if/elsif. I'm glad I did! I was confused by the first line of case in many examples I'd seen up to this point. I didn't understand what to put after the word 'case' until I saw the test failures, and error messages.
