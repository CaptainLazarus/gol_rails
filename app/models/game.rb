# frozen_string_literal: true

# The top level game model
class Game
  attr_accessor :started, :world

  def initialize
    @started = false
    @world = World.new
  end

  def started?
    @started
  end

  def play(number)
    @world.transform(number)
    @started = true
  end
end
