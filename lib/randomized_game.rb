require './lib/game.rb'

class RandomizedGame < Game
    attr_accessor :grid, :size, :princess_coordinates, :hero_coordinates
    
    def initialize(size)
        super(size)
        @grid = place_characters(size)
    end

    def place_characters(size)
        grid = generate_grid(size)
        place_princess(grid)
        place_hero(grid)
        grid
    end

    def place_princess(grid)
        @princess_coordinates = [rand(0...grid.length), rand(0...grid.length)]
        grid[@princess_coordinates[0]][@princess_coordinates[1]] = 'p'
    end
    
    def place_hero(grid)
        @hero_coordinates = [rand(0...grid.length), rand(0...grid.length)]
        if @hero_coordinates == @princess_coordinates
            place_hero(grid)
        else
            grid[@hero_coordinates[0]][@hero_coordinates[1]] = 'm'
        end
    end

    def display_path_to_princess
        steps = steps_to_princess(@princess_coordinates, @hero_coordinates)

        print_vertical_steps(steps[:vert_steps])
        print_horizontal_steps(steps[:horiz_steps])
    end

    def steps_to_princess(princess_coordinates, hero_coordinates)
        vertical_steps = hero_coordinates[0] - princess_coordinates[0]
        horizontal_steps = hero_coordinates[1] - princess_coordinates[1]

        return {vert_steps: vertical_steps, horiz_steps: horizontal_steps}
    end

    def print_vertical_steps(steps)
        if steps.positive? 
            puts "UP\n" * steps
        elsif steps.negative?
            puts "DOWN\n" * steps.abs
        end
    end

    def print_horizontal_steps(steps)
        if steps.positive? 
            puts "LEFT\n" * steps
        elsif steps.negative?
            puts "RIGHT\n" * steps.abs
        end
    end
end