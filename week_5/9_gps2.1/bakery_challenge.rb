# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Celeen Rusk
# 2) Ken Mendonca

 # This is the file you should end up editing. 
 def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} # creates a hash of serving sizes
  #set quantities of items to zero
  pie_qty = 0 
  cake_qty = 0
  cookie_qty = 0
  #has_fave set to default as false
  fave_match = false
#iterate through each key of hash, and when found, change has_fav to true
  my_list.each_key do |k|
      if k == fav_food
          has_fave = true
          fav_food = k 
      end
  end
#if fav_food isn't in hash, raise error
    if has_fave == false
        raise ArgumentError.new("You can't make that food")
    else
        fav_food_qty = my_list.values_at(fav_food)[0] #if fav_found in hash, give value of key
        if num_of_people % fav_food_qty == 0 # if remainder of num_of_people / fav_food_qty is 0, it returns equal number of food 
            num_of_food = num_of_people / fav_food_qty
            return "You need to make #{num_of_food} #{fav_food}(s)."
    
        else num_of_people % fav_food_qty != 0 #if remainder of number of people is NOT equal to zero
            
            while num_of_people > 0 
                if num_of_people / my_list["pie"] > 0 #if number of people divided by value at key pie in hash is greater than zero
                    pie_qty = num_of_people / my_list["pie"] #set pie quantity to number of people divided by value at key pie hash
                    num_of_people = num_of_people % my_list["pie"] #re-set number of people to remainder of people divuded by value at key pie in hash
                elsif num_of_people / my_list["cake"] > 0 #do the same thing for cake
                    cake_qty = num_of_people / my_list["cake"]
                    num_of_people = num_of_people % my_list["cake"]
                else
                    cookie_qty = num_of_people #losers gets a cookie
                    num_of_people = 0
                end
            end
            return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)." #print quantities needed for fav_foods
        end
    end
end
 
#refactoring 
# def bakery_num(num_of_people, fav_food)
#   my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
#   pie_qty = 0
#   cake_qty = 0
#   cookie_qty = 0
  
#   fave_match = false

#   my_list.each_key do |k|
#     if k == fav_food
#     fave_match = true
#     end
#   end

#     if fave_match == false
#       raise ArgumentError.new("You can't make that food")
    
#     else
#     fav_food_qty = my_list.values_at(fav_food)[0]
    
#     if num_of_people % fav_food_qty == 0
#       num_of_food = num_of_people / fav_food_qty
#       return "You need to make #{num_of_food} #{fav_food}(s)."
    
#     else num_of_people % fav_food_qty != 0
#        my_list.each_key do |key|
#                 num_of_people = []
#                 if num_of_people > my_list[key] > 0
#                     pie_qty = num_of_people / my_list[key] #set pie quantity to number of people divided by value at key pie hash
#                     num_of_people << num_of_people % my_list[key]
#                 end
#       end
#       return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
#     end
# end
# end
 

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
p bakery_num(25, "cake") == "You need to make 0 pie(s), 4 cake(s), and 1 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!
 
 