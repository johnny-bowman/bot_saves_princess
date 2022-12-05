require 'spec_helper'
require './lib/game'
require './lib/randomized_game'

RSpec.describe RandomizedGame do
    before :each do
        @randomized_game = RandomizedGame.new(5)
    end

    it 'exists and is a child of Game class' do
        expect(RandomizedGame).to be < Game
        expect(@randomized_game).to be_an_instance_of(RandomizedGame)
    end

    it 'has readable size attribute' do
        expect(@randomized_game.size).to eq(5)
    end

    it 'places princess in random position' do
        expect(@randomized_game.grid.one? { |element| element.include?('p') }).to eq(true)
    end

    it "places hero in random position not occupied by princess" do
        expect(@randomized_game.grid.one? { |element| element.include?('m') }).to eq(true)
        expect(@randomized_game.grid.one? { |element| element.include?('p') }).to eq(true)
    end

    # For the tests below, we explicitly define the princess and hero coordinates to avoid errors due to the random generation of princess and hero coordinates in the RandomizedGame class. 

    it 'finds number of vertical & horizontal steps to princess' do
        p_coordinates = @randomized_game.princess_coordinates = [4, 3]
        m_coordinates = @randomized_game.hero_coordinates = [2, 4]

        expect(@randomized_game.steps_to_princess(p_coordinates, m_coordinates)).to eq({vert_steps: -2, horiz_steps: 1})
    end

    it 'prints steps to princess' do
        @randomized_game.grid = ['----p', '-----', '-----', '--m--', '-----',]
        @randomized_game.princess_coordinates = [0, 4]
        @randomized_game.hero_coordinates = [3, 2]
        
        expect { @randomized_game.display_path_to_princess }.to output("UP\nUP\nUP\nRIGHT\nRIGHT\n").to_stdout

        different_game = RandomizedGame.new(3)
        different_game.grid = ['--m', '---', '-p-']
        different_game.princess_coordinates = [2, 1]
        different_game.hero_coordinates = [0, 2]
       
        expect { different_game.display_path_to_princess }.to output("DOWN\nDOWN\nLEFT\n").to_stdout
    end
end