# frozen_string_literal: true

require 'rails_helper'

RSpec.describe World do # rubocop:disable Metrics/BlockLength
  it 'initialises with a glider' do
    world = World.new
    expect(world.state).to eq(
      {
        [0, 0] => 0,
        [2, 0] => 0,
        [1, 1] => 0,
        [2, 1] => 0,
        [1, 2] => 0
      }
    )
  end

  it 'display the world' do
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
      world.transform(0)
      expect(world.state).to eq(
        {
          [0, 0] => 0,
          [2, 0] => 0,
          [1, 1] => 0,
          [2, 1] => 0,
          [1, 2] => 0
        }
      )
    end

    it 'transforms the world once' do
      world = World.new
      world.transform(1)
      expect(world.state).to eq(
        {
          [2, 0] => 0,
          [2, 1] => 0,
          [2, 2] => 0,
          [0, 1] => 0,
          [1, 2] => 0
        }
      )
    end
  end
  
end
