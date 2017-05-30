# Virus Predictor

# I worked on this challenge by myself (Guide: Celeen Rusk).
# We spent [1.5] hours on this challenge.

# EXPLANATION OF require_relative
# loads a file that is located relative to the current file
# whereas 'require' loads a file with an absolute path
require_relative 'state_data'

class VirusPredictor
  # runs when a new instance is created
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # runs both the predicted_deaths and speed_of_spread methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # calculate number of deaths depending on the population density and round down to nearest integer
  def predicted_deaths
    # predicted deaths is solely based on population density
    # if @population_density >= 200
    #   number_of_deaths = (@population * 0.4).floor
    # elsif @population_density >= 150
    #   number_of_deaths = (@population * 0.3).floor
    # elsif @population_density >= 100
    #   number_of_deaths = (@population * 0.2).floor
    # elsif @population_density >= 50
    #   number_of_deaths = (@population * 0.1).floor
    # else
    #   number_of_deaths = (@population * 0.05).floor
    # end

    virus_kill_rate = case @population_density
    when 0...50
      0.05
    when 50...100
      0.1
    when 100...150
      0.2
    when 150...200
      0.3
    else
      0.4
    end

    number_of_deaths = @population * virus_kill_rate

    print "#{@state} will lose #{number_of_deaths.floor} people in this outbreak"

  end

  # returns speed based on population density
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    # if @population_density >= 200
    #   speed += 0.5
    # elsif @population_density >= 150
    #   speed += 1
    # elsif @population_density >= 100
    #   speed += 1.5
    # elsif @population_density >= 50
    #   speed += 2
    # else
    #   speed += 2.5
    # end

    speed += case @population_density
    when 0...50
      2.5
    when 50...100
      2
    when 100...150
      1.5
    when 150...200
      1
    else
      0.5
    end
     
    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

STATE_DATA.each do |state, population|
  VirusPredictor.new(state, population[:population_density], population[:population]).virus_effects
end


#=======================================================================
# Reflection Section