# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  def search
    @query = session[:query] = element[:value].strip
    @order_by = session[:order_by]
    @direction = session[:direction]
  end

  def order
    @query = session[:query]
    @order_by = session[:order_by] = element.dataset["column-name"]
    @direction = session[:direction] = element.dataset["direction"]
  end
end
