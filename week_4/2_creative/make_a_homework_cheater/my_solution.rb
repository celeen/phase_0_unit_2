# U2.W4: Homework Cheater!


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: person/thing, title, time period, pronoun, thesis
# Output: essay, with correct grammar
# Steps:  
#if subject ends in s, to_have equals have
#if subject does not end in s, to_have equals has
#if gender equals male, pronoun equals he, posessive pronoun equals his, object pronoun equals him
#if gender equals female, pronoun equals she, posessive pronoun equals her, object pronoun equals her
#if gender equals it, and if subject ends in s, pronoun equals them, posessive pronoun equals their, object pronoun equals pronoun.
#if gender equal it else, pronoun equals gender, posessive pronoun equals its, object pronoun equals gender. 

#if subject ends in s, posession is ', if variable ends in not s, posession is 's.
#output string with appropriate variables and changed variables interpolated     


# 3. Initial Solution

def homework_cheater(subject,title,time_period,gender,thesis)
	title = title.split(" ")
	title.collect! {|x| x.capitalize}
	title = title.join(" ")
	
	if subject.end_with?("s") == true
		to_have = "have"
		to_be = "were"
		posession = "'"
	else 
		to_have = "has"
		to_be = "was"
		posession = "'s"
	end

	if gender == "male"
		pronoun = "he"
		posessive_pronoun = "his"
		object_pronoun = "him"
	elsif gender == "female"
		pronoun = "she"
		posessive_pronoun = object_pronoun = "her"
	elsif gender == "it"
		if subject.end_with?("s") == true
			pronoun = "they"
			object_pronoun = "them"
			posessive_pronoun = "their"
		else pronoun = object_pronoun = "it"
			posessive_pronoun = "its"
		end
	end

	template =  "#{title}
Since #{time_period}, #{subject} #{to_have} been very influential in #{posessive_pronoun} field. In #{posessive_pronoun} historical era, #{pronoun} #{to_be} very influential. One could study #{object_pronoun} for a very long time. I have just grazed the tip of the iceberg so far!
#{thesis}
With such an important and far reaching influence on the world, there's no argument that #{subject}#{posession} contribution was important. We should all continue to learn more about #{subject}, and more from #{object_pronoun}."

end



# 4. Refactored Solution








# 1. DRIVER TESTS GO BELOW THIS LINE

# template = "#{title}"
# "Since #{year}, #{subject} #{to_have} been very influential in #{posessive_pronoun} field. In #{posessive_pronoun} historical era, #{pronoun} was very influential. One could study #{subject} for a very long time. I have just grazed the tip of the iceberg so far!"
# "#{thesis}"
# "With such an important and far reaching influence on the world, there's no argument that #{subject}#{posession} contribution was important. We should all continue to learn more about #{subject}, and more from #{object_pronoun}."
#Person/thing, title, year, pronoun, thesis statement

#1. Seatbelts/Safety First/the early 19th century/them/Seatbelts have saved countless lives, and improved the safety of automobiles by at least 40%
#2. Vanessa Williams/Story of a Hero/1996/her/Vanessa William is most noted for being amazing at tennis.
#3. Benjamin Franklin/America's Own Innovator/the mid 18th century/he/Benjamin Franklin loved turkeys. He also allegedly invented electriciy, and helped form our great nation.

# seatbelts = 
# "Safety First
# Since the early 19th century, seatbelts have been very influential in their field. In their historical era, they were very influential. One could study them for a very long time. I have just grazed the tip of the iceberg so far!

# Seatbelts have saved countless lives, and improved the safety of automobiles by at least 40%.

# With such an important and far reaching influence on the world, there's no argument that seatbelts' contribution was important. We should all continue to learn more about seatbelts, and more from them."
# puts seatbelts
# p homework_cheater("seatbelts", "safety first", "the early 19th century", "it", "Seatbelts have saved countless lives, and improved the safety of automobiles by at least 40%.") == seatbelts

# vanessa_williams = "Story of a Hero
# Since 1996, Vanessa Williams has been very influential in her field. In her historical era, she was very influential. One could study her for a very long time. I have just grazed the tip of the iceberg so far!
# Vanessa Williams is a very great singer.
# With such an important and far reaching influence on the world, there's no argument that Vanessa Williams' contribution was important. We should all continue to learn more about Vanessa Williams, and more from her."
# p homework_cheater("vanessa williams", "story of a hero", "1996", "female", "Vanessa Williams is a very great singer.") == vanessa_williams
ben_franklin = 
"America's Own Innovator

Since the mid 18th century, Benjamin Franklin has been very influential in his field. In his historical era, he was very influential. One could study him for a very long time. I have just grazed the tip of the iceberg so far! 

Benjamin Franklin loved turkeys. He also allegedly invented electriciy, and helped form our great nation.

With such an important and far reaching influence on the world, there's no argument that Benjamin Franklin's contribution was important. We should all continue to learn more about Benjamin Franklin, and more from him."
print ben_franklin

puts homework_cheater("Benjamin Franklin", "america's own innovator", "the mid 18th century", "male", "Benjamin Franklin loved turkeys. He also allegedly invented electriciy, and helped form our great nation.") == ben_franklin

print homework_cheater("Benjamin Franklin", "america's own innovator", "the mid 18th century", "male", "Benjamin Franklin loved turkeys. He also allegedly invented electriciy, and helped form our great nation.")
# 5. Reflection 
#I cannot for the life of me figure out why this code is not passing. I have corrected tiny typo after tiny typo, and the output looks exactly the same. There must be a syntactical detail that I am missing... I will continue to explore that.
#I have tried adding '+"n"+' between each paragraph. I've tried using print, and I've tried using puts, and I've tried using p. I've played around with returning various things. I have a unch that the difference (at least in the third test) is somewhere in what I'm calling on each side of my boolean, but I'm not sure why it would be different.


