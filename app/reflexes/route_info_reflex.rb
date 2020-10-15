# frozen_string_literal: true

class RouteInfoReflex < ApplicationReflex
  def clear_filter
    return unless element['data-filter-key']

    key = element['data-filter-key'].to_sym
    session[:route_filters].delete(key)
  end

  def filter
    return unless element['data-filter-key'] && element['value']

    key = element['data-filter-key'].to_sym
    session[:route_filters][key] = element['value']
  end
end
