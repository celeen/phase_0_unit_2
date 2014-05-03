# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input? The input will be an integer
# What is the output? (i.e. What should the code return?) 
#the output should be a string
# What are the steps needed to solve the problem?
#define a method 'separate_comma' that take in one argument, an integer
#if the input is a float, please change to whole integer
#if the absolute value of the integer is between 0 and 999, no change
#if the absolute value is between 1000 and 999999,
#change the integer to a string, and insert a comma in the -4th index of the string
#if the absolute value of the integer is bewteen 1000000 and 999999999,
#change integer to string, and insert commas at the -4th and -8th indeces of the string


# 2. Initial Solution
def separate_comma(number)
	number = number.to_i
	if number.abs < 1000
		string = number.to_s
	end
	if number.abs >= 1000
		string = number.to_s.insert(-4, ",")
	end
	if (1000000..999999999).include? number.abs
		string.insert(-8, ",")
	end
	if (1000000000..999999999999).include? number.abs
		string.insert(-12,",")
	end
return string
end



# 3. Refactored Solution
def separate_somma(number)
	number = number.to_i
	number.abs < 1000 ? string = number.to_s : string = number.to_s.insert(-4,",")
	if (1000000..999999999).include? number.abs
		string.insert(-8, ",")
	end
end

# 4. Reflection 

#There has GOT to be a way to count spaces from the end of a string, and then insert a character at a certain point. I'm not sure it's possible without regex, though. Next time, if we're allowed to use regex, I will incorporate those in order to refactor even more efficiently. I want to include any conceivable number that could be input... including very large ones. As far as I can tell, though, without regex's, the program can only go up to a certain point.