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

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

# displayPathtoPrincess(m,grid)