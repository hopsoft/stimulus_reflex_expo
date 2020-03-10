# frozen_string_literal: true

class TabularsController < ApplicationController
  include Pagy::Backend

  def show
    @query ||= params[:query]
    @order_by ||= permitted_column_name(params[:order_by])
    @direction ||= permitted_direction(params[:direction])
    @page ||= 1.to_i

    restaurants = Restaurant.order(@order_by => @direction)
    restaurants = restaurants.search(@query) if @query.present?
    pages = (restaurants.count / Pagy::VARS[:items].to_f).ceil

    @permalink = permalink(query: @query, order_by: @order_by, direction: @direction, page: @page)
    @page = 1 if @page > pages
    @pagy, @restaurants = pagy(restaurants, page: @page)
  end

  private

  def permitted_column_name(column_name)
    %w[name stars price category].find { |permitted| column_name == permitted } || "name"
  end

  def permitted_direction(direction)
    %w[asc desc].find { |permitted| direction == permitted } || "asc"
  end
end
