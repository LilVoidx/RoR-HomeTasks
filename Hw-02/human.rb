require_relative 'raspberry_bush'

class Human
  attr_reader :name

  def initialize(name, plant)
    @name = name
    @plant = plant
  end

  def work!
    @plant.grow_all!
  end

  def harvest
    if @plant.ripe_all?
      harvested_count = @plant.raspberries.length
      puts "Congratulations, #{@name}! You have a bountiful harvest of #{harvested_count} raspberries!"
      @plant.give_away_all!
      harvested_count
    else
      puts "It's too early to harvest, #{@name}. Keep taking care of your plant!"
      0
    end
  end

  def self.knowledge_base
    puts "Welcome to the gardening help center."
    puts "Remember to water your plant regularly and provide plenty of sunlight."
    puts "Raspberries take time to ripen, so be patient!"
  end
end
