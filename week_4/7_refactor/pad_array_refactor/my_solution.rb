# U2.W4: Review and Refactor: Pad an Array

# I worked on this challenge [by myself, with: ].



# 1. First Person's solution I liked
#    What I learned from this solution
#If the number of times to iterate something is negative, it will not iterate! The return is the negative value, which was the last expression evaluated.
# Copy solution here:
# class Array
# 	def pad(minLength,padValue=nil)
# 		newArray=self.dup
# 		(minLength-newArray.length).times{
# 			newArray.push(padValue)
# 		}
# 		newArray
# 	end

# 	def pad!(minLength,padValue=nil)
# 		(minLength-self.length).times{
# 			self.push(padValue)
# 		}
# 		return self
# 	end
# end





# 2. Second Person's solution I liked
#    What I learned from this solution
#he called the first method in the second. That's not quite recursion, but it feels close. So short, so efficient. 
#One thing I CANNOT figure out that I will ask in comments is, how is dup being called on the original array, within his non-destructive method. It looks very much as if dup is the object! Is that a thing?
#Update: With the help of Martin Lear, we have discovered that if no object is specified when calling a method, self is assumed. Yay!
# Copy solution here:

class Array
  def pad!(number, padding = nil)
  	(number - self.length).times { self << padding }
  	replace(self)
  end

  def pad(number, padding = nil)
    dup.pad!(number, padding)
  end
end


# 3. My original solution:
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


# 4. My refactored solution:
class Array
  def pad!(number, filler = nil)
    (number - self.length).times { self << filler }
    self
  end
  
  def pad(number, filler = nil)
    clone.pad!(number, filler)
  end
end



# 5. Reflection
#Another interesting part of this exercise I've discovered: referencing the other method only work if the non-destructive method references the destructive method. You have to duplicate the array within the non-destructive method anyway, so it makes sense, but my first thought in trying to refactor based on what I've learned was that it would make more sense to create a method that pads an array non-permanently, and then apply that method to self within the destructive array. But since creating the non-destructive array requites a clone in the first place, the destructive array seems to come more simply to the code, and thus is the one we reference.