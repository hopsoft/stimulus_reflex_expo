# frozen_string_literal: true

module TodosHelper
  def filter_css(filter)
    "selected" if session[:todo_filter] == filter.to_s
  end
end
