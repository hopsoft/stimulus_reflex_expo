# frozen_string_literal: true

class TabularsController < ApplicationController
  include Pagy::Backend
  before_action :assign_variables

  def show
    restaurants = Restaurant.order(@order_by => @direction)
    restaurants = restaurants.search(@query) if @query.present?
    pages = (restaurants.count / Pagy::VARS[:items].to_f).ceil
    @page = 1 if @page > pages
    @pagy, @restaurants = pagy(restaurants, page: @page)
  end

  private

  def assign_variables
    @query ||= params[:query]
    @page ||= (params[:page] || 1).to_i
    @order_by ||= params[:order_by] || "name"
    @order_by = "name" unless %w[name stars price category].include?(@order_by)
    @direction ||= params[:direction] || "asc"
    @direction = "asc" unless %w[asc desc].include?(@direction)
  end
end
