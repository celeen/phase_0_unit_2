# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
	source.select {|x| x.to_s.match(thing_to_find)}
end

def my_hash_finding_method(source, thing_to_find)
	(source.select { |k,v| v == thing_to_find }).keys
end

# Identify and describe the ruby method you implemented. 
# I chose select as the primary instrument for both methods. I could also have used a directly related method, like keep_if.
#Although rubydocs doesn't say too much about select, I've found a bunch of blog posts that laud its power. It cycles through each member of the array, keeping only the members for who the block of code returns true. Alternately, keep_if deletes members for whom the code block returns false.
#The blogs essentially say that if you have a block of code in which you're using eachdo, creating a new array, and then pushing things into that array if they meet certain criteria, the select method is a more efficient replacement.
#Initially I chose select for the first array method because it returns an array, and I knew that's what we were going for. It took me a minute to get it right; our array contains integers, and match does not work on integers. Once I added to_s, everything worked fine.
#The only challenge in the hash method was to output an array rather than another hash, which is where #keys comes from. This method takes

# Person 2
def my_array_modification_method(source, thing_to_modify)
  # Your code here!
end

def my_hash_modification_method(source, thing_to_modify)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#


# Person 3
def my_array_sorting_method(source)
  # Your code here!
end

def my_hash_sorting_method(source)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#


# Person 4
def my_array_deletion_method(source, thing_to_delete)
  source.each { |word| source.delete(word) if word.include? thing_to_delete }
end

def my_hash_deletion_method(source, thing_to_delete)
  source.delete(thing_to_delete)
  source
end

# Identify and describe the ruby method you implemented. 
# 
#
#


################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_hash_finding_method(my_family_pets_ages, 3)
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}

# Reflect!
# 
# 
# 
# 
# 