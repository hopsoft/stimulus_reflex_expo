# frozen_string_literal: true

class WorldGamesController < ApplicationController
  def show
    @countries = session[:world_game_countries] ||= []
    @score = @countries.count
  end
end
