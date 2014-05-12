# U2.W6: Refactoring for Code Readability


# I worked on this challenge [with: Osama Zayyad].


# Original Solution
# class CreditCard #a new class!
# 	def initialize(card_number) #initialization takes a card number
# 		@card_number = card_number.to_s.split("")
# 		raise ArgumentError.new("Must be exactly 16 digits!") if @card_number.length != 16 
# 	end 
# 	#defines instance method, @card_number, which is very well named, and defines it as the input argument, but changed to a string and split by character.
# 	#I am tihnking that we could also map into integers (seen below, first line of double method) up here.
# 	#this also raises an exception if the argument is not exactly 16 characters long

# 	def double
# 		rcard = @card_number.reverse.map {|i| i.to_i}
# 		doubled = rcard.each_index.map do |i|
# 			if i % 2 == 0
# 				rcard[i] 
# 			else
# 				rcard[i] * 2
# 			end
# 		end
# 		return doubled
# 	end
# 	#defines a new method, double, that, incidentally, is only used internally. This is a great way to split up purposes, make it organized, but it can also be kind of confusing to trace these things, especially if the names aren't self-explanatory
# 	#The poorly named rcard points to the instance variable (and array) @card_number, after it is reversed, and each member mapped into an integer
# 	#the variable doubled points to rcard, whose indeces are mapped through, returning the original member if the index is an even number, and doubling the array member if the index is an odd number
# 	#the method ends by returning doubled

# 	def split_sum
# 		total = 0 
# 		double.map do |i|
# 			if i.to_s.length > 1
# 				double_digit = i.to_s.split("")
# 				total += (double_digit[0].to_i + double_digit[1].to_i)
# 			else
# 				total += i
# 			end
# 		end
# 		return total
# 	end
# #We start by defining a new method, split_sum 
# #We then define variable 'total' as being equal to zero
# #I think s/he intended to map "doubled" rather than 'double'. #map here changes the array member to a string, and if that string's length is greater than 1, we make sure it's a string, split the characters, change each character to an integer, and then add them together. Finally, that sum is added to the total.
# #If the length the strong made from the integer is not greater than 1, the number is added to total
# #we return total

# 	def check_card
# 		if split_sum % 10 == 0 
# 			true
# 		else
# 			false 
# 		end
# 	end
# #a new method, check_card is defined.
# #if the result of the method split_sum is divisible evenly by 10, return true,
# #if not, return false


# end



# Refactored Solution
class CreditCard
	def initialize(card_number) 
		@card_number = card_number.to_s.split("").map {|i| i.to_i}      
		raise ArgumentError.new("Must be exactly 16 digits!") if @card_number.length != 16 
	end 

	def check_card
		doubled = @card_number.each_index.map do |index|
			index % 2 == 0 ? @card_number[index] * 2 : @card_number[index]
		end
		
		total = 0 
		doubled.map do |number|
			seperate_number = number.to_s.split("")
			if seperate_number.length > 1
				total += (seperate_number[0].to_i + seperate_number[1].to_i)
			else
				total += number
			end
		end
		#I kept this section mostly the same, because it's good. The assignment of extra variables seems like maybe it isn't quite necessary to get the idea. I remember using #reduce here, but outside of changing the tactic entirely, I think this shortening is a bit more readable.

		if total % 10 == 0 
			true
		else
			false 
		end
	end
end





# DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "Something's not right." unless yield
	puts yield
end

assert { CreditCard.new(4408041234567893).check_card == true }
assert { CreditCard.new(4408041234567892).check_card == false }





# Reflection 

#I have forgotten to do a lot of these this week. I will have to go back and remedy that.

#this was an interesting challenge because 'readability' is so subjective. It's fun to make code as short as I possibly can, but the shortest code isn't always the easiest to read. I think I might do well with a bit more practice at naming variables well. 