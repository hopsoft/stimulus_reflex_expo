# frozen_string_literal: true

module TabularsHelper
  include Pagy::Frontend

  def column_css(column_name)
    "selected" if column_name.to_s == @order_by
  end

  def arrow(column_name)
    return if column_name.to_s != @order_by
    @direction == "desc" ? "↑" : "↓"
  end
end
