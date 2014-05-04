class CreditCard

	def initialize(number)

		@number = number.to_s.split(//).map {|chr| chr.to_i}
		if @number.count < 16 || @number.count > 16
			raise ArgumentError.new( false, "Card number can't have less than 16!") 
		end
	end

	def check_card
  		number_array = @number.to_s.split(//).map {|chr| chr.to_i}
  		sum = number_array.each_with_index.map {|num, i| num if i.odd? }
  		sum.compact!
  		sum = sum.inject(:+)
  		number_array = number_array.each_with_index.map { |num, i| num if i.even?} 
  		number_array.compact!
  		number_array.each do |even_num| 
        	double = even_num * 2 
          		if double > 9 
          		double.to_s.split(//).map{|x| sum += x.to_i }
          		end
        	sum += double if double <= 9
      	end
  
		sum % 10 == 0 ? true : false

  	end
end





# 1. DRIVER TESTS GO BELOW THIS LINE
p CreditCard.new(4408041234567893) == true
p CreditCard.new(4408041234567892) == false