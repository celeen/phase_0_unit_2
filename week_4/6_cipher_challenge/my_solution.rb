# U2.W4: Cipher Challenge


# I worked on this challenge with: Martin Lear.



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.


def north_korean_cipher(coded_message) #creating a new method called north_korean_cipher, and passing into it a coded message
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  #this creates a new array called 'input' wherein each member is one letter from the coded message
  decoded_sentence = [] #creates a new empty array, presumably a place to put de-coded letters
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",   # Creates a hash that decodes individual letters of the alphabet
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here?
  #iterates over the letters in the input array
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    #setting 'found_match' as a boolean to false, so if 'x' doesn't match anything in the following each loop, it will get shovelled into the decoded message (see below)
    cipher.each_key do |y| # What is #each_key doing here? 
    #iterating x over keys in cipher hash
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        #Comparing the character x from coded message to the iterated key, y, in cipher. If equal, proceed below
        puts "I am comparing x and y. X is #{x} and Y is #{y}."#Annoyingly prints obscene amounts of test text
        decoded_sentence << cipher[y] #if the character in the coded message is equal to the iterated key, we push the value of the key into the decoded array
        found_match = true #change boolean to true so coded character x is not pushed into decoded array at the end of this loop
        break  # Why is it breaking here?
        #We're breaking here because the coded character was found, and we want to move on to the next value of x without finishing this each loop
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        #checking if coded character is equal to specific characters which are not numbers or letters.
        decoded_sentence << " "#if coded character is not number or letter, an empty space is pushed into decoded sentence
        found_match = true #change boolean to true so coded character x is not pushed into decoded array at the end of this loop
        break #We're breaking here because the coded character was found, and we want to move on to the next value of x without finishing this each loop
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        #checking if the coded character is a number
        decoded_sentence << x #pushes coded character to the decoded array if it is a number
        found_match = true #change boolean to true so coded character x is not pushed into decoded array at the end of this loop
        break #We're breaking here because the coded character was found, and we want to move on to the next value of x without finishing this each loop
      end #end of if statement
    end #end of y-based each loop
    if not found_match  # What is this looking for?
    #This is checking to see if the coded character did not match any cipher key, symbol or number.
      decoded_sentence << x #If there was no match in the y each loop, the character is pushed to the decoded array unchanged
    end #end of if statement
  end #end of x-based each loop
  decoded_sentence = decoded_sentence.join("") #combining elements of decoded sentence array back into a string
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
  #looking for at least two digit characters in a row within the string
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
    #substitutes the digit characters with a new integer- the old characters divided by 100
  end  #end if statement
  return decoded_sentence # What is this returning?      
  #returns the (completed and sensored) decoded message
end # THE END

# Your Refactored Solution




p "Test 1"
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
 if north_korean_cipher("m^aerx%e&gsoi!") != "i want a coke!"
     p "Error: Cipher should equal \'i want a coke!\'"
 end
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
  if north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") != "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
     p "Error: Cipher should equal \'our people eat the most delicious and nutritious foods from our 10000 profitable farms.\'"
 end
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
    if north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") != "our nukes are held together by grape-flavored toffee. don't tell the us!"
     p "Error: Cipher should equal \'our nukes are held together by grape-flavored toffee. don't tell the us!\'"
 end
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
    if north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") != "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
     p "Error: Cipher should equal \'if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman.\'"
 end
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
    if north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") != "next stop: south korea, then japan, then the world!"
     p "Error: Cipher should equal \'next stop: south korea, then japan, then the world!\'"
 end
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"
    if north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") != "can somebody just get me 100 bags of cool ranch doritos?"
     p "Error: Cipher should equal \'can somebody just get me 100 bags of cool ranch doritos?\'"
 end
# Reflection
 