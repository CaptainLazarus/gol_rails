# frozen_string_literal: true

require 'rails_helper'

RSpec.describe World do # rubocop:disable Metrics/BlockLength
  it 'is initialised in a db' do
    world = World.new
    world.state.each do |cell|
      expect(Cell.exists?(x: cell.x, y: cell.y, alive: true)).to be(true), "Record not found in the database for cell at (#{cell.x}, #{cell.y})" # rubocop:disable Layout/LineLength
    end
  end

  it 'initialises with a glider' do
    world = World.new
    expect { world.display }.to output(
      "O.O\n" \
      ".OO\n" \
      ".O.\n"
    ).to_stdout
  end

  describe 'transformations' do # rubocop:disable Metrics/BlockLength
    it 'transforms the world zero times' do
      world = World.new
      expected_state = world.state.map { |cell| { x: cell.x, y: cell.y, alive: cell.alive } }
      world.transform(0)
      actual_state = world.state.map { |cell| { x: cell.x, y: cell.y, alive: cell.alive } }

      expect(actual_state).to match_array(expected_state)
    end

    it 'transforms the world once' do
      world = World.new
      world.transform(1)
      actual_state = world.state.map { |cell| [cell.x, cell.y, cell.alive] }
      expect(actual_state).to match_array(
        [
          [0, 1, true],
          [1, 2, true],
          [2, 0, true],
          [2, 1, true],
          [2, 2, true]
        ]
      )
    end

    it 'counts the number of cells after n transformations' do
      world = World.new
      world.transform(1)
      expect(world.state.count).to eq(5)

      world.transform(2)
      expect(world.state.count).to eq(5)

      world.transform(3)
      expect(world.state.count).to eq(5)
    end
  end
end
