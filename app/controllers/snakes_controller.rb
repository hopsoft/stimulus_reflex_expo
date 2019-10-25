# frozen_string_literal: true

class SnakesController < ApplicationController
  def show
    unless @stimulus_reflex
      session[:direction] = "right"
      session[:clock] = false
      session[:speed] = 0.2
      session[:grid_x] = 30
      session[:grid_y] = 30
      session[:length] = 4
      session[:snake] = []
      session[:start_x] = 50
      session[:start_y] = 50
      session[:food] = []
      session[:alive] = true
    end
    @grid_x = session[:grid_x] * 10 + 1
    @grid_y = session[:grid_y] * 10 + 1
  end
end
