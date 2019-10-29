# frozen_string_literal: true

class TabularsController < ApplicationController
  include Pagy::Backend
  before_action :assign_variables

  def show
    restaurants = Restaurant.order(@order_by => @direction)
    restaurants = restaurants.search(@query) if @query.present?
    @pagy, @restaurants = pagy(restaurants, page: @page)
  end

  private

  def assign_variables
    @query = session[:query].to_s.strip
    @order_by = session[:order_by] = %w[name stars price category].find { |f| f == session[:order_by] } || "name"
    @direction = session[:direction] = %w[asc desc].find { |d| d == session[:direction] } || "asc"
    @page = session[:page] = params[:page] || session[:page]
  end
end
