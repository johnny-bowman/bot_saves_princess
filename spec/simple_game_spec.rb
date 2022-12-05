require 'spec_helper'
require './lib/game'
require './lib/simple_game'

RSpec.describe SimpleGame do
    before :each do
        @simple_game = SimpleGame.new(5)
    end

    it 'exists and is a child of Game class' do
        expect(SimpleGame).to be < Game
        expect(@simple_game).to be_an_instance_of(SimpleGame)
    end

    it 'has readable size attribute' do
        expect(@simple_game.size).to eq(5)
    end

    it 'places princess in random corner' do
        four_corners = [@simple_game.grid[0][0], @simple_game.grid[0][-1], @simple_game.grid[-1][0], @simple_game.grid[-1][-1],]
        
        expect(four_corners.one? { |element| element == 'p'}).to eq(true)
    end

    it 'places hero in center of grid' do
        center_index = (@simple_game.grid.length / 2).floor

        expect(@simple_game.grid[center_index][center_index]).to eq('m')
    end

    it 'gets vertical direction to princess' do
        expect(@simple_game.get_vertical_directions(@simple_game.grid)).to eq("UP\n").or eq("DOWN\n")
    end

    it 'gets horizontal direction to princess' do
        expect(@simple_game.get_horizontal_directions(@simple_game.grid)).to eq("LEFT\n").or eq("RIGHT\n")
    end

    # For the test below, we explicitly define the coordinates of the princess and hero to avoid errors in testing due to the random corner position of the princess.
    
    it 'prints full path to princess' do
        @simple_game.grid = ['p--', '-m-', '---']
        @simple_game.size = 3
        expect { @simple_game.display_path_to_princess }.to output("UP\nLEFT\n").to_stdout
    end
end