# frozen_string_literal: true

class PermalinksController < ApplicationController
  def show
    @categories = Restaurant.select(:category).distinct.order(:category).map(&:category)

    unless @stimulus_reflex
      session[:category] = params[:category] || ""
      session[:rating] = params[:rating] || ""
      session[:price] = params[:price] || ""
    end

    @restaurants = Restaurant.category(session[:category]).stars(session[:rating]).price(session[:price])
  end
end
