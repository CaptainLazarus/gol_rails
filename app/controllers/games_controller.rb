# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @cells = Cell.all
  end

  def play
    world = World.new
    world.transform(1)
    @cells = Cell.all
    respond_to do |format|
      format.js
      format.html { redirect_to games_path }
    end
  end

  def reset
    Cell.delete_all
    redirect_to games_path, notice: 'All cells reset!'
  end
end
