# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input:
# Output:
# Steps:


# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
# class CreditCard
# 	def initialize(number)
# 		if number.to_s.length != 16
# 			raise ArgumentError.new("Credit Card must have exactly 16 digits")
# 		end
# 		@number = number.to_s.split("")
# 	end

# 	def check_card
# 		@number.map!  {|n| n.to_i}
		
# 		@number.each_index do |i| 
# 			if i.even? == true
# 				@number [i] *= 2
# 			end
# 		end

# 		@number.map! do |n|
# 			n = n.to_s.split("")
# 				n.reduce(0) {|sum, digit| sum + digit.to_i}
# 		end
		
# 		@number = @number.reduce(0) {|sum, n| sum + n}

# 		if @number % 10 == 0
# 			return true
# 		else
# 			return false
# 		end
# 	end
# end

# 4. Refactored Solution

class CreditCard
	def initialize(number)
		if number.to_s.length != 16
			raise ArgumentError.new("Credit Card must have exactly 16 digits")
		end
		@number = number.to_s.split("")
	end

	def check_card
		@number.map!  {|n| n.to_i}
		
		@number.each_index {|i| @number[i] *= 2 if i.even? == true}

		@number.map! do |n|
			n.to_s.split("").reduce(0) {|sum, digit| sum + digit.to_i}
		end
		
		@number = @number.reduce(0) {|sum, n| sum + n}

		if @number % 10 == 0
			return true
		else
			return false
		end

	end

end




# 1. DRIVER TESTS GO BELOW THIS LINE

# p "Initialize expects a single argument"

p "Argument Error is raised if argument is not equal to 16 digits."
	begin 
		CreditCard.new(4)
	rescue ArgumentError => e
		a = e.message
	end
	p a == "Credit Card must have exactly 16 digits"
	
# p "#check_card expects no argument"

p "Returns true for a valid Credit Card"
	card = CreditCard.new(6011110035054288)
	p card.check_card == true


p "Returns false for a bad card number"
	card = CreditCard.new(4563961122001999)
	p card.check_card == false



# 5. Reflection 
#This one was a challenge for me. I will have to reapproach this tomorrow to make sure I got the easiest approach. It feels like I might have overcomplicated it. Seperating nuber into individual digits, translating that for ruby was challenging and fun. I tried to use #join at one point, and it didn't work, because of the conversion from string to integer, and the timing. I like reduce much more. I've been looking at that method for a while not really understanding it, and this exercise helped me to cement that understanding.
