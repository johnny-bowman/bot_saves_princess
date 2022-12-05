require 'spec_helper'
require './lib/hacker_rank_bot_saves_princess'

RSpec.describe "Hacker Rank Solution 1" do
    before :each do
        @grid_1 = ['----p', '-----', '--m--', '-----', '-----']
        @grid_2 = ['p---', '-----', '--m--', '-----', '-----']
        @grid_3 = ['----', '-----', '--m--', '-----', 'p----']
        @grid_4 = ['----', '-----', '--m--', '-----', '----p']
    end

    it 'finds vertical direction towards princess' do
        expect(get_vertical_directions(@grid_1)).to eq("UP\n")
        expect(get_vertical_directions(@grid_2)).to eq("UP\n")
        expect(get_vertical_directions(@grid_3)).to eq("DOWN\n")
        expect(get_vertical_directions(@grid_4)).to eq("DOWN\n")
    end

    it 'finds horizontal direction towards princess' do
        expect(get_horizontal_directions(@grid_1)).to eq("RIGHT\n")
        expect(get_horizontal_directions(@grid_2)).to eq("LEFT\n")
        expect(get_horizontal_directions(@grid_3)).to eq("LEFT\n")
        expect(get_horizontal_directions(@grid_4)).to eq("RIGHT\n")
    end

    it 'displays full path to princess' do
        expect { displayPathtoPrincess(5, @grid_1) }.to output("UP\nUP\nRIGHT\nRIGHT\n").to_stdout
        expect { displayPathtoPrincess(5, @grid_2) }.to output("UP\nUP\nLEFT\nLEFT\n").to_stdout
        expect { displayPathtoPrincess(5, @grid_3) }.to output("DOWN\nDOWN\nLEFT\nLEFT\n").to_stdout
        expect { displayPathtoPrincess(5, @grid_4) }.to output("DOWN\nDOWN\nRIGHT\nRIGHT\n").to_stdout
    end
end