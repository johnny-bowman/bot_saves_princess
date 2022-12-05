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

def displayPathtoPrincess(n,grid)
    vert_direction = get_vertical_directions(grid)
    horiz_direction = get_horizontal_directions(grid)
    steps_to_edge = (n / 2).ceil
    puts vert_direction * steps_to_edge
    puts horiz_direction * steps_to_edge
end