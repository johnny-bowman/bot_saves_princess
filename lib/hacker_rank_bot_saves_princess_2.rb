require 'pry'

def get_princess_row(grid)
    princess_row = grid.find_index { |row| row.include?("p") }
end

def get_princess_column(princess_row, grid)
    princess_column = grid[princess_row].index("p")
end

def print_horizontal_move(player_column, princess_column)
    # binding.pry
    if player_column > princess_column
        puts "LEFT"
    else
        puts "RIGHT"
    end
end

def print_vertical_move(player_row, princess_row)
    if player_row > princess_row
        puts "UP"
    else
        puts "DOWN"
    end
end

# n = gets.to_i

# r,c = gets.strip.split.map {|num| num.to_i}

# grid = Array.new(n)

# (0...n).each do |i|
#     grid[i] = gets
# end

# nextMove(n,r,c,grid)