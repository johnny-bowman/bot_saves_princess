require 'spec_helper'
require './lib/game'

RSpec.describe Game do
    before :each do
        @game = Game.new(5) 
    end

    it 'exists' do
        expect(@game).to be_an_instance_of(Game)
    end

    it 'has readable size attribute' do
        expect(@game.size).to eq(5)
    end

    it 'has readable grid attribute' do
        expect(@game.grid).to eq(['-----', '-----', '-----', '-----', '-----',])
    end

    it 'prints grid to terminal' do
        expect { @game.print_grid }.to output("-----\n" * 5).to_stdout
    end
end