# frozen_string_literal: true

class PermalinksController < ApplicationController
  def show
    @categories = Restaurant.select(:category).distinct.order(:category).map(&:category)
    @restaurants = Restaurant.category(params[:category]).stars(params[:rating]).price(params[:price])
  end
end
