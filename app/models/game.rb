# frozen_string_literal: true

# The top level game model
class Game
  attr_accessor :started

  def initialize
    @started = false
  end

  def started?
    @started
  end

  def play(_number)
    @started = true
  end
end
