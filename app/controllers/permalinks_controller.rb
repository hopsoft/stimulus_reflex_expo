# frozen_string_literal: true

class PermalinksController < ApplicationController
  def show
    @categories = Restaurant.select(:category).distinct.order(:category).map(&:category)
    @category ||= @stimulus_reflex ? session[:category] : params[:category] 
    @rating ||= @stimulus_reflex ? session[:rating] : params[:rating]
    @price ||= @stimulus_reflex ? session[:price] : params[:price]&.split(",")

    @restaurants = Restaurant.all
    @restaurants = @restaurants.where(category: @category) if @category.present?
    @restaurants = @restaurants.where(stars: @rating) if @rating.present?
    @restaurants = @restaurants.where(price: @price) if @price.present?
  end
end
