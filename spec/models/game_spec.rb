# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game do
  it 'has not started' do
    game = Game.new
    expect(game.started?).to be false
  end

  it 'has started' do
    game = Game.new
    game.play(1)
    expect(game.started?).to be true
  end
end
