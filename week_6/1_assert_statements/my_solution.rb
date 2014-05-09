# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself].


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
  puts yield
end

name = "bettysue"
assert { name == "bettysue" }
# assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
#calling the #assert method raise an "Assertion failed!" unless the statment in the block is true. Calling yeild within the method passes control to the code block which is passed to the method. If the code block returns true, then the method returns nil. If the code block is false, the method raises an assertion failure.


# 3. Copy your selected challenge here
class CreditCard
	def initialize(card_number)
		@number = card_number.to_s.split("").map!  {|digit| digit.to_i}
		raise ArgumentError.new("Credit Card must have exactly 16 digits") unless @number.length == 16
		
	end

	def check_card
		#step 1 in the algorithm: double every other digit, starting at the right (ie. the even index numbers)
		@number.each_index {|index| @number[index] *= 2 if index.even?}
		#step 2 & 3: Joining the numbers into one string is necessary so that separating by characters doesn't include the array brackets and spaces; then we map through the array created by chars and change each member back into an integer before adding them all together. Chaining them makes it a bit harder to read, but more concise overall. I can't decide which is better.
		@number.join("").chars.map {|digit| digit.to_i}.reduce(:+) % 10 == 0 ? true : false
	end

end



# 4. Convert your driver test code from that challenge into Assert Statements
p "Argument Error is raised if argument is not equal to 16 digits."
begin
	CreditCard.new(4)
rescue
assert {$!.message == "Credit Card must have exactly 16 digits"}
end

p "Returns true for a valid credit card"
valid_card = CreditCard.new(4563960122001999)
assert {valid_card.check_card == true}

p "Returns false for a bad card number"
invalid_card = CreditCard.new(4563961122001999)
assert {invalid_card.check_card == false}




# 5. Reflection
