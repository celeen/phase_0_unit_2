# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
#an array, the arguments: minimum length, filler
# What is the output? (i.e. What should the code return?)
#the array with the minimum length and filler
# What are the steps needed to solve the problem?

#define a method, pad, that checks for the length of the array.
#takes two arguments: minimum length, and filler, by default set to nil
#see if it meets the minimum length,
#   if it meets the minimum length, 
#   return array
#   Else if it's less than minimum length,
#       take minimum length minus the length of the array = filler spaces
#       create an array from 'filler' of the 'filler spaces' length
#       concatenate the original array with filler array
#   return array
#

# 2. Initial Solution
# class Array
#   def pad!(number, filler = nil)
#     if self.length >= number
#       self
#     else
#       filler_spaces = number - self.length
#       filler_spaces.times { self << filler }
#     end
#     return self
#   end
  
#   def pad(number, filler = nil)
#     array = self.clone
#     if array.length >= number
#         array
#     else
#         filler_spaces = number - array.length
#         filler_spaces.times { array << filler }
#     end
#   return array
#   end
# end


# 3. Refactored Solution
class Array
  def pad!(number, filler = nil)
    self.length >= number ? self : (number - self.length).times { self << filler }
	self  
  end
  
  def pad(number, filler = nil)
    array = self.clone
    array.length >= number ? array : (number - array.length).times { array << filler }
	array
  end
end


# 4. Reflection 
# One very interesting thing to me about our refactored solution is that, I at first assumed that our code would implicitly return the array in either instance. However, it seems that in the case that the first statement is false, the last thing ruby evaluates in the false segment (to the right of the colon) is actually the number of times to iterate, rather than the final array. Therefore, to my surprise, it's necessary to call the array to finish.
#I did lear about the ternary conditional syntax with this exercise: Lienha taught me that, as well as the idea that you must call a class before defining the method in orer to be able to apply the method with the dot after the object.