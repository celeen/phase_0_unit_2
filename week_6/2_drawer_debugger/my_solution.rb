# U2.W6: Drawer Debugger


# I worked on this challenge [by myself].


# 2. Original Code

class Drawer

attr_reader :contents

# Are there any more methods needed in this class?

def initialize
	@contents = []
	@open = true
end

def open
	@open = true
end

def close
	@open = false
end 

def add_item (item)
	@contents << item
end

def remove_item(item = @contents.pop) #what is `#pop` doing?
	##pop takes the last member of the array @contents, and removes it
	@contents.delete(item)
end

def dump  # what should this method return? AN EMPTY ARRAY!
	@contents = []
	puts "Your drawer is empty."
end

def view_contents
	if @contents.length > 0
	puts "The drawer contains:"
	@contents.each {|silverware| puts "- " + silverware.type }
	else puts "Your drawer is empty."
	end
end

end


class Silverware
attr_reader :type

# Are there any more methods needed in this class?

def initialize(type, clean = true)
	@type = type
	@clean = clean
end

def eat
	puts "eating with the #{type}"
	@clean = false
end

def clean_silverware?
	@clean == true
end

def clean
	@clean = true
end

end

# knife1 = Silverware.new("knife")

# silverware_drawer = Drawer.new
# silverware_drawer.add_item(knife1) 
# silverware_drawer.add_item(Silverware.new("spoon"))
# silverware_drawer.add_item(Silverware.new("fork")) 
# silverware_drawer.view_contents

# silverware_drawer.remove_item
# silverware_drawer.view_contents
# sharp_knife = Silverware.new("sharp_knife")


# silverware_drawer.add_item(sharp_knife)

# silverware_drawer.view_contents

# removed_knife = silverware_drawer.remove_item(sharp_knife)
# removed_knife.eat
# removed_knife.clean_silverware?


# silverware_drawer.view_contents
# silverware_drawer.dump
# silverware_drawer.view_contents #What should this return?
# fork = Silverware.new("fork")
# silverware_drawer.add_item(fork) 
# silverware_drawer.view_contents

# fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
# silverware_drawer.view_contents

# fork.eat

#BONUS SECTION
# puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "assertion failed" unless yield
	puts true
end

new_drawer = Drawer.new
spork = Silverware.new("spork", false)
new_drawer.add_item(spork)


assert { new_drawer.contents == [spork] }
assert { spork.clean_silverware? == false }

silver_spoon = Silverware.new("spoon")
new_drawer.add_item(silver_spoon)

assert { new_drawer.contents == [spork, silver_spoon] }
assert { new_drawer.view_contents == [spork, silver_spoon] }
assert { silver_spoon.clean_silverware? == true }
assert { silver_spoon.type == "spoon"}

new_drawer.remove_item(silver_spoon)

assert { new_drawer.contents == [spork] }

spork.eat

assert { spork.clean_silverware? == false}

spork.clean

assert { spork.clean_silverware? == true }

new_drawer.dump

assert { new_drawer.contents == [] }
assert { new_drawer == [] }





# 5. Reflection 
#I noticed there there is space to mess with whether the drawer is open or closed, but it seems like the functionality I'd gain in the program from implimenting requirement to open the drawer wouldn't really be worth the work required to make it happen.

#If I knew how to make it so that these methods coul be chained, it might be easier. Perhaps I'm thinking too practically/literally, but it does seem to me as if the open/close process could be assumed in this context. These are *virtual* drawers. Do we really need to open them?