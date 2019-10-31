module TimeTravelsHelper
  def filter_css(filter)
    "selected" if session[:missions_filter] == filter.to_s
  end
end
