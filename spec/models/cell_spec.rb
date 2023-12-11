# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cell, type: :model do
  it 'is initialised with the initial values' do
    cell = Cell.new(x: 0, y: 0, alive: true)
    expect(cell.x).to eq(0)
    expect(cell.y).to eq(0)
    expect(cell.alive).to eq(true)
  end
end
