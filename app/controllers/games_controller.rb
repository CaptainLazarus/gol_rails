# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @cells = Cell.all
  end

  def play
    transform_count = params[:transform_count].to_i
    world = World.new
    world.transform(transform_count)
    @cells = Cell.all
    respond_to do |format|
      format.js # This will look for a play.js.erb template
    end
  end

  def reset
    Cell.delete_all
    redirect_to games_path, notice: 'All cells reset!'
  end
end
