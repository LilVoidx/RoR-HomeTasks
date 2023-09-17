require_relative 'raspberry_bush'
require_relative 'human'

def display_raspberry_info(raspberry)
  puts "Raspberry #{raspberry.index}: #{raspberry.state}"
end


harvested_count = 0

if __FILE__ == $PROGRAM_NAME
  Human.knowledge_base

  print "Enter your name: "
  name = gets.chomp

  print "Enter the number of raspberries you want to plant initially: "
  num_raspberries = gets.chomp.to_i

  raspberry_bush = RaspberryBush.new(num_raspberries)
  cottager = Human.new(name, raspberry_bush)

  loop do
    puts "\nOptions:"
    puts "1. Work on the plant"
    puts "2. Display Raspberry Info"
    puts "3. Harvest"
    puts "4. Add More Raspberries"
    puts "5. Show Total Harvested Raspberries"
    puts "6. Quit"
    print "Enter your choice: "

    choice = gets.chomp.to_i

    case choice
    when 1
      cottager.work!
      puts "You've worked on the plant."
    when 2
      raspberry_bush.raspberries.each { |raspberry| display_raspberry_info(raspberry) }
    when 3
      harvested = cottager.harvest
      harvested_count += harvested
      puts "You've harvested #{harvested} raspberries."
    when 4
      print "Enter the number of additional raspberries you want to plant: "
      additional_raspberries = gets.chomp.to_i
      raspberry_bush.add_raspberries(additional_raspberries)
      puts "You've added #{additional_raspberries} raspberries."
    when 5
      puts "Total harvested raspberries: #{harvested_count}"
    when 6
      puts "Thanks for playing!"
      break
    else
      puts "Invalid choice. Try again."
    end
  end
end