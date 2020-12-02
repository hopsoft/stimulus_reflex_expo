module Tabular
  extend ActiveSupport::Concern
  include Pagy::Backend

  protected

  def prepare_variables
    @query = params[:query]
    @order_by = permitted_column_name(params[:order_by])
    @direction = permitted_direction(params[:direction])

    restaurants = Restaurant.order(@order_by => @direction)
    restaurants = restaurants.search(@query) if @query.present?
    page_count = (restaurants.count / Pagy::VARS[:items].to_f).ceil

    @page = (params[:page] || 1).to_i
    @page = page_count if @page > page_count
    @page = 1 if @page < 1
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
