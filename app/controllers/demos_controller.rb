# frozen_string_literal: true

class DemosController < ApplicationController
  before_action :verify, only: [:show]
  before_action :setup_demo, only: [:show]

  private

  def verify
    filepath = Rails.root.join("app/views/demos/showcase/#{params[:id]}/_show.html.erb")
    render text: "NOT FOUND", status: :not_found unless File.exist?(filepath)
  end

  def setup_demo
    method_name = "setup_#{params[:id].to_s.underscore}"
    send method_name if respond_to?(method_name, true)
  end

  def setup_chat
    session[:chat_color] ||= "red"
    @chats ||= Rails.cache.read(:chats) || []
  end

  def setup_snake
    unless @stimulus_reflex
      session[:direction] = "right"
      session[:clock] = false
      session[:speed] = 0.1
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
