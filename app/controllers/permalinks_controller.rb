# frozen_string_literal: true

class PermalinksController < ApplicationController
  def show
    @categories = Restaurant.select(:category).distinct.order(:category).map(&:category)
    session[:category] ||= params[:category] unless @stimulus_reflex
    session[:rating] ||= params[:rating] unless @stimulus_reflex
    session[:price] ||= params[:price]&.split(",") unless @stimulus_reflex

    @restaurants = Restaurant.all
    @restaurants = @restaurants.where(category: session[:category]) if session[:category].present?
    @restaurants = @restaurants.where(stars: session[:rating]) if session[:rating].present?
    @restaurants = @restaurants.where(price: session[:price]) if session[:price].present?
  end
end
