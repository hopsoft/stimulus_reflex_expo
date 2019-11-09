# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  def search
    session[:query] = element[:value].strip
  end

  def order
    session[:order_by] = element.dataset["column-name"]
    session[:direction] = element.dataset["direction"]
  end

  def paginate
    session[:page] = element.dataset[:page].to_i
  end
end
