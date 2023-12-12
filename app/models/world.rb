# frozen_string_literal: true

class World # rubocop:disable Style/Documentation
  attr_accessor :state

  def initialize
    if Cell.count.zero?
      Cell.create(x: 0, y: 0, alive: true)
      Cell.create(x: 2, y: 0, alive: true)
      Cell.create(x: 1, y: 1, alive: true)
      Cell.create(x: 2, y: 1, alive: true)
      Cell.create(x: 1, y: 2, alive: true)
    end
    @state = Cell.all
  end

  def display
    3.times do |y|
      3.times do |x|
        cell = @state.find { |c| c.x == x && c.y == y }
        print cell.nil? ? '.' : 'O'
      end
      puts
    end
  end

  def transform(number) # rubocop:disable Metrics/PerceivedComplexity,Metrics/AbcSize,Metrics/MethodLength,Metrics/CyclomaticComplexity
    number.times do # rubocop:disable Metrics/BlockLength
      live_neighbours = Hash.new(0)
      dead_neighbours = Hash.new(0)

      @state.each do |cell|
        neighbours = get_neighbours([cell.x, cell.y])

        neighbours.each do |neighbour|
          if @state.any? { |c| c.x == neighbour[0] && c.y == neighbour[1] }
            live_neighbours[neighbour] += 1
          else
            dead_neighbours[neighbour] += 1
          end
        end
      end

      live_neighbours.each do |key, value|
        if value < 2 || value > 3
          live_neighbours.delete(key)
        else
          live_neighbours[key] = 0
        end
      end

      dead_neighbours.each do |key, value|
        next unless value == 3

        live_neighbours[key] = 0
      end

      update_state(live_neighbours)
    end
  end

  def update_state(live_neighbours)
    @state = []
    Cell.delete_all
    live_neighbours.each_key do |key|
      @state << Cell.create(x: key[0], y: key[1], alive: true)
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
