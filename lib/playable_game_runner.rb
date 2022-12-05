require './lib/game.rb'
require './lib/simple_game.rb'
require './lib/randomized_game.rb'

puts "Hello, brave hero!! Well...I guess, technically, you're less of a hero and more of a hero's observer in this case, but....Hello!"
sleep(0.5)
puts "Erm, anyways, today you'll be TRAPPING THE PRINCESS in a random corner within a square grid, the size of which is determined by YOU!! Come to think of it you really are more of a villain in this scenario than a hero...Anyways!! "
sleep(0.5)
puts "Please enter an odd number, no smaller than 3 and no larger than 99 to choose the size of your grid:"

def get_odd_input(input)
    if input.odd? && input > 1 && input < 100
        return input
    else
        puts "The number must be odd, no smaller than 3, and no larger than 99. Please try again: "
        get_odd_input(gets.chomp.to_i)
    end
end

grid_size = get_odd_input(gets.chomp.to_i)

simple_game = SimpleGame.new(grid_size)

puts "\n"
simple_game.print_grid
puts "\n"
sleep(0.5)

puts "Thank you! As you can see above, we've placed our hero (m) in the center of your grid and randomly chosen a corner to hide our princess! Below are the fewest possible steps our brave and noble hero will take to rescue the princess:"
sleep(0.5)

puts "\n"
puts simple_game.display_path_to_princess
puts "\n"

puts "Thank you for your assistance! Now let's make this a bit more interesting:"
sleep(1)
puts "This time, we'll be placing our princess and our hero in RANDOM positions on your grid! There's no telling if our hero has the guile for a mission like this..."
puts "\n"
sleep(1)
puts "Again, please enter an odd number, no smaller than 3 and no larger than 99 to choose the size of your grid:"

grid_2_size = get_odd_input(gets.chomp.to_i)

randomized_game = RandomizedGame.new(grid_2_size)

puts "\n"
randomized_game.print_grid
puts "\n"
sleep(0.5)

puts "Thank you! We've placed our princess and hero in random positions on your grid. Now let's see what moves the hero will take to rescue the princess:"

puts "\n"
puts randomized_game.display_path_to_princess
puts "\n"

puts "SUCH GUILE!! Thank you for bearing witness to our hero's journey."