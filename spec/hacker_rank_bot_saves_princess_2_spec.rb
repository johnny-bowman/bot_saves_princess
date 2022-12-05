require 'spec_helper'
require './lib/hacker_rank_bot_saves_princess_2'

RSpec.describe "Hacker Rank Solution 2" do
    before :each do
        @grid_1 = ['---p-', 'm----', '-----', '-----', '-----']
        @grid_2 = ['---m-', '-----', '--p--', '-----', '-----']
        @grid_3 = ['-----', '-----', '-----', '-m---', '--p--']
        @grid_4 = ['-p-', '---', 'm--']
    end

    it 'finds the princess row' do
        expect(get_princess_row(@grid_1)).to eq(0)
        expect(get_princess_row(@grid_2)).to eq(2)
        expect(get_princess_row(@grid_3)).to eq(4)
        expect(get_princess_row(@grid_4)).to eq(0)
    end

    it 'finds the princess column' do
        expect(get_princess_column(0, @grid_1)).to eq(3)
        expect(get_princess_column(2, @grid_2)).to eq(2)
        expect(get_princess_column(4, @grid_3)).to eq(2)
        expect(get_princess_column(0, @grid_4)).to eq(1)
    end

    it 'prints horizontal move towards princess' do
        expect { print_horizontal_move(0, 3) }.to output("RIGHT\n").to_stdout
        expect { print_horizontal_move(3, 2) }.to output("LEFT\n").to_stdout
        expect { print_horizontal_move(1, 2) }.to output("RIGHT\n").to_stdout
        expect { print_horizontal_move(0, 1) }.to output("RIGHT\n").to_stdout
    end

    it 'prints vertical move towards princess' do
        expect { print_vertical_move(1, 0) }.to output("UP\n").to_stdout
        expect { print_vertical_move(0, 2) }.to output("DOWN\n").to_stdout
        expect { print_vertical_move(3, 4) }.to output("DOWN\n").to_stdout
        expect { print_vertical_move(2, 0) }.to output("UP\n").to_stdout
    end
end