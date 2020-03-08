# frozen_string_literal: true

class QueryStringsController < ApplicationController
  def show
    @categories = Restaurant.select(:category).distinct.order(:category).map(&:category)
    @category ||= params[:category]

    @restaurants = @category.present? ? Restaurant.where(category: @category) : Restaurant.all
  end
end
