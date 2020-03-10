# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  def search
    @query = element[:value].strip
  end

  def order
    @order_by = permitted_column_name(element.dataset["column-name"])
    @direction = permitted_direction(element.dataset["direction"])
  end

  def paginate
    @page = element.dataset[:page].to_i
  end

  private

  def permitted_column_name(column_name)
    %w[name stars price category].find { |permitted| column_name == permitted } || "name"
  end

  def permitted_direction(direction)
    %w[asc desc].find { |permitted| direction == permitted } || "asc"
  end
end
