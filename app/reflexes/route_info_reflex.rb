# frozen_string_literal: true

class RouteInfoReflex < ApplicationReflex
  def key
    key = element['data-filter-key'].to_sym
  end

  def clear_filter
    return unless element['data-filter-key']

    session[:route_filters].delete(key)
  end

  def filter
    return unless element['data-filter-key'] && element['value']

    session[:route_filters][key] = element['value']
  end
end
