# frozen_string_literal: true

class DemosController < ApplicationController
  before_action :verify, only: [:show]

  def show
    case params[:id]
    when "snake"
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
        session[:food] = nil
        session[:alive] = true
      end
      @grid_x = session[:grid_x] * 10 + 1
      @grid_y = session[:grid_y] * 10 + 1
    end
  end

  private

  def verify
    filepath = Rails.root.join("app/views/demos/showcase/#{params[:id]}/_show.html.erb")
    render text: "NOT FOUND", status: :not_found unless File.exist?(filepath)
  end
end
