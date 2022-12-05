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