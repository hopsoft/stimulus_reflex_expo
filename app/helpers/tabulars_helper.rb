# frozen_string_literal: true

module TabularsHelper
  def price_to_dollar_signs(price)
    "$" * price
  end

  def stars_to_symbol(stars)
    "★" * stars
  end

  def sort_css(sort)
    "selected" if session[:sort] == sort
  end

  def arrow(current_sort, sort, direction)
    return unless current_sort == sort
    direction == :reverse ? "↑" : "↓"
  end
end
