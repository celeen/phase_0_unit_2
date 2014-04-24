# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

#define a method named 'mode'
#method 'mode' takes a single argument, an array
#define a variable, count, set equal to 0
#define a variable 'output' set to an empty array
#sort the array input destructively
#for each item in the array
#count the instances of the item
#if the total is equal to 'count',
# and output array does not contain item
#push array element to 'output'
#else if the total is greater than 'count'
#array = [x]
#end
#set count equal to the total instances
#end

# 2. Initial Solution
def mode (array)
	count = 0
	output = []
	array.sort!
	array.each do |x|
		total = array.count(x)
		if (total == count) && (output.include?(x)==false)
			output << x
		elsif total > count
			output = [x]
			count = total
		end
	end
	return output
end

# 3. Refactored Solution
def mode (array)
	count = 0
	output = []
	array.sort!
	array.each do |x|
		total = array.count(x)
		output << x if (total == count) && (output.include?(x)==false)
		if total > count
			output = [x]
			count = total
		end
	end
	return output
end




# 4. Reflection 
#I think there must be a way to do this with array#select, but I just can't figure out how! Will keep working later, if I find time.
#Update: I don't think I'm knowledge enough to use select in this case. It's difficult to figure out the right comparator, because I need to reference the counts of other items in the array, and I'm not sure how to do that within one select method. Can I pass in two variables?