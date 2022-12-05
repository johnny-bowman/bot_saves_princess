require './lib/game.rb'

class SimpleGame < Game
    attr_accessor :grid, :size

    def initialize(size)
        super(size)
        @grid = place_characters(size)
    end

    def place_characters(size)
        grid = generate_grid(size)
        place_hero_in_center(grid)
        place_princess_in_corner(grid)
        grid
    end
    
    def place_hero_in_center(grid)
        center_index = (grid.length / 2).floor
        grid[center_index][center_index] = 'm'
    end

    def place_princess_in_corner(grid)
        random_corner = ['top_left', 'top_right', 'bottom_left', 'bottom_right'].sample
        
        if random_corner == 'top_left'
           grid[0][0] = 'p' 
        elsif random_corner == 'top_right'
            grid[0][-1] = 'p'
        elsif random_corner == 'bottom_left'
            grid[-1][0] = 'p'
        elsif random_corner == 'bottom_right'
            grid[-1][-1] = 'p'
        end
    end

    def display_path_to_princess
        vert_direction = get_vertical_directions(@grid)
        horiz_direction = get_horizontal_directions(@grid)
        steps_to_edge = (@size / 2).ceil
        puts vert_direction * steps_to_edge
        puts horiz_direction * steps_to_edge
    end

    def get_vertical_directions(grid)
        if grid[0][0] == 'p' || grid[0][-1] == 'p'
            return vert = "UP\n"
        else 
            return vert = "DOWN\n"
        end    
    end

    def get_horizontal_directions(grid)
        if grid[0][0] == 'p' || grid[-1][0] == 'p'
            return horiz = "LEFT\n"
        else 
            return horiz = "RIGHT\n"
        end
    end
end