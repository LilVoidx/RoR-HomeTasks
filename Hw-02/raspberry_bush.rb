require_relative 'raspberry'

class RaspberryBush
  attr_reader :raspberries

  def initialize(num_raspberries)
    @raspberries = Array.new(num_raspberries) { |i| Raspberry.new(i + 1) }
  end

  def grow_all!
    @raspberries.each(&:grow!)
  end

  def ripe_all?
    @raspberries.all?(&:ripe?)
  end

  def give_away_all!
    @raspberries.clear
  end

  def add_raspberries(num_raspberries)
    new_raspberries = Array.new(num_raspberries) { |i| Raspberry.new(@raspberries.length + i + 1) }
    @raspberries.concat(new_raspberries)
  end
end
