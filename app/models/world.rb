# frozen_string_literal: true

# World object on which we perform the game of life transformations
class World
  attr_accessor :state

  def initialize
    @state = {
      [0, 0] => 0,
      [2, 0] => 0,
      [1, 1] => 0,
      [2, 1] => 0,
      [1, 2] => 0
    }
  end

  def display
    3.times do |y|
      3.times do |x|
        print @state[[x, y]]&.zero? ? 'O' : '.'
      end
      puts
    end
  end

  def transform(number)
    number.times do
      dead_neighbours = {}
      @state.each do |key, _value|
        get_neighbours(key).each do |neighbour|
          if @state[neighbour].nil?
            if dead_neighbours[neighbour].nil?
              dead_neighbours[neighbour] = 1
            else
              dead_neighbours[neighbour] += 1
            end
          else
            @state[neighbour] += 1
          end
        end
      end

      @state.each do |key, value|
        if value < 2 || value > 3
          @state.delete(key)
        else
          @state[key] = 0
        end
      end

      dead_neighbours.each do |key, value|
        @state[key] = 0 if value == 3
      end
    end
  end

  def get_neighbours(key)
    neighbours = []
    (-1..1).each do |x|
      (-1..1).each do |y|
        neighbours << [key[0] + x, key[1] + y] unless x.zero? && y.zero?
      end
    end
    neighbours
  end
end
