# Bot Saves Princess Code Challenge
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ul>
    <li> <a href="#project-details">Project Details</a> </li> 
    <li> <a href="#hacker-rank-solutions">Hacker Rank Solutions (copy-and-paste-able)</a> </li>
    <li> <a href="#bot-saves-princess-challenge-info">Bot Saves Princess Challenge Info & Solution</a> </li>
    <li> <a href="#bot-saves-princess-2-challenge-info">Bot Saves Princess 2 Challenge Info & Solution</a> </li>
    <li> <a href="#my-playable-version">My Playable Version</a> </li>
  </ul>  
</details>

## Project Details
---
This project includes solutions written in Ruby for two code challenges from Hacker Rank: [Bot Saves Princess 1](https://www.hackerrank.com/challenges/saveprincess) and [Bot Saves Princess 2](https://www.hackerrank.com/challenges/saveprincess2). 
<br/>
In addition, I've built a playable game based on the challenges from Hacker Rank which you can run in your terminal. 

#### For code solutions you can copy and paste into the Hacker Rank challenge page, Navigate to the <a href="#hacker-rank-solutions">Hacker Rank Solutions Section</a>

### Tools Used 

BUILT WITH 
  * [Ruby v2.7.4](https://www.ruby-lang.org/en/)

TESTED WITH
* [RSpec v3.12](https://rspec.info/)
* [Pry](https://pry.github.io/)
* [Simplecov](https://github.com/simplecov-ruby/simplecov)

## Hacker Rank Solutions (copy-and-paste-able for Hacker Rank)
---
### Instructions for executing the following code blocks in Hacker Ranks: 
  <br/>
  - Navigate to the Hacker Ranks code editor in the challenge page, and select 'Ruby' from the language selector at the top of the editor
  <br/>
  - Delete <em>all</em> of the existing ruby code in the editor</li>
  <br/>
  - Copy and paste the <em>entireity</em> of the following code blocks into the challenge editor</li>

## **[Bot Saves Princess - Display Path to Princess](https://www.hackerrank.com/challenges/saveprincess)**
```ruby
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

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
```

## **[Bot Saves Princess 2 - Next Move](https://www.hackerrank.com/challenges/saveprincess2)**
```ruby
def nextMove(n,r,c,grid)
    princess_coordinates = get_princess_coordinates(grid)
    if c != princess_coordinates[0]
        print_horizontal_move(c, princess_coordinates[0])
    elsif r != princess_coordinates[1]
        print_vertical_move(r, princess_coordinates[1])
    end
end

def get_princess_coordinates(grid)
    princess_row = get_princess_row(grid)
    princess_column = get_princess_column(princess_row, grid)
    return princess_column, princess_row
end

def get_princess_row(grid)
    princess_row = grid.find_index { |row| row.include?("p") }
end

def get_princess_column(princess_row, grid)
    princess_column = grid[princess_row].index("p")
end

def print_horizontal_move(player_column, princess_column)
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

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
```

### [Bot Saves Princess](https://www.hackerrank.com/challenges/saveprincess) Challenge Info:
---
Challenge Link: [Bot Saves Princess 1](https://www.hackerrank.com/challenges/saveprincess)

Princess Peach is trapped in one of the four corners of a square grid. You are in the center of the grid and can move one step at a time in any of the four directions. Can you rescue the princess?

- Input format:

The first line contains an odd integer `N (3 <= N < 100)` denoting the size of the grid. This is followed by an NxN grid. Each cell is denoted by `'-'`. The bot position is denoted by `'m'` and the princess position is denoted by `'p'`.

- Sample Input: 

```
3
---
-m-
p--
```

- Output format:

Print out the moves you will take to rescue the princess in one go. The moves must be separated by `'\n'`, a newline. The valid moves are `LEFT` or `RIGHT` or `UP` or `DOWN`.

- Sample Output: 

```
DOWN
LEFT
```

- Task:

Complete the function `displayPathtoPrincess` which takes in two parameters - the integer `N` and the character array grid. The grid will be formatted exactly as you see it in the input, so for the sample input the princess is at `grid[2][0]`. The function shall output moves `(LEFT, RIGHT, UP or DOWN)` on consecutive lines to rescue/reach the princess. The goal is to reach the princess in as few moves as possible.

- My Solution: 

To get the `vertical direction` the bot must move to reach the princess, I simply check the upper two corner indeces of the grid. if the princess is in either one of those corners, the vertical direction is `"UP"`. If not, the vertical direction is `"DOWN"`: 

```ruby
def get_vertical_directions(grid)
    if grid[0][0] == 'p' || grid[0][-1] == 'p'
        return vert = "UP\n"
    else 
        return vert = "DOWN\n"
    end    
end
```

I take the same approach to find the `horizontal direction` the bot must move to reach the princess: If the princess occupies either of the left-side corners of the grid, the horizontal direction is `"LEFT"`. If not, the horizontal direction is `"RIGHT"`:

```ruby
def get_horizontal_directions(grid)
    if grid[0][0] == 'p' || grid[-1][0] == 'p'
        return horiz = "LEFT\n"
    else 
        return horiz = "RIGHT\n"
    end
end
```

I then calculate the number of steps it will take to move the bot from the center of the grid to the edge in any direction, which is easily found by taking the size of the grid `"n"`, dividing it by two, and rounding up to the nearest whole number: `steps_to_edge = (n / 2).ceil`

We then simply print the vertical direction `steps_to_edge` times, and then the horizontal direction `steps_to_edge` times:

```ruby
def displayPathtoPrincess(n,grid)
    vert_direction = get_vertical_directions(grid)
    horiz_direction = get_horizontal_directions(grid)
    steps_to_edge = (n / 2).ceil
    puts vert_direction * steps_to_edge
    puts horiz_direction * steps_to_edge
end
```

### [Bot Saves Princess 2](https://www.hackerrank.com/challenges/saveprincess2) Challenge Info:
---

Challenge Link: [Bot Saves Princess 2](https://www.hackerrank.com/challenges/saveprincess2)

In this version of "Bot saves princess", Princess Peach and bot's position are randomly set. Can you save the princess?

- Input format:

The first line of the input is `N (<100)`, the size of the board `(NxN)`. The second line of the input contains two space separated integers, which is the position of the bot.

The position of the princess is indicated by the character `'p'` and the position of the bot is indicated by the character `'m'` and each cell is denoted by `'-'`.

- Sample Input: 

```
5
2 3
-----
-----
p--m-
-----
-----
```

- Output format:

Output only the next move you take to rescue the princess. Valid moves are `LEFT`, `RIGHT`, `UP` or `DOWN`
- Sample Output: 

```
LEFT
```

- Resultant State:

```
-----
-----
p-m--
-----
-----
```

- My Solution: 

Given the princess is placed randomly on the grid, our first task is to find her coordinates. Given the grid is simply an array of strings representing the grid rows, I simply iterate through the grid to find the first row index in which `"p"` is included in the string. I then iterate through that string to find the column index in which `"p"` is located:

```ruby
def get_princess_coordinates(grid)
    princess_row = get_princess_row(grid)
    princess_column = get_princess_column(princess_row, grid)
    return princess_column, princess_row
end

def get_princess_row(grid)
    princess_row = grid.find_index { |row| row.include?("p") }
end

def get_princess_column(princess_row, grid)
    princess_column = grid[princess_row].index("p")
end
```

Next, given we know the bot coordinates through `r` and `c`, we simply compare the bot and princess coordinates to get our vertical and horizontal directions:

```ruby
def print_horizontal_move(player_column, princess_column)
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
```

Finally, we tie it all together by printing our `nextMove` with the following method: 

```ruby
def nextMove(n,r,c,grid)
    princess_coordinates = get_princess_coordinates(grid)
    if c != princess_coordinates[0]
        print_horizontal_move(c, princess_coordinates[0])
    elsif r != princess_coordinates[1]
        print_vertical_move(r, princess_coordinates[1])
    end
end
```

## My Playable Version

#### Download this Repo

To install locally, in the command line run: 

`git clone git@github.com:johnny-bowman/bot_saves_princess.git`

`cd bot_saves_princess` 

`bundle install`

To run the test suite, in the command line run:

`bundle exec rspec`

To open the Simplecov report, in the command line run: 

`open coverage/index.html`

#### Ruby Runner 

To run the playable version I built after installing locally, in the command line run: 

`ruby lib/playable_game_runner.rb`

### Design of Playable Version

The design consists of three classes, with a test suite for each: the `Game` class, and its two children `SimpleGame` and `RandomizedGame`. `SimpleGame` models the behavior of Bot Saves Princess 1, and `RandomizedGame` models the behavior of Bot Saves Princess 2. Their parent `Game` contains methods and state shared by both children. 

- `Game` Class Design:

In both versions of the game, we need to take in a `size` parameter, create a grid array based on that size, and print the grid layout to the terminal: 

```ruby
class Game
    attr_reader :size, :grid

    def initialize(size)
        @size = size
        @grid = generate_grid(size)
    end

    def generate_grid(size)
        grid = []
        size.times do grid << '-' * size end
        grid
    end

    def print_grid
        @grid.each { |row| puts row }
    end
end
```

- `SimpleGame` Class Design:

This class is able to place the hero in the center of the grid, and place the princess in one of the four corners at random with the following methods: 

```ruby 
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
end
```

It then gets directions to the princess in a similar fashion to my original Hacker Ranks solution with the following instance methods:

```ruby
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
```

- `RandomizedGame` Class Design:

This class is similar to `SimpleGame`, except that both the princess and the hero are placed randomly on any given positions within the grid:

```ruby
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
end
```

It then uses the following instance methods to find directions to the princess: 

```ruby
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
```

- `playable_game_runner.rb` Design:

The runner simply prints instructions to the player, and receives input from the player to create the size of the grid. The grid must be and odd number no smaller than 3 and no larger than 99, and error handling is achieved with the following method:

```ruby
def get_odd_input(input)
    if input.odd? && input > 1 && input < 100
        return input
    else
        puts "The number must be odd, no smaller than 3, and no larger than 99. Please try again: "
        get_odd_input(gets.chomp.to_i)
    end
end
```
