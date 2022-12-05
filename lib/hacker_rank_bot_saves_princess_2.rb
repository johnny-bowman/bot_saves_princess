def get_princess_row(grid)
    princess_row = grid.find_index { |row| row.include?("p") }
end

def get_princess_column(princess_row, grid)
    princess_column = grid[princess_row].index("p")
end

# n = gets.to_i

# r,c = gets.strip.split.map {|num| num.to_i}

# grid = Array.new(n)

# (0...n).each do |i|
#     grid[i] = gets
# end

# nextMove(n,r,c,grid)