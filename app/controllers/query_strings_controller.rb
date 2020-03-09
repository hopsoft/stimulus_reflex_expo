# frozen_string_literal: true

class QueryStringsController < ApplicationController
  def show
    @categories = Restaurant.select(:category).distinct.order(:category).map(&:category)
    @category ||= params[:category]
    @rating ||= params[:rating]

    @restaurants = Restaurant.all
    @restaurants = @restaurants.where(category: @category) if @category.present?
    @restaurants = @restaurants.where(stars: @rating) if @rating.present?
  end
end
