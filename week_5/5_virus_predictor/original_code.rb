# U2.W5: Virus Predictor

# I worked on this challenge [by myself, with: ].

# EXPLANATION OF require_relative
#this requires a seperate file, allowing this file to reach over to another in this directory and access labeled information, variables, etc, which are referred to later in the driver code.

# require_relative 'state_data'
# #
# class VirusPredictor
#   #the initialize method takes a handful of instance variables, shown below. In the driver code, you can see the creation of new VirusPredictor objects pointing these instance variables to names of the data file.
#   def initialize(state_of_origin, population_density, population, region, regional_spread)
#     @state = state_of_origin
#     @population = population
#     @population_density = population_density
#     @region = region
#     @next_region = regional_spread
#   end


#   #the method virus_effects here calls on the two private methods below, and passes as arguments the instance variables defined when the VirusPredictor object is created/initialized
#   def virus_effects  #HINT: What is the SCOPE of instance variables?
#     #instance variables are available across methods and change from object to object. I can run methods with these instance varibales on many different VirusPredictor objects.
#     predicted_deaths(@population_density, @population, @state)
#     speed_of_spread(@population_density, @state)
#   end


#   private  #what is this?  what happens if it were cut and pasted above the virus_effects method

#   #private methods cannot be accessed outside of the class, and can only be accessed by things within the class. The tutorial I read has it modeled slightly differently: it has the 'private' label *after* the method, with specifications on the same line as to which methods it is making provate. I quite like this was better, for now. It seems easier to read. The only catch, I suppose is that you have to make sure to put them last in the class creation. I wonder if you can put things after private methods in the other syntax? According to that tutorial (http://www.tutorialspoint.com/ruby/ruby_object_oriented.htm) I believe you can.

#   #this method tkes the passed in instance variables from the method virus_effects (which gets them from initialization) and uses them to determine the number of deaths based on a pre-decided mortality rate based on population density. It looks as if the denser the population, the higher the ratio of people that will die.
#      #the method then prints a statement containing its return information
#   def predicted_deaths(population_density, population, state)
#     case @population_density
#     when  (150...200)
#       number_of_deaths = (@population * 0.3).floor
#     when (100...150)
#       number_of_deaths = (@population * 0.2).floor
#     when (50...100)
#       number_of_deaths = (@population * 0.1).floor
#     when (0...50)
#       number_of_deaths = (@population * 0.05).floor
#     else
#       number_of_deaths = (@population * 0.4).floor
#     end
#     # if @population_density >= 200
#     #   number_of_deaths = (@population * 0.4).floor
#     # elsif @population_density >= 150
#     #   number_of_deaths = (@population * 0.3).floor
#     # elsif @population_density >= 100
#     #   number_of_deaths = (@population * 0.2).floor
#     # elsif @population_density >= 50
#     #   number_of_deaths = (@population * 0.1).floor
#     # else 
#     #   number_of_deaths = (@population * 0.05).floor
#     # end
  

#     print "#{@state} will lose #{number_of_deaths} people in this outbreak"
 

#   end
#  #this method determines the speed of the spread of the disease. In this case, it looks as if the higher the population density, the faster the disease will spread. This is hard to intuit from the code; even with the 'in months' note, my initial desire was to use the 'speed' numbers as ratios. But here they are just estimating the time in months.
#   #and ends with a statement printing the output
#   def speed_of_spread(population_density, state) #in months
#     # speed = 0.0
#     case @population_density
#     when (0...50)
#       speed +=
#     if @population_density >= 200
#       speed += 0.5
#     elsif @population_density >= 150
#       speed += 1
#     elsif @population_density >= 100
#       speed += 1.5
#     elsif @population_density >= 50
#       speed += 2
#     else 
#       speed += 2.5
#     end
   
#     puts " and will spread across the state in #{speed} months.\n\n"
   
#   end
# #There are a bunch of instance variables that this code takes from the data sheet that it doesn't use at all. Is there a plan to incorporate that data in the future, or can it be ditched?
# #additionally, there is a lot of repeated code written by making two seperate, private methods, and a third public one that calls upon the private ones. It may turn out that it is easier to read in the long run, but I think it might be best to define one, or maybe two methods with a return that prints the valuable information. We definitely don't need three.
# #It's conceivable that the CDC want to keep the data private? But the way this code is structured, making these methods private doesn't necessarily solve that problem.
# end

#======================================================================= 
# REFACTORING
require_relative 'state_data'
#
class VirusPredictor
  def initialize(state)
    @state = state
    @population = STATE_DATA[state][:population]
    @population_density = STATE_DATA[state][:population_density]
  end

  def virus_effects  
    #number of deaths
    case @population_density
    when  (150...200)
      number_of_deaths = (@population * 0.3).floor
    when (100...150)
      number_of_deaths = (@population * 0.2).floor
    when (50...100)
      number_of_deaths = (@population * 0.1).floor
    when (0...50)
      number_of_deaths = (@population * 0.05).floor
    else
      number_of_deaths = (@population * 0.4).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
    # speed of spread

    case @population_density
    when (0...50)
      speed = 2.5
    when (50...100)
      speed = 2
    when (100...150)
      speed = 1.5
    when (150...200)
      speed = 1
    else
      speed = 0.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
   
  end
end
#============================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
# alaska.virus_effects

#See new feature, report on all 50 states below:
STATE_DATA.each_key do |state|
  state = VirusPredictor.new(state) 
state.virus_effects
end

alaska = VirusPredictor.new("Alaska")
alaska.virus_effects

