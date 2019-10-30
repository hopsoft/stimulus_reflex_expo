module TodosHelper
  def filter_css(filter)
    "selected" if session[:filter] == filter.to_s
  end
end
